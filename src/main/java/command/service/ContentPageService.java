package command.service;

import java.util.HashMap;
import java.util.List;

import command.vo.ContentsPageVo;

public interface ContentPageService {

	List<ContentsPageVo> selectContentsPage(ContentsPageVo contentsPageVo);

	ContentsPageVo selectContentPageDetail(ContentsPageVo contentsPageVo);

	int saveContentPage(ContentsPageVo contentsPageVo);

	int selectMaxPageContentIdx();
 
}
