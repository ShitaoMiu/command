package command.service;

import java.util.HashMap;
import java.util.List;

import command.vo.DeptVo;
import command.vo.MemAuthVo;
import command.vo.MemberVo;

public interface MemberService {
	 
	List<MemAuthVo> selectMemberAuth(String menuId);
	List<HashMap<String,Object>> selectMemGrpList();
	List<HashMap<String, Object>> selectMemList(String memGrpId);
	int ajaxMemAuth(MemAuthVo auth);
	List<MemberVo> selectMemberList(MemberVo member);
	int selectMemberCount(MemberVo member);
	MemberVo selectMember(String memberId);
	List<DeptVo> selectDeptList();
	List<MemberVo> deptPerMemberList(String deptId);
}
