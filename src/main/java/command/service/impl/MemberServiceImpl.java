package command.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.MemberMapper;
import command.service.MemberService;
import command.vo.DeptVo;
import command.vo.MemAuthVo;
import command.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	 @Resource(name="memberMapper")
	 private MemberMapper memberMapper;
 

	@Override
	public List<MemAuthVo> selectMemberAuth(String menuId) {
		return memberMapper.selectMemberAuth(menuId);
	}
 
	@Override
	public List<HashMap<String,Object>> selectMemGrpList() {
		return memberMapper.selectMemGrpList();
	}

	@Override
	public List<HashMap<String, Object>> selectMemList(String memGrpId) {
		return memberMapper.selectMemList(memGrpId);
	}

	@Override
	public int ajaxMemAuth(MemAuthVo auth) {
		return memberMapper.ajaxMemAuth(auth);
	}

	@Override
	public List<MemberVo> selectMemberList(MemberVo member) {
		return memberMapper.selectMemberList(member);
	}

	@Override
	public int selectMemberCount(MemberVo member) {
		return memberMapper.selectMemberCount(member);
	}

	@Override
	public MemberVo selectMember(String memberId) {
		return memberMapper.selectMember(memberId);
	}

	@Override
	public List<DeptVo> selectDeptList() {
		return memberMapper.selectDeptList();
	}

	@Override
	public List<MemberVo> deptPerMemberList(String deptId) {
		return memberMapper.deptPerMemberList(deptId);
	}
 
}
