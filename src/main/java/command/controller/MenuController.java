package command.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import command.service.CommonService;
import command.service.MemberService;
import command.service.MenuService;
import command.vo.MemAuthVo;
import command.vo.MenuAndResultMap;
import command.vo.MenuVo;

@Controller
public class MenuController {
	private static final Logger logger = LogManager.getLogger(MenuController.class);

	@Resource(name = "menuService")
	private MenuService menuService;
	
	@Resource(name = "memberService")
	private MemberService memberService;

	
	@Resource(name="commonService")
	private CommonService commonService;

	
	
	@RequestMapping(value ="/admin/site/menu")
	public String menuPage(HttpServletRequest request,ModelMap model) {
		model.put("treeType", "menu");
//		commonService.sendEmail("yellowplace@naver.com", "jjangju1607@gmail.com", "testTitle", "testBody");
		return "/admin/site/menu/menu.tiles";
	}
	
	@RequestMapping(value = "/admin/site/menu/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuData(HttpServletRequest request) {
		List<MenuVo> menuList = null;
		Map<String, Object> resultMap = new HashMap<>();

		try {
			String topMenuIdx = request.getParameter("topMenuIdx");;
			List<MenuVo> list = menuService.selectMenuList(topMenuIdx);
			Optional<List<MenuVo>> optionalList = Optional.ofNullable(list);
			menuList = optionalList.isPresent() ? optionalList.get() : new ArrayList<MenuVo>();
			// 같은 부서는 menuOrder로 정렬한다
			resultMap.put("menuList", menuList);
			resultMap.put("type", 1);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		Gson gson = new Gson();
		String json = gson.toJson(resultMap);
		return json;
	}

	@RequestMapping(value = "/admin/site/menu/{menuId}", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuOne(@PathVariable String menuId, HttpServletRequest request, HttpServletResponse response) {
		MenuAndResultMap resultMap = new MenuAndResultMap();
		MenuVo menu = null;
		try {
			response.setCharacterEncoding("UTF-8");
			
			menu = menuService.selectOne(Integer.parseInt(menuId));
			Optional<MenuVo> opMenu = Optional.ofNullable(menu);
			menu = opMenu.isPresent() ? opMenu.get() : new MenuVo();
			List<MemAuthVo> menuPerAuthlist = memberService.selectMemberAuth(menuId);
			resultMap.setMenu(menu);
			resultMap.setMenuPerAuthlist(menuPerAuthlist);;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultMap.toJsonString();
	}


	
	
	@RequestMapping(value = "/admin/site/member/ajaxGrpList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxGrpList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<>();

		try {
		
			List<HashMap<String,Object>> groupList = memberService.selectMemGrpList();
			response.setCharacterEncoding("UTF-8");
			resultMap.put("result", "Y");
			resultMap.put("groupList", groupList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		Gson gson = new Gson();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	
	
 
	@RequestMapping(value = "/admin/site/member/ajaxGrpPerMemList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxGrpPerMemList(HttpServletRequest request, HttpServletResponse response) {
		String memGrpId = request.getParameter("memGrpId");
		Map<String, Object> resultMap = new HashMap<>();
		try {
			List<HashMap<String,Object>> groupPerMemList = memberService.selectMemList(memGrpId);
			response.setCharacterEncoding("UTF-8");
			resultMap.put("result", "Y");
			resultMap.put("groupPerMemList", groupPerMemList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		Gson gson = new Gson();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	
	
	@RequestMapping(value = "/admin/site/member/ajaxMemAuth", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxMemAuth(@ModelAttribute MemAuthVo auth,    HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			memberService.ajaxMemAuth(auth);
			response.setCharacterEncoding("UTF-8");
			resultMap.put("result", "Y");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		Gson gson = new Gson();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	
	

	@PostMapping(value = "/admin/site/menu/menus", produces = "text/html;charset=UTF-8")
	public void saveMenu(MenuVo menu,HttpServletResponse response) {
		try {
			// 추가
			if (menu.getMenuIdx() == -1) {
				int maxMenuIdx = menuService.selectMaxMenuIdx();
				int menuOrder = menuService.selctMaxMenuOrder(menu.getParentMenuIdx());
				menu.setMenuIdx(maxMenuIdx+1);
				menu.setMenuOrder( menuOrder+1);
				menu.setMenuLevel(menuService.selectOne(menu.getParentMenuIdx()).getMenuLevel()+1);
			}
			menuService.saveMenu(menu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/admin/site/menu/delMenus/{menuIdx}")
	public String deleteMenu(@PathVariable String menuIdx, RedirectAttributes redirectAttributes) {
		MenuVo menuVo = menuService.selectOne(Integer.parseInt(menuIdx));
		List<Integer> paramList = null;
		List<MenuVo> childList = null;
		List<Integer> menuDeleteIdx = new ArrayList<Integer>();
		menuDeleteIdx.add(menuVo.getMenuIdx());

		
		if(menuVo.getMenuLevel() ==1) 
		{
			//2뎁스 애들
			childList = menuService.selectChildList(menuVo.getMenuIdx());
			paramList = childList.stream().map(MenuVo::getMenuIdx).collect(Collectors.toList());
			menuDeleteIdx.addAll(paramList);

			for(MenuVo twoChildVo: childList) 
			{
				//3뎁스 애들
				childList = menuService.selectChildList(twoChildVo.getMenuIdx());
				paramList = childList.stream().map(MenuVo::getMenuIdx).collect(Collectors.toList());
				menuDeleteIdx.addAll(paramList);

				for(MenuVo threeChildVo:childList) 
				{
					//4뎁스 애들
					childList = menuService.selectChildList(threeChildVo.getMenuIdx());
					paramList = childList.stream().map(MenuVo::getMenuIdx).collect(Collectors.toList());
					menuDeleteIdx.addAll(paramList);
				}
			}
		}
		
		
		else if(menuVo.getMenuLevel() ==2) 
		{
			//2뎁스 애들
			childList = menuService.selectChildList(menuVo.getMenuIdx());
			paramList = childList.stream().map(MenuVo::getMenuIdx).collect(Collectors.toList());
			menuDeleteIdx.addAll(paramList);
			for(MenuVo threeChildVo: childList) 
			{
				childList = menuService.selectChildList(threeChildVo.getMenuIdx());
				paramList = childList.stream().map(MenuVo::getMenuIdx).collect(Collectors.toList());
				menuDeleteIdx.addAll(paramList);
			}
		
		}
		else if(menuVo.getMenuLevel() ==3) 
		{
			childList = menuService.selectChildList(menuVo.getMenuIdx());
			paramList = childList.stream().map(MenuVo::getMenuIdx).collect(Collectors.toList());
			menuDeleteIdx.addAll(paramList);
		}
		menuService.deleteMenus(menuDeleteIdx);
		return "/admin/site/menu/menu.tiles";
	}



	@RequestMapping(value="/admin/site/menu/order",produces = "text/html;charset=UTF-8")
	public String menuOrder(HttpServletRequest request) throws Exception
	{
		try { 
			String mode = request.getParameter("mode");
			int menuIdx =  Integer.parseInt(request.getParameter("menuIdx"));
		    menuService.changeOrderMenu(menuIdx,mode);
		    
		}
		catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		return "/admin/site/menu/menu.tiles";
	}
 }
