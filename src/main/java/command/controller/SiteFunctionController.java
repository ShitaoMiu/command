package command.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import command.service.SiteFunctionService;
import command.vo.ContentsPageVo;

@Controller
public class SiteFunctionController {
	
	@Resource(name = "siteFunctionService")
	private SiteFunctionService siteFunctionService;
	
	private static final Logger logger = LogManager.getLogger(SiteFunctionController.class);
  
	
	@RequestMapping(value ="/admin/site/function")
	public String siteFunction(HttpServletRequest request,ContentsPageVo contentsPageVo,ModelMap model) {
		return "/admin/site/function/siteFunctionSms.tiles";
	}
	 
	@RequestMapping(value ="/admin/site/function/sms")
	public String siteFunctionSms(HttpServletRequest request,ContentsPageVo contentsPageVo,ModelMap model) {
		return "/admin/site/function/siteFunctionSms.tiles";
	}
	
	@RequestMapping(value ="/admin/site/function/email")
	public String siteFunctionEmail(HttpServletRequest request,ContentsPageVo contentsPageVo,ModelMap model) {
		return "/admin/site/function/siteFunctionEmali.tiles";
	}
	
}
