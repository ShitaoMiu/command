package command.vo;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import egovframework.example.sample.service.SampleDefaultVO;

@SuppressWarnings("serial")
public class ContentsBoardOptionVo extends SampleDefaultVO {
	private int contentsBoardOpIdx;
	private String contentsBoardOpName;
	private String contentsBoardOpId;
	private String contentsBoardOpType;
	private String contentsIsBoardMeCert;
	private String contentsIsBoardSMS;
	private String contentsBoardCommentNum;
	private String contentsBoardNoticeNum;
	private List<ContentsBoardBanWordVo> banwordList;
	private List<ContentsBoardColumnVo> boardHeadList;
	private List<ContentsBoardColumnVo> boardContentList;
	public Integer getContentsBoardOpIdx() {
		return contentsBoardOpIdx;
	}
	public void setContentsBoardOpIdx(Integer contentsBoardOpIdx) {
		this.contentsBoardOpIdx = contentsBoardOpIdx;
	}
	public String getContentsBoardOpName() {
		return contentsBoardOpName;
	}
	public void setContentsBoardOpName(String contentsBoardOpName) {
		this.contentsBoardOpName = contentsBoardOpName;
	}
	public String getContentsBoardOpId() {
		return contentsBoardOpId;
	}
	public void setContentsBoardOpId(String contentsBoardOpId) {
		this.contentsBoardOpId = contentsBoardOpId;
	}
	public String getContentsBoardOpType() {
		return contentsBoardOpType;
	}
	public void setContentsBoardOpType(String contentsBoardOpType) {
		this.contentsBoardOpType = contentsBoardOpType;
	}
	public String getContentsIsBoardMeCert() {
		return contentsIsBoardMeCert;
	}
	public void setContentsIsBoardMeCert(String contentsIsBoardMeCert) {
		this.contentsIsBoardMeCert = contentsIsBoardMeCert;
	}
	public String getContentsIsBoardSMS() {
		return contentsIsBoardSMS;
	}
	public void setContentsIsBoardSMS(String contentsIsBoardSMS) {
		this.contentsIsBoardSMS = contentsIsBoardSMS;
	}
	public String getContentsBoardCommentNum() {
		return contentsBoardCommentNum;
	}
	public void setContentsBoardCommentNum(String contentsBoardCommentNum) {
		this.contentsBoardCommentNum = contentsBoardCommentNum;
	}
	public String getContentsBoardNoticeNum() {
		return contentsBoardNoticeNum;
	}
	public void setContentsBoardNoticeNum(String contentsBoardNoticeNum) {
		this.contentsBoardNoticeNum = contentsBoardNoticeNum;
	}
	public List<ContentsBoardBanWordVo> getBanwordList() {
		return banwordList;
	}
	public void setBanwordList(List<ContentsBoardBanWordVo> banwordList) {
		this.banwordList = banwordList;
	}
	public List<ContentsBoardColumnVo> getBoardHeadList() {
		return boardHeadList;
	}
	public void setBoardHeadList(List<ContentsBoardColumnVo> boardHeadList) {
		this.boardHeadList = boardHeadList;
	}
	public List<ContentsBoardColumnVo> getBoardContentList() {
		return boardContentList;
	}
	public void setBoardContentList(List<ContentsBoardColumnVo> boardContentList) {
		this.boardContentList = boardContentList;
	}
	@Override
	public String toString() {
		return "ContentsBoardOptionVo [contentsBoardOpIdx=" + contentsBoardOpIdx + ", contentsBoardOpName="
				+ contentsBoardOpName + ", contentsBoardOpId=" + contentsBoardOpId + ", contentsBoardOpType="
				+ contentsBoardOpType + ", contentsIsBoardMeCert=" + contentsIsBoardMeCert + ", contentsIsBoardSMS="
				+ contentsIsBoardSMS + ", contentsBoardCommentNum=" + contentsBoardCommentNum
				+ ", contentsBoardNoticeNum=" + contentsBoardNoticeNum + ", banwordList=" + banwordList
				+ ", boardHeadList=" + boardHeadList + ", boardContentList=" + boardContentList + "]";
	}
	 
	
	
	
	

 
}
