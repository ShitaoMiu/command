package command.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import command.service.ContentPageService;
import command.vo.ContentsPageVo;
 
@Controller
public class ContentPageController {
	
	@Resource(name = "contentPageService")
	private ContentPageService contentPageService;
	
	private static final Logger logger = LogManager.getLogger(ContentPageController.class);
  
	
	@RequestMapping(value ="/admin/content/page")
	public String contentpage(HttpServletRequest request,ContentsPageVo contentsPageVo,ModelMap model) {
		model.put("treeType", "page");
		return "/admin/content/page/page.tiles";
	}
	
	
	@RequestMapping(value = "/admin/content/page/{menuIdx}")
	public String contentPagePerList(@PathVariable String menuIdx,ContentsPageVo contentsPageVo,ModelMap model) {
		contentsPageVo.setMenuIdx(menuIdx);
		List<ContentsPageVo> contentsPageList = contentPageService.selectContentsPage(contentsPageVo);
		Optional<List<ContentsPageVo>> opcontentsPageList  =  Optional.of(contentsPageList);
		contentsPageList = opcontentsPageList.isPresent()? opcontentsPageList.get() : new ArrayList<ContentsPageVo>();
		model.put("contentsPageList", contentsPageList);
		model.put("treeType", "page");
		return "/admin/content/page/page.tiles";
	}
	

	@RequestMapping(value = "/admin/content/page/detail",  produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String contentPageDetail(ContentsPageVo contentsPageVo,HttpServletRequest request,ModelMap model) {
		String menuIdx = request.getParameter("menuIdx");
		String pageContentIdx = request.getParameter("pageContentIdx");
		contentsPageVo.setMenuIdx(menuIdx);
		contentsPageVo.setPageContentIdx(pageContentIdx);
		 HashMap<String,Object> resultMap = new HashMap<String,Object>();
		 ContentsPageVo pageContent = contentPageService.selectContentPageDetail(contentsPageVo);
		 resultMap.put("pageContent", pageContent);
		 Gson gson = new Gson();
		 String json = gson.toJson(resultMap);
		 return json;
	}
	
	
	
	@RequestMapping(value = "/admin/content/page/save")
	public String countPageSaveAjax(ContentsPageVo contentsPageVo,HttpServletRequest request,ModelMap model) {

		String pageMenuIdx = request.getParameter("pageMenuIdx");
		contentsPageVo.setMenuIdx(pageMenuIdx);
		if(contentsPageVo.getPageContentIdx() == null || "".equals(contentsPageVo.getPageContentIdx())) {
			int maxPageContentIdx =  contentPageService.selectMaxPageContentIdx();
			maxPageContentIdx  =maxPageContentIdx+1;
			contentsPageVo.setPageContentIdx(String.valueOf(maxPageContentIdx));
		}
		contentPageService.saveContentPage(contentsPageVo);
		return "redirect:/admin/content/page/"+contentsPageVo.getMenuIdx();
	}
}
