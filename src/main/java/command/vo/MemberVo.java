package command.vo;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import egovframework.example.sample.service.SampleDefaultVO;

@SuppressWarnings("serial")
public class MemberVo extends SampleDefaultVO {

	private String memberId;
	private String name;
	private String address;
	private String detailAddress;
	private String phone;
	private String tel;
	private String fax;
	private String email;
	private String sex;
	private String departPos;
	private String departName;
	private String departDesc;
	private String departId;
	private String joinDate;
	private String memberMemo;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDepartPos() {
		return departPos;
	}

	public void setDepartPos(String departPos) {
		this.departPos = departPos;
	}

	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	public String getDepartDesc() {
		return departDesc;
	}

	public void setDepartDesc(String departDesc) {
		this.departDesc = departDesc;
	}

	public String getDepartId() {
		return departId;
	}

	public void setDepartId(String departId) {
		this.departId = departId;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getMemberMemo() {
		return memberMemo;
	}

	public void setMemberMemo(String memberMemo) {
		this.memberMemo = memberMemo;
	}

	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", name=" + name + ", address=" + address + ", detailAddress="
				+ detailAddress + ", phone=" + phone + ", tel=" + tel + ", fax=" + fax + ", email=" + email + ", sex="
				+ sex + ", departPos=" + departPos + ", departName=" + departName + ", departDesc=" + departDesc
				+ ", departId=" + departId + ", joinDate=" + joinDate + ", memberMemo=" + memberMemo + "]";
	}

}
