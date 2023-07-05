package command.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.ContentPageMapper;
import command.service.ContentPageService;
import command.vo.ContentsPageVo;

@Service("contentPageService")
public class ContentPageServiceImpl implements ContentPageService {
	 @Resource(name="contentPageMapper")
	 private ContentPageMapper contentPageMapper;

	@Override
	public List<ContentsPageVo> selectContentsPage(ContentsPageVo pageContentsVo) {
		return contentPageMapper.selectContentsPage(pageContentsVo);
	}

	@Override
	public ContentsPageVo selectContentPageDetail(ContentsPageVo pageContentsVo) {
		return contentPageMapper.selectPageContentDetail(pageContentsVo);
	}

	@Override
	public int saveContentPage(ContentsPageVo pageContentsVo) {
		return contentPageMapper.savePageContent(pageContentsVo);
	}

	@Override
	public int selectMaxPageContentIdx() {
		return contentPageMapper.selectMaxPageContentIdx();
	}

	 
}
