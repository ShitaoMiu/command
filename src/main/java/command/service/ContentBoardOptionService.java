package command.service;

import java.util.List;

import command.vo.ContentsBoardBanWordVo;
import command.vo.ContentsBoardColumnVo;
import command.vo.ContentsBoardOptionVo;

public interface ContentBoardOptionService {
	int saveContentBoards(ContentsBoardOptionVo boardSetting);
	int saveContentsBoardBanWords(List<ContentsBoardBanWordVo> banList);
	int selectContentsBoardMaxIdx();
	int saveContentsBoardColumns(List<ContentsBoardColumnVo> columnList);
	int deleteContentsBoardBanWords(List<ContentsBoardBanWordVo> banList);
	int deleteContentsBoardColumns(List<ContentsBoardColumnVo> columnList);
	int selectContentsBoardTotalCnt(ContentsBoardOptionVo contentsBoardVo);
	List<ContentsBoardOptionVo> selectContentsBoardList(ContentsBoardOptionVo contentsBoardVo);
	ContentsBoardOptionVo selectContentsBoardOne(int contentBoardIdx);
	List<ContentsBoardBanWordVo> selectContentsBoardBandWords(int contentBoardIdx);
	List<ContentsBoardColumnVo> selectContentsBoardColumnList(int contentBoardIdx);
}
