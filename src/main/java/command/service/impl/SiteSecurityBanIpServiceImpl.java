package command.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.SiteSecurityBanIpMapper;
import command.service.SiteSecurityBanIpService;
import command.vo.SecurityBanIpVo;

@Service("siteSecurityBanIpService")
public class SiteSecurityBanIpServiceImpl implements SiteSecurityBanIpService {
	 @Resource(name="siteSecurityBanIpMapper")
	 private SiteSecurityBanIpMapper siteSecurityBanIpMapper;

	@Override
	public int saveBanIp(SecurityBanIpVo securityBanIpVo) {
 		return siteSecurityBanIpMapper.saveBanIp(securityBanIpVo);
	}

	@Override
	public int maxBanIpIdx() {
		return siteSecurityBanIpMapper.maxBanIpIdx();
	}

	@Override
	public List<SecurityBanIpVo> selectSecurityBoardList(SecurityBanIpVo securityBanIpVo) {
 		return siteSecurityBanIpMapper.selectSecurityBoardList(securityBanIpVo);
	}

	@Override
	public int selectSecurityCount(SecurityBanIpVo securityBanIpVo) {
 		return siteSecurityBanIpMapper.selectSecurityCount(securityBanIpVo);

	}
 
	@Override
	public int checkBanIp(String banIp) {
 		return siteSecurityBanIpMapper.checkBanIp(banIp);
	}

	@Override
	public int insertBanIp(SecurityBanIpVo securityBanVo) {
		return siteSecurityBanIpMapper.insertBanIp(securityBanVo);
	}

	@Override
	public int insertBanReason(SecurityBanIpVo securityBanVo) {
		return siteSecurityBanIpMapper.insertBanReason(securityBanVo);

	}

	@Override
	public int banIpRemoveBanIp(String ip) {
		// TODO Auto-generated method stub
		return siteSecurityBanIpMapper.banIpRemoveBanIp(ip);
	}
 
}
