package command.vo;

public class ContentsBoardBanWordVo extends CommonVo {
	private int contentsBoardOpIdx;
	private int contentsBoardBanIdx;
	private String contentsBoardBanword;
	public int getContentsBoardOpIdx() {
		return contentsBoardOpIdx;
	}
	public void setContentsBoardOpIdx(int contentsBoardOpIdx) {
		this.contentsBoardOpIdx = contentsBoardOpIdx;
	}
	public int getContentsBoardBanIdx() {
		return contentsBoardBanIdx;
	}
	public void setContentsBoardBanIdx(int contentsBoardBanIdx) {
		this.contentsBoardBanIdx = contentsBoardBanIdx;
	}
	public String getContentsBoardBanword() {
		return contentsBoardBanword;
	}
	public void setContentsBoardBanword(String contentsBoardBanword) {
		this.contentsBoardBanword = contentsBoardBanword;
	}
	@Override
	public String toString() {
		return "ContentsBoardBanWordVo [contentsBoardOpIdx=" + contentsBoardOpIdx + ", contentsBoardBanIdx="
				+ contentsBoardBanIdx + ", contentsBoardBanword=" + contentsBoardBanword + "]";
	}
	 
	 
 

}
