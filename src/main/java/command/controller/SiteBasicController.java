package command.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import command.service.SiteBasicService;
import command.vo.SiteBasicVo;
import egovframework.example.cmmn.service.EgovFileMngService;
import egovframework.example.cmmn.service.FileVO;
import egovframework.example.util.EgovFileMngUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
 

@Controller
public class SiteBasicController {
	private static final Logger logger = LogManager.getLogger(SiteBasicController.class);
 
	@Resource(name = "siteBasicService")
	private SiteBasicService siteBasicService;	
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService egovFileMngService;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping(value ="/admin/site/basic")
	public String siteBasic(HttpServletRequest request,ModelMap modelMap) {
		return "redirect:/admin/site/basic/info";
	}
	
	
	
	@RequestMapping(value ="/admin/site/basic/info")
	public String siteBasicInfo(HttpServletRequest request,ModelMap modelMap) {
		SiteBasicVo siteVo = siteBasicService.selectSiteBasic();
		Optional<SiteBasicVo> opSiteVo  = Optional.ofNullable(siteVo);
		SiteBasicVo siteBasicVo = opSiteVo.isPresent() ? opSiteVo.get() : new SiteBasicVo();
		modelMap.put("siteBasicVo",siteBasicVo);
		return "/admin/site/basic/siteBasic.tiles";
	}


	@RequestMapping(value="/admin/site/basic/save")
	public String siteBasicSave(MultipartHttpServletRequest multiRequest,SiteBasicVo siteBasicVo,ModelMap model) throws Exception 
	{
		List<FileVO> result = null;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
        String savePath =  "fileUploadPath";
        String faviconFileId="";
        String mainImgFileId="";
        
        Map<String, MultipartFile> faviFileMap = new HashMap<>();
        Map<String, MultipartFile> mainFileMap = new HashMap<>();
        
        for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {
            String key = entry.getKey();
            if (key.startsWith("favi_")) {
            	faviFileMap.put(key, entry.getValue());
            }
            else if(key.startsWith("main_")) 
            {
            	mainFileMap.put(key, entry.getValue());
            }
        }
  		if (!faviFileMap.isEmpty()) {
			result = fileUtil.parseFileInf(faviFileMap, "SiteFaviCon_", 0, "", savePath);
			faviconFileId = egovFileMngService.insertFileInfs(result);
		}
		
		if (!mainFileMap.isEmpty()) {
			result = fileUtil.parseFileInf(mainFileMap, "MainImgFile_", 0, "", savePath);
			mainImgFileId = egovFileMngService.insertFileInfs(result);
		}
		long insertIdx = 0;
		siteBasicVo.setFaviconFileId(faviconFileId);
		siteBasicVo.setMainImgFileId(mainImgFileId);
		if(siteBasicVo.getSiteBasicIdx() ==0) 
		{
			insertIdx = siteBasicService.selectMaxSequence();
			siteBasicVo.setSiteBasicIdx(insertIdx);
		}
		siteBasicService.saveSiteBasic(siteBasicVo);
		SiteBasicVo siteBasic = siteBasicService.selectSiteBasic(); 
		
		model.put("siteBasic", siteBasic);
		return "redirect:/admin/site/basic";
	}

}
