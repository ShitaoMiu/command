package command.mapper;

import java.util.HashMap;
import java.util.List;

import command.vo.ContentsPageVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("contentPageMapper")
public interface ContentPageMapper {

	List<ContentsPageVo> selectContentsPage(ContentsPageVo pageContentsVo);

	ContentsPageVo selectPageContentDetail(ContentsPageVo pageContentsVo);

	int savePageContent(ContentsPageVo pageContentsVo);
	 
	int selectMaxPageContentIdx();
	
	
	
}
