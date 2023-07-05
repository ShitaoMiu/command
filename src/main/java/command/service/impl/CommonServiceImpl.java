package command.service.impl;

import javax.annotation.Resource;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import command.mapper.CommonMapper;
import command.service.CommonService;
import egovframework.example.cmmn.service.FileVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	@Resource(name = "commonMapper")
	private CommonMapper commonMapper;

	@Resource(name = "mailSender")
	private MailSender mailSender;

	@Override
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(fromAddress);
		smm.setTo(toAddress);
		smm.setSubject(subject);
		smm.setText(msgBody);
		mailSender.send(smm);
	}

	@Override
	public void deleteEachFile(FileVO fileVo) {
		commonMapper.deleteEachFile(fileVo);
	}

}
