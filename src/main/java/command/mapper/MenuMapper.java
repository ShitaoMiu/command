package command.mapper;

import java.awt.Menu;
import java.util.HashMap;
import java.util.List;

import command.vo.MenuVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("menuMapper")
public interface MenuMapper {

	public MenuVo selectOne(int menuId);

	public List<MenuVo> selectMenuList(String menuIdx);

	public int saveMenu(MenuVo menu);

	public int selctMaxMenuOrder(int parentMenuIdx);

	public int selectMaxMenuIdx();

	public List<MenuVo> selectChildList(int parentMenuIdx);

	public int upDateMenuOrder(HashMap<String, Object> paramMap);

//	public int deleteMenu(MenuVo menuVo);

	public int updateMenuUpDown(MenuVo menu);

	public List<Menu> selectSubMenus(int parentMenuIdx);
  
	public List<HashMap<String,Object>> selectTopMenus(int parentMenuIdx);

	public List<MenuVo> selectSubMenus(String inUrl);

	public List<String> selectMenuDeleteIdxList(MenuVo menuVo);

	public int deleteMenus(List<Integer> menuDeleteIdx);

}
