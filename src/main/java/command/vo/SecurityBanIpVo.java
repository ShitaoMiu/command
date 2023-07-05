package command.vo;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;

public class SecurityBanIpVo extends SampleDefaultVO {

	private String banIp;
	private String banMsg;
	private String city;
	private String region;
	private String country;
	private String loc;
	private String org;
	private String postal;
	private String timezone;
	private String banReason;
	private String regId;
	private String regDate;
	private List<String> banMsgs;
	public String getBanIp() {
		return banIp;
	}
	public void setBanIp(String banIp) {
		this.banIp = banIp;
	}
	public String getBanMsg() {
		return banMsg;
	}
	public void setBanMsg(String banMsg) {
		this.banMsg = banMsg;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getPostal() {
		return postal;
	}
	public void setPostal(String postal) {
		this.postal = postal;
	}
	public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
	public String getBanReason() {
		return banReason;
	}
	public void setBanReason(String banReason) {
		this.banReason = banReason;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public List<String> getBanMsgs() {
		return banMsgs;
	}
	public void setBanMsgs(List<String> banMsgs) {
		this.banMsgs = banMsgs;
	}
	@Override
	public String toString() {
		return "SecurityBanIpVo [banIp=" + banIp + ", banMsg=" + banMsg + ", city=" + city + ", region=" + region
				+ ", country=" + country + ", loc=" + loc + ", org=" + org + ", postal=" + postal + ", timezone="
				+ timezone + ", banReason=" + banReason + ", regId=" + regId + ", regDate=" + regDate + ", banMsgs="
				+ banMsgs + "]";
	}
	 
}
