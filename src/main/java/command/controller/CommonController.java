package command.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import command.service.CommonService;
import egovframework.example.cmmn.service.FileVO;

@Controller
public class CommonController {
	private static final Logger logger = LogManager.getLogger(CommonController.class);

	@Resource(name="commonService")
	private CommonService commonService;
	
	
	
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> uploadFile(MultipartFile[] fileList) {
		 
		try {
			String fileExtension = "";
			for (MultipartFile file : fileList) {
				logger.info(file.getOriginalFilename());
				fileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
						file.getOriginalFilename().length());
				String uploadFolder = "C:\\upload";
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				File saveFile = new File(uploadFolder + "\\" + uuids[0] + fileExtension); // 적용 후
				file.transferTo(saveFile);
			}
			return ResponseEntity.ok("File uploaded successfully");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading file");
		}
	}
	
	
	
	@RequestMapping(value = "/deteleEachFile.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deteleEachFile(HttpServletRequest request,HttpServletResponse response) {
		 
		try {
			String atchFileId = request.getParameter("atchFileId");
			String fileSn = request.getParameter("fileSn");
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId(atchFileId);
			fileVo.setFileSn(fileSn);
			commonService.deleteEachFile(fileVo);
			return ResponseEntity.ok("File delete successfully");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading file");
		}
	}
	
	
	
  
}
