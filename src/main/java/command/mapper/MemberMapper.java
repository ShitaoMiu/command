package command.mapper;

import java.util.HashMap;
import java.util.List;

import command.vo.DeptVo;
import command.vo.MemAuthVo;
import command.vo.MemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("memberMapper")
public interface MemberMapper {
	public List<MemAuthVo> selectMemberAuth(String menuId);
	public List<HashMap<String,Object>> selectMemGrpList();
	public List<HashMap<String, Object>> selectMemList(String memGrpId);
	public int ajaxMemAuth(MemAuthVo auth);
	public List<MemberVo> selectMemberList(MemberVo member);
	public int selectMemberCount(MemberVo member);
	public MemberVo selectMember(MemberVo member);
	public MemberVo selectMember(String memberId);
	public List<DeptVo> selectDeptList();
	public List<MemberVo> deptPerMemberList(String deptId); 
}
