package command.vo;

public class MemAuthVo {

	private String id;
	private String memberId;
	private String menuIdx;
	private String canRead;
	private String canWrite;
	private String canDelete;
	private String canModify;
	private String canManage;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}

	public String getCanRead() {
		return canRead;
	}

	public void setCanRead(String canRead) {
		this.canRead = canRead;
	}

	public String getCanWrite() {
		return canWrite;
	}

	public void setCanWrite(String canWrite) {
		this.canWrite = canWrite;
	}

	public String getCanDelete() {
		return canDelete;
	}

	public void setCanDelete(String canDelete) {
		this.canDelete = canDelete;
	}

	public String getCanModify() {
		return canModify;
	}

	public void setCanModify(String canModify) {
		this.canModify = canModify;
	}

	public String getCanManage() {
		return canManage;
	}

	public void setCanManage(String canManage) {
		this.canManage = canManage;
	}

	@Override
	public String toString() {
		return "MemAuthVo [id=" + id + ", memberId=" + memberId + ", menuIdx=" + menuIdx + ", canRead=" + canRead
				+ ", canWrite=" + canWrite + ", canDelete=" + canDelete + ", canModify=" + canModify + ", canManage="
				+ canManage + "]";
	}

}
