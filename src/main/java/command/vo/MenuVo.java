package command.vo;

import java.util.List;

public class MenuVo extends CommonVo {
	private int menuIdx;
	private String menuNm;
	private int parentMenuIdx;
	private int menuOrder;
	private String menuType;
	private int menuLevel;
	private String menuPath;
	private String menuDescription;
	private String menuUrl;
	private List<MenuVo> menuList;
	
	public List<MenuVo> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<MenuVo> menuList) {
		this.menuList = menuList;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public int getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(int menuIdx) {
		this.menuIdx = menuIdx;
	}

	public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	public int getParentMenuIdx() {
		return parentMenuIdx;
	}

	public void setParentMenuIdx(int parentMenuIdx) {
		this.parentMenuIdx = parentMenuIdx;
	}

	public int getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(int menuOrder) {
		this.menuOrder = menuOrder;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
 
	public int getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getMenuDescription() {
		return menuDescription;
	}

	public void setMenuDescription(String menuDescription) {
		this.menuDescription = menuDescription;
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

	@Override
	public String toString() {
		return "MenuVo [menuIdx=" + menuIdx + ", menuNm=" + menuNm + ", parentMenuIdx=" + parentMenuIdx + ", menuOrder="
				+ menuOrder + ", menuType=" + menuType + ", menuLevel=" + menuLevel + ", menuPath=" + menuPath
				+ ", menuDescription=" + menuDescription + ", menuUrl=" + menuUrl + ", menuList=" + menuList + "]";
	}

 
 

}
