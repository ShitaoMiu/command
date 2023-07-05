package command.vo;

public class ContentsPageVo extends CommonVo {

	private String pageContentIdx;
	private String pageMenuContents;
	private String pageContentEnables;
	private String writeDate;
	private String menuNm;
	private String menuIdx;
	public String getPageContentIdx() {
		return pageContentIdx;
	}
	public void setPageContentIdx(String pageContentIdx) {
		this.pageContentIdx = pageContentIdx;
	}
	public String getPageMenuContents() {
		return pageMenuContents;
	}
	public void setPageMenuContents(String pageMenuContents) {
		this.pageMenuContents = pageMenuContents;
	}
	public String getPageContentEnables() {
		return pageContentEnables;
	}
	public void setPageContentEnables(String pageContentEnables) {
		this.pageContentEnables = pageContentEnables;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public String getMenuIdx() {
		return menuIdx;
	}
	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}
	@Override
	public String toString() {
		return "ContentsPageVo [pageContentIdx=" + pageContentIdx + ", pageMenuContents=" + pageMenuContents
				+ ", pageContentEnables=" + pageContentEnables + ", writeDate=" + writeDate + ", menuNm=" + menuNm
				+ ", menuIdx=" + menuIdx + "]";
	}
 

}
