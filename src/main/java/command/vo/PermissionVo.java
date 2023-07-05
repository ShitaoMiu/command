package command.vo;

public class PermissionVo {
	private String permissionId;
	private String permissionDelYn;

	public String getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(String permissionId) {
		this.permissionId = permissionId;
	}

	public String getPermissionDelYn() {
		return permissionDelYn;
	}

	public void setPermissionDelYn(String permissionDelYn) {
		this.permissionDelYn = permissionDelYn;
	}

	@Override
	public String toString() {
		return "PermissionVo [permissionId=" + permissionId + ", permissionDelYn=" + permissionDelYn + "]";
	}

}
