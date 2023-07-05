package command.service;

import java.util.List;

import command.vo.ContentsPopupVo;

public interface ContentPopupService {

	void savePopup(ContentsPopupVo contentsPopupVo);

	List<ContentsPopupVo> selectList(ContentsPopupVo contentsPopupVo);

	ContentsPopupVo selectPopupOne(String popupIdx);

	int selectContentsBoardTotalCnt(ContentsPopupVo contentsPopupVo);

	int deletePopupOne(String popupIdx);

}
