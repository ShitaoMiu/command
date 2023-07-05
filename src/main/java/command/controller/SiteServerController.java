package command.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import command.service.SiteServerService;
import egovframework.example.cmmn.service.EgovFileMngService;
import egovframework.example.util.EgovFileMngUtil;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class SiteServerController {
	private static final Logger logger = LogManager.getLogger(SiteServerController.class);

	@Resource(name = "siteServerService")
	private  SiteServerService siteServerService;	
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService egovFileMngService;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping(value ="/admin/site/server/status")
	public String siteServerStatus(HttpServletRequest request,ModelMap modelMap) {
		return "/admin/site/security/siteSecurity.tiles";
	}
}
