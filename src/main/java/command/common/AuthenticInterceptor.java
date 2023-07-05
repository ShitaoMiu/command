package command.common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import command.controller.MenuController;
import command.service.MenuService;
import command.vo.MenuVo;
 
public class AuthenticInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LogManager.getLogger(MenuController.class);

	@Autowired
	private MenuService menuService;
		
	
		@Override
		    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		        try {
		        	logger.info("preHandle >>>  Controller 실행 전 실행");
					List<MenuVo> menuList = null;
			        List<HashMap<String,Object>> listMap = null;
					String inUrl = request.getRequestURI();   //프로젝트경로부터 파일까지의 경로값을 얻어옴 (/test/index.jsp)
			        List<String> urlList = Arrays.asList(inUrl.split("/"));
			        String siteUrl=urlList.get(1);;
			        if(siteUrl.equals("admin")) 
		        	{
			        	listMap= menuService.selectTopMenus(2);
		        	}
		        	else 
		        	{
		        		listMap= menuService.selectTopMenus(1);
		        	}
			         request.setAttribute("topListMap", listMap);
			         
		        	if(!inUrl.equals("/admin") && !inUrl.equals("/main")) 
		        	{
		        		String[] url = inUrl.split("/");
		        		if(url.length >2) 
		        		{
		        			inUrl = "/"+url[1]+"/"+url[2];
		        		}
		        		menuList = menuService.selectSubMenus(inUrl);
		        		List<MenuVo> paramList = new ArrayList<MenuVo>();
		        		List<MenuVo> subMenuList = null;
		        		
		        		
		        		for(int i=0;i<menuList.size() ;i++) 
		        		{  
		        			MenuVo menu = menuList.get(i);
		        			if(menu.getMenuLevel() ==2) 
		        			{
			        			subMenuList = new ArrayList<MenuVo>();
			        			for(int j=0;j<menuList.size();j++) 
				        		{
			        				 MenuVo childMenu = menuList.get(j);
			        		
				        		    if(menu.getMenuIdx() == childMenu.getParentMenuIdx()) 
				        		    {
				        			  	subMenuList.add(childMenu);
				        		    }
				        		}
			        			menu.setMenuList(subMenuList);
			        			paramList.add(menu);
			        		}
		        		}
		        		if(paramList.size() > 0) 
		        		{
		        			
		        			menuList.get(0).getParentMenuIdx();
		        			request.setAttribute("topMenuNm", menuService.selectOne(menuList.get(0).getParentMenuIdx()).getMenuNm());
		        			request.setAttribute("subList", paramList);
		        		}
		        	}
		        	}catch(Exception ex) 
			        {
		        		ex.printStackTrace();
			        }
		        return true;
		    }
		 
		    @Override
		    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modeAndView) throws Exception {
		    	logger.info("postHandle >>>  Controller 실행 후 실행");
		    }
		 
		    @Override
		    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex){
		    	logger.info("afterCompletion >>>  preHandle 메소드 return값이 true일 때 실행");
		    }
}
