package command.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import command.service.MemberService;
import command.vo.DeptVo;
import command.vo.MemberVo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MemberController {
	private static final Logger logger = LogManager.getLogger(MemberController.class);

	@Resource(name = "memberService")
	private MemberService memberService;

	@RequestMapping(value = "/admin/member")
	public String member(HttpServletRequest request) {
		return "/admin/member/member.tiles";
	}

	@RequestMapping(value = "/admin/member/members")
	public String members(@ModelAttribute("searchVO") MemberVo member, HttpServletRequest request, ModelMap model) {

		int totalCount = memberService.selectMemberCount(member);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(member.getPageIndex());
		paginationInfo.setRecordCountPerPage(member.getPageUnit());
		paginationInfo.setPageSize(member.getPageSize());
		paginationInfo.setTotalRecordCount(totalCount);

		member.setFirstIndex(paginationInfo.getFirstRecordIndex());
		member.setLastIndex(paginationInfo.getLastRecordIndex());
		member.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		List<MemberVo> memberList = memberService.selectMemberList(member);

		model.addAttribute("memberList", memberList);
		model.addAttribute("paginationInfo", paginationInfo);

		return "/admin/member/members.tiles";
	}

	@RequestMapping(value = "/admin/member/member/{memberId}")
	public String memberOne(@PathVariable String memberId, HttpServletRequest request, ModelMap model) {

		MemberVo member = memberService.selectMember(memberId);
		model.put("member", member);
		return "/admin/member/member.tiles";
	}

	@RequestMapping(value = "/admin/member/transMessage")
	public String memberTransMessage(HttpServletRequest request) {
		return "/admin/member/memberTransMessage.tiles";
	}

	@RequestMapping(value = "/admin/member/dept/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getDeptList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<>();

		try {
			List<DeptVo> deptList= memberService.selectDeptList();
			resultMap.put("deptList", deptList);
			Gson gson = new Gson();
			String json = gson.toJson(resultMap);
			return json;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "";

	}
	
	
	
	@RequestMapping(value = "/admin/member/dept/members", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deptTreeView(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<>();

		try {
			
			String deptId = request.getParameter("deptId") == null ? "" : request.getParameter("deptId");
			List<MemberVo> deptPerMemberList= memberService.deptPerMemberList(deptId);
			resultMap.put("deptPerMemberList", deptPerMemberList);
			Gson gson = new Gson();
			String json = gson.toJson(resultMap);
			return json;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "";

	}

}
