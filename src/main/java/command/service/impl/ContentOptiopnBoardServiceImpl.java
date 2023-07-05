package command.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.ContentBoardOptionMapper;
import command.service.ContentBoardOptionService;
import command.vo.ContentsBoardBanWordVo;
import command.vo.ContentsBoardColumnVo;
import command.vo.ContentsBoardOptionVo;

@Service("contentBoardOptionService")
public class ContentOptiopnBoardServiceImpl implements ContentBoardOptionService {
	 @Resource(name="contentBoardOptionMapper")
	 private ContentBoardOptionMapper contentBoardOptionMapper;

	 @Override
		public int saveContentBoards(ContentsBoardOptionVo boardSettingVo) {
			return contentBoardOptionMapper.saveContentBoards(boardSettingVo);
		}

		@Override
		public int saveContentsBoardBanWords(List<ContentsBoardBanWordVo> banList) {
			return contentBoardOptionMapper.saveContentsBoardBanWords(banList);
		}

		@Override
		public int selectContentsBoardMaxIdx() {
			return contentBoardOptionMapper.selectContentsBoardMaxIdx();
		}

		
		
		@Override
		public int saveContentsBoardColumns(List<ContentsBoardColumnVo> columnList) {
			return contentBoardOptionMapper.saveContentsBoardColumns(columnList);
		}

		@Override
		public List<ContentsBoardOptionVo> selectContentsBoardList(ContentsBoardOptionVo contentsBoardVo) {
			return contentBoardOptionMapper.selectContentsBoardList(contentsBoardVo);
		}
		
		@Override
		public int selectContentsBoardTotalCnt(ContentsBoardOptionVo contentsBoardVo) {
			return contentBoardOptionMapper.selectContentsBoardTotalCnt(contentsBoardVo);
		}

		
		
		@Override
		public int deleteContentsBoardBanWords(List<ContentsBoardBanWordVo> banList) {
			return contentBoardOptionMapper.deleteContentsBoardBanWords(banList.get(0).getContentsBoardOpIdx());
		}

		@Override
		public int deleteContentsBoardColumns(List<ContentsBoardColumnVo> columnList) {
	 		return contentBoardOptionMapper.deleteContentsBoardColumns(columnList.get(0).getContentsBoardOpIdx());
		}
 

		@Override
		public ContentsBoardOptionVo selectContentsBoardOne(int contentBoardIdx) {
			return contentBoardOptionMapper.selectContentsBoardOne(contentBoardIdx);
		}

		@Override
		public List<ContentsBoardBanWordVo> selectContentsBoardBandWords(int contentBoardIdx) {
			return contentBoardOptionMapper.selectContentsBoardBandWords(contentBoardIdx);
		}

		@Override
		public List<ContentsBoardColumnVo> selectContentsBoardColumnList(int contentBoardIdx) {
			return contentBoardOptionMapper.selectContentsBoardColumnList(contentBoardIdx);
		}
}
