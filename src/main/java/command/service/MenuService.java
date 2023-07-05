package command.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import command.vo.MenuVo;

public interface MenuService {
	List<MenuVo> selectMenuList(String menuIdx);
	MenuVo selectOne(int i);
	int saveMenu(MenuVo menu);
	int selctMaxMenuOrder(int parentMenuIdx);
	int selectMaxMenuIdx();
 	List<MenuVo> selectChildList(int i);
	int upDateMenuOrder(HashMap<String, Object> paramMap);
	int updateMenuUpDown(MenuVo menu);
	List<MenuVo> selectSubMenus(String inUrl);
	List<HashMap<String,Object>> selectTopMenus(int parentMenuIdx);
	void changeOrderMenu(int menuIdx, String mode);
	List<String> selectMenuDeleteIdxList(MenuVo menuVo);
	int deleteMenus(List<Integer> menuDeleteIdx);

}
