package command.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import command.vo.MenuVo;
import egovframework.example.cmmn.service.FileVO;

public interface CommonService {

	void deleteEachFile(FileVO fileVo);
	void sendEmail(String toAddress, String fromAddress,	String subject, String msgBody);
}
