package command.vo;

import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MenuAndResultMap {

	private MenuVo menu;
	private List<String> groupList;
	List<MemAuthVo> menuPerAuthlist;

	public MenuVo getMenu() {
		return menu;
	}

	public void setMenu(MenuVo menu) {
		this.menu = menu;
	}

	public List<String> getGroupList() {
		return groupList;
	}

	public void setGroupList(List<String> groupList) {
		this.groupList = groupList;
	}

	public List<MemAuthVo> getMenuPerAuthlist() {
		return menuPerAuthlist;
	}

	public void setMenuPerAuthlist(List<MemAuthVo> menuPerAuthlist) {
		this.menuPerAuthlist = menuPerAuthlist;
	}

	@Override
	public String toString() {
		return "MenuAndResultMap [menu=" + menu + ", groupList=" + groupList + ", menuPerAuthlist=" + menuPerAuthlist
				+ "]";
	}
	public String toJsonString() {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		return gson.toJson(this);
	}

}
