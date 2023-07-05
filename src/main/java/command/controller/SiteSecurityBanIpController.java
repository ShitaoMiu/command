package command.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import command.common.IpUtil;
import command.service.SiteSecurityBanIpService;
import command.vo.SecurityBanIpVo;
import egovframework.example.cmmn.service.EgovFileMngService;
import egovframework.example.util.EgovFileMngUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
@Controller
public class SiteSecurityBanIpController {
	private static final Logger logger = LogManager.getLogger(SiteSecurityBanIpController.class);

	@Resource(name = "siteSecurityBanIpService")
	private SiteSecurityBanIpService siteSecurityBanIpService;	
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService egovFileMngService;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	@RequestMapping(value ="/admin/site/security")
	public String siteSecurity(HttpServletRequest request,ModelMap modelMap) {
		return "redirect:/admin/site/security/banIp";
	}
	
	
	@RequestMapping(value ="/admin/site/security/banIp")
	public String siteSecurityIpset(@ModelAttribute("searchVO") SecurityBanIpVo securityBanIpVo,HttpServletRequest request,ModelMap modelMap) {
		int totalCount = siteSecurityBanIpService.selectSecurityCount(securityBanIpVo);
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(securityBanIpVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(securityBanIpVo.getPageUnit());
		paginationInfo.setPageSize(securityBanIpVo.getPageSize());
		paginationInfo.setTotalRecordCount(totalCount);
		
		securityBanIpVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		securityBanIpVo.setLastIndex(paginationInfo.getLastRecordIndex());
		securityBanIpVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		List<SecurityBanIpVo> securityIpList = siteSecurityBanIpService.selectSecurityBoardList(securityBanIpVo);
		if(securityIpList.size()  >0) {
			int lastIdx = securityIpList.size()-1;
			SecurityBanIpVo compVo = null;
			for(int i=lastIdx;i>=0;i--) 
			{
				List<String> banMsgs =null;
				
				if(i ==lastIdx) 
				{
					compVo= securityIpList.get(i);	
					banMsgs =new ArrayList<String>();
					banMsgs.add(securityIpList.get(i).getBanMsg());
					securityIpList.get(i).setBanMsgs(banMsgs);
				}
				else 
				{	
					if(compVo.getBanIp().equals(securityIpList.get(i).getBanIp())) 
					{
						 banMsgs = compVo.getBanMsgs();
						 banMsgs.add(securityIpList.get(i).getBanMsg());
						 compVo.setBanMsgs(banMsgs);
						 securityIpList.remove(securityIpList.get(i));
					}else 
					{
						banMsgs =new ArrayList<String>();
						banMsgs.add(securityIpList.get(i).getBanMsg());
						securityIpList.get(i).setBanMsgs(banMsgs);
					}
				}
			}
		}
	 		modelMap.addAttribute("securityIpList", securityIpList);
		modelMap.addAttribute("paginationInfo", paginationInfo);
		return "/admin/site/security/banIp.tiles";
	}
	
	@RequestMapping(value ="/admin/site/security/banIp/save")
	public String siteSecurityIpsetSave(SecurityBanIpVo securityBanIpVo,HttpServletRequest request,ModelMap modelMap) {
		SecurityBanIpVo securityBanVo = new IpUtil().getIpInfo(securityBanIpVo);
		
		//기존 아이피가 있는지 확인 
		int sameCnt = siteSecurityBanIpService.checkBanIp(securityBanVo.getBanIp());
		//사유만 업그레이드 
		if(sameCnt > 0 ) 
		{
			siteSecurityBanIpService.insertBanReason(securityBanVo);
			
		}else 
		{
			siteSecurityBanIpService.insertBanIp(securityBanVo);
			siteSecurityBanIpService.insertBanReason(securityBanVo);
		}
		return "redirect:/admin/site/security/banIp";
	}
	@RequestMapping(value ="/admin/site/security/iplist")
	public String siteSecurityiplist(HttpServletRequest request,ModelMap modelMap) {
		return "/admin/site/security/iplist.tiles";
	}
	
	
	@RequestMapping(value ="/admin/site/security/banIp/notBan")
	@ResponseBody
	public String banIpRemoveBanIp(HttpServletRequest request) 
	{
		String ip = request.getParameter("ip");
		siteSecurityBanIpService.banIpRemoveBanIp(ip);
		return "redirect:/admin/site/security/banIp";
	}
	
	
	
	
}
