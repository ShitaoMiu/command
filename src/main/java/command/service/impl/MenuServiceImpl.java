package command.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.MenuMapper;
import command.service.MenuService;
import command.vo.MenuVo;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	 @Resource(name="menuMapper")
	 private MenuMapper menuMapper;

	@Override
	public List<MenuVo> selectMenuList(String menuIdx) {
		List<MenuVo> menuList = menuMapper.selectMenuList(menuIdx);
		return menuList;
	}

	@Override
	public MenuVo selectOne(int menuId) {
		return menuMapper.selectOne(menuId);
	}

	@Override
	public int saveMenu(MenuVo menu) {

		return menuMapper.saveMenu(menu);
	}

	@SuppressWarnings("unused")
	@Override
	public int selctMaxMenuOrder(int parentMenuIdx) {
		Integer number = menuMapper.selctMaxMenuOrder(parentMenuIdx);
		return number;
	}

	@Override
	public int selectMaxMenuIdx() {
		return menuMapper.selectMaxMenuIdx();
	}

 

	@Override
	public List<MenuVo> selectChildList(int parentMenuIdx) {
 		return menuMapper.selectChildList(parentMenuIdx);
	}

	@Override
	public int upDateMenuOrder(HashMap<String,Object> paramMap) {
		
 		return menuMapper.upDateMenuOrder(paramMap);
	}

//	@Override
//	public int deleteMenu(MenuVo menuVo) {
//		return menuMapper.deleteMenu(menuVo); 
//	}

	@Override
	public int updateMenuUpDown(MenuVo menu) {
 		return menuMapper.updateMenuUpDown(menu);
	}

	@Override
	public void changeOrderMenu(int menuId, String mode) {
    HashMap<String,Object> paramMap= new HashMap<String,Object>();

    MenuVo menu = menuMapper.selectOne(menuId);
    List<MenuVo> aroundMenuList =menuMapper.selectChildList(menu.getParentMenuIdx());
    int currMenuIdx = -1;
    for(int i=0;i<aroundMenuList.size();i++) 
    {
    	if(menu.getMenuIdx() ==aroundMenuList.get(i).getMenuIdx()) 
    	{
    		currMenuIdx = i;
    		break;
    	}
    }
    int prevIdx = currMenuIdx-1;
    int nextIdx = currMenuIdx+1;

	if(mode.equals("up")) 
	{   MenuVo prevMenu = aroundMenuList.get(prevIdx);
		int prevOrder=prevMenu.getMenuOrder();
		int menuOrder= menu.getMenuOrder();
		System.out.println("이전 order"+prevOrder);
		System.out.println("현재 order"+menuOrder);
		
		prevMenu.setMenuOrder(menuOrder);
		menu.setMenuOrder(prevOrder);
		menuMapper.updateMenuUpDown(prevMenu);
		menuMapper.updateMenuUpDown(menu);
	}
	//down인 경우
	else 
	{     MenuVo nextMenu =  aroundMenuList.get(nextIdx);
		int nextOrder=nextMenu.getMenuOrder();
		int menuOrder= menu.getMenuOrder();
		System.out.println("현재 order"+menuOrder);
		System.out.println("다음 order"+nextOrder);
		nextMenu.setMenuOrder(menuOrder);
		menu.setMenuOrder(nextOrder);
		menuMapper.updateMenuUpDown(nextMenu);
		menuMapper.updateMenuUpDown(menu);
		
	}
 }
	@Override
	public List<HashMap<String,Object>> selectTopMenus(int parentMenuIdx) {
		 
		return menuMapper.selectTopMenus(parentMenuIdx);
	}
 
 

	@Override
	public List<MenuVo> selectSubMenus(String inUrl) {
		return menuMapper.selectSubMenus(inUrl);
	}

	@Override
	public List<String> selectMenuDeleteIdxList(MenuVo menuVo) {
		return menuMapper.selectMenuDeleteIdxList(menuVo);
	}

	@Override
	public int deleteMenus(List<Integer> menuDeleteIdx) {
		return menuMapper.deleteMenus(menuDeleteIdx);
	}
 

}
