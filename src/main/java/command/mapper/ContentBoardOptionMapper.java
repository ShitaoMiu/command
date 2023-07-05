package command.mapper;

import java.util.List;
import command.vo.ContentsBoardBanWordVo;
import command.vo.ContentsBoardColumnVo;
import command.vo.ContentsBoardOptionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("contentBoardOptionMapper")
public interface ContentBoardOptionMapper {

	int saveContentBoards(ContentsBoardOptionVo contentsBoardVo);

	int selectContentsBoardMaxIdx();

	int deleteContentsBoardBanWords(int contentBoardIdx);

	int saveContentsBoardBanWords(List<ContentsBoardBanWordVo> banList);

	int deleteContentsBoardColumns(int contentBoardIdx);

	int saveContentsBoardColumns(List<ContentsBoardColumnVo> columnList);

	List<ContentsBoardOptionVo> selectContentsBoardList(ContentsBoardOptionVo contentsBoardVo);

	int selectContentsBoardTotalCnt(ContentsBoardOptionVo contentsBoardVo);

	ContentsBoardOptionVo selectContentsBoardOne(int contentBoardIdx);

	List<ContentsBoardBanWordVo> selectContentsBoardBandWords(int contentBoardIdx);

	List<ContentsBoardColumnVo> selectContentsBoardColumnList(int contentBoardIdx);

}
