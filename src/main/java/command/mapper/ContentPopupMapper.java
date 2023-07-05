package command.mapper;

import java.util.HashMap;
import java.util.List;

import command.vo.ContentsPopupVo;
import command.vo.MenuVo;
import egovframework.example.cmmn.service.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("contentPopupMapper")
public interface ContentPopupMapper {

	void deleteEachFile(FileVO fileVo);

	void savePopup(ContentsPopupVo contentsPopupVo);

	List<ContentsPopupVo> selectList(ContentsPopupVo contentsPopupVo);

	ContentsPopupVo selectPopupOne(String popupIdx);

	int selectContentsBoardTotalCnt(Object popupIdx);

	int deletePopupOne(String popupIdx);

}
