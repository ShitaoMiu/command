package command.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.ContentPopupMapper;
import command.service.ContentPopupService;
import command.vo.ContentsPopupVo;

@Service("contentPopupService")
public class ContentPopupServiceImpl implements ContentPopupService {
	@Resource(name = "contentPopupMapper")
	private ContentPopupMapper contentPopupMapper;

	@Override
	public void savePopup(ContentsPopupVo contentsPopupVo) {
		contentPopupMapper.savePopup(contentsPopupVo);	
	}

	@Override
	public List<ContentsPopupVo> selectList(ContentsPopupVo contentsPopupVo) {
		return 	contentPopupMapper.selectList(contentsPopupVo);
	}

	@Override
	public ContentsPopupVo selectPopupOne(String popupIdx) {
		return contentPopupMapper.selectPopupOne(popupIdx);
	}

	@Override
	public int selectContentsBoardTotalCnt(ContentsPopupVo contentsPopupVo) {
		return contentPopupMapper.selectContentsBoardTotalCnt(contentsPopupVo);
	}

	@Override
	public int deletePopupOne(String popupIdx) {
		return contentPopupMapper.deletePopupOne(popupIdx);
 	}
}
