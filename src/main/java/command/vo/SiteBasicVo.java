package command.vo;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import egovframework.example.cmmn.service.FileVO;
import egovframework.example.sample.service.SampleDefaultVO;

@SuppressWarnings("serial")
public class SiteBasicVo extends SampleDefaultVO {
	private long siteBasicIdx;
	private String siteNm;
	private String siteAddr;
	private String siteSubAddr;
	private String siteExpl;
	private String siteOpenYN;
	private String loginStatusYN;
	private String faviconFileId;
	private String mainImgFileId;
	private String socialLoginYN;
	private String socialType;

	private List<FileVO> faviFileList;
	private List<FileVO> mainFileList;

	public long getSiteBasicIdx() {
		return siteBasicIdx;
	}

	public void setSiteBasicIdx(long siteBasicIdx) {
		this.siteBasicIdx = siteBasicIdx;
	}

	public String getSiteNm() {
		return siteNm;
	}

	public void setSiteNm(String siteNm) {
		this.siteNm = siteNm;
	}

	public String getSiteAddr() {
		return siteAddr;
	}

	public void setSiteAddr(String siteAddr) {
		this.siteAddr = siteAddr;
	}

	public String getSiteSubAddr() {
		return siteSubAddr;
	}

	public void setSiteSubAddr(String siteSubAddr) {
		this.siteSubAddr = siteSubAddr;
	}

	public String getSiteExpl() {
		return siteExpl;
	}

	public void setSiteExpl(String siteExpl) {
		this.siteExpl = siteExpl;
	}

	public String getSiteOpenYN() {
		return siteOpenYN;
	}

	public void setSiteOpenYN(String siteOpenYN) {
		this.siteOpenYN = siteOpenYN;
	}

	public String getLoginStatusYN() {
		return loginStatusYN;
	}

	public void setLoginStatusYN(String loginStatusYN) {
		this.loginStatusYN = loginStatusYN;
	}

	public String getFaviconFileId() {
		return faviconFileId;
	}

	public void setFaviconFileId(String faviconFileId) {
		this.faviconFileId = faviconFileId;
	}

	public String getMainImgFileId() {
		return mainImgFileId;
	}

	public void setMainImgFileId(String mainImgFileId) {
		this.mainImgFileId = mainImgFileId;
	}

	public String getSocialLoginYN() {
		return socialLoginYN;
	}

	public void setSocialLoginYN(String socialLoginYN) {
		this.socialLoginYN = socialLoginYN;
	}

	public String getSocialType() {
		return socialType;
	}

	public void setSocialType(String socialType) {
		this.socialType = socialType;
	}

	public List<FileVO> getFaviFileList() {
		return faviFileList;
	}

	public void setFaviFileList(List<FileVO> faviFileList) {
		this.faviFileList = faviFileList;
	}

	public List<FileVO> getMainFileList() {
		return mainFileList;
	}

	public void setMainFileList(List<FileVO> mainFileList) {
		this.mainFileList = mainFileList;
	}

	@Override
	public String toString() {
		return "SiteBasicVo [siteBasicIdx=" + siteBasicIdx + ", siteNm=" + siteNm + ", siteAddr=" + siteAddr
				+ ", siteSubAddr=" + siteSubAddr + ", siteExpl=" + siteExpl + ", siteOpenYN=" + siteOpenYN
				+ ", loginStatusYN=" + loginStatusYN + ", faviconFileId=" + faviconFileId + ", mainImgFileId="
				+ mainImgFileId + ", socialLoginYN=" + socialLoginYN + ", socialType=" + socialType + ", faviFileList="
				+ faviFileList + ", mainFileList=" + mainFileList + "]";
	}

}
