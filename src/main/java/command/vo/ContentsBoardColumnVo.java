package command.vo;



public class ContentsBoardColumnVo extends CommonVo {

	private int contentsBoardOpIdx;
	private int contentsBoardColumnIdx;
	private String contentsBoardColumnType;
	private int contentsBoardColumnOrder;
	private String contentsBoardColumnName;
	public int getContentsBoardOpIdx() {
		return contentsBoardOpIdx;
	}
	public void setContentsBoardOpIdx(int contentsBoardOpIdx) {
		this.contentsBoardOpIdx = contentsBoardOpIdx;
	}
	public int getContentsBoardColumnIdx() {
		return contentsBoardColumnIdx;
	}
	public void setContentsBoardColumnIdx(int contentsBoardColumnIdx) {
		this.contentsBoardColumnIdx = contentsBoardColumnIdx;
	}
	public String getContentsBoardColumnType() {
		return contentsBoardColumnType;
	}
	public void setContentsBoardColumnType(String contentsBoardColumnType) {
		this.contentsBoardColumnType = contentsBoardColumnType;
	}
	public int getContentsBoardColumnOrder() {
		return contentsBoardColumnOrder;
	}
	public void setContentsBoardColumnOrder(int contentsBoardColumnOrder) {
		this.contentsBoardColumnOrder = contentsBoardColumnOrder;
	}
	public String getContentsBoardColumnName() {
		return contentsBoardColumnName;
	}
	public void setContentsBoardColumnName(String contentsBoardColumnName) {
		this.contentsBoardColumnName = contentsBoardColumnName;
	}
	@Override
	public String toString() {
		return "ContentsBoardColumnVo [contentsBoardOpIdx=" + contentsBoardOpIdx + ", contentsBoardColumnIdx="
				+ contentsBoardColumnIdx + ", contentsBoardColumnType=" + contentsBoardColumnType
				+ ", contentsBoardColumnOrder=" + contentsBoardColumnOrder + ", contentsBoardColumnName="
				+ contentsBoardColumnName + "]";
	}
	 

	 

}
