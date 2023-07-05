package command.vo;

public class DeptVo extends CommonVo{
	private String departId;
	private String departName;
	private String parentDepartId;
	private String departLevel;
	private String departDesc;
	public String getDepartId() {
		return departId;
	}
	public void setDepartId(String departId) {
		this.departId = departId;
	}
	public String getDepartName() {
		return departName;
	}
	public void setDepartName(String departName) {
		this.departName = departName;
	}
	public String getParentDepartId() {
		return parentDepartId;
	}
	public void setParentDepartId(String parentDepartId) {
		this.parentDepartId = parentDepartId;
	}
	public String getDepartLevel() {
		return departLevel;
	}
	public void setDepartLevel(String departLevel) {
		this.departLevel = departLevel;
	}
	public String getDepartDesc() {
		return departDesc;
	}
	public void setDepartDesc(String departDesc) {
		this.departDesc = departDesc;
	}
	@Override
	public String toString() {
		return "DeptVo [departId=" + departId + ", departName=" + departName + ", parentDepartId=" + parentDepartId
				+ ", departLevel=" + departLevel + ", departDesc=" + departDesc + "]";
	}
	
	
}
