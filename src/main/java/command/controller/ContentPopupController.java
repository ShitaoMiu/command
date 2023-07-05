package command.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import command.service.ContentPopupService;
import command.vo.ContentsBoardOptionVo;
import command.vo.ContentsPopupVo;
import egovframework.example.cmmn.service.EgovFileMngService;
import egovframework.example.cmmn.service.FileVO;
import egovframework.example.util.EgovFileMngUtil;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ContentPopupController {

	private static final Logger logger = LogManager.getLogger(ContentPopupController.class);

	@Resource(name = "contentPopupService")
	private ContentPopupService contentPopupService;
	
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService egovFileMngService;
	
	
	
	@RequestMapping(value ="/admin/content/popup")
	public String contentPopup(ContentsPopupVo contentsPopupVo,HttpServletRequest request,ModelMap model) {
		return "redirect:/admin/content/popup/list";
	}
	
	
	@RequestMapping(value ="/admin/content/popup/list")
	public String contentPopupList(ContentsPopupVo contentsPopupVo,HttpServletRequest request,ModelMap model) {

		int totalCnt = contentPopupService.selectContentsBoardTotalCnt(contentsPopupVo);

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(contentsPopupVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(contentsPopupVo.getPageUnit());
		paginationInfo.setPageSize(contentsPopupVo.getPageSize());
		paginationInfo.setTotalRecordCount(totalCnt);

		contentsPopupVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		contentsPopupVo.setLastIndex(paginationInfo.getLastRecordIndex());
		contentsPopupVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<ContentsPopupVo> popupList = contentPopupService.selectList(contentsPopupVo);

		model.put("popupList", popupList);
		model.addAttribute("paginationInfo", paginationInfo);
  		
		return "/admin/content/popup/popupList.tiles";
	}
	@RequestMapping(value ="/admin/content/popup/popupOne/{popupIdx}")
	public String contentWriteForm( @PathVariable String popupIdx,ContentsPopupVo contentsPopupVo,HttpServletRequest request,ModelMap model) {
		ContentsPopupVo popupVo = null;

		if("-1".equals(popupIdx)) 
		{
			popupVo = new ContentsPopupVo();
		}else 
		{
			popupVo = contentPopupService.selectPopupOne(popupIdx);
		}
		model.put("popupVo", popupVo);
		return "/admin/content/popup/popup.tiles";
	}
	
	
	
	@RequestMapping(value ="/admin/content/popup/popupDelete/{popupIdx}")
	public String contentDelete( @PathVariable String popupIdx,ContentsPopupVo contentsPopupVo,HttpServletRequest request,ModelMap model) {
		contentPopupService.deletePopupOne(popupIdx);
		return "redirect:/admin/content/popup/list";
	}
	
	@RequestMapping(value ="/admin/content/popup/save")
	public String contentPopupSave(MultipartHttpServletRequest multiRequest,ContentsPopupVo contentsPopupVo,HttpServletRequest request,ModelMap model) throws Exception {

		List<FileVO> result = null;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
        String savePath =  "fileUploadPath";
        String popupFileId="";
        Map<String, MultipartFile> popupFileMap = new HashMap<>();
         for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {
            String key = entry.getKey();
            popupFileMap.put(key, entry.getValue());
        }
  		if (!popupFileMap.isEmpty()) {
 			result = fileUtil.parseFileInf(popupFileMap, "PopupFile_", 0, "", savePath);
 			popupFileId = egovFileMngService.insertFileInfs(result);
 		}
  		contentsPopupVo.setPopupFileId(popupFileId);
  		contentPopupService.savePopup(contentsPopupVo);
		return "redirect:/admin/content/popup/list";
	}
}