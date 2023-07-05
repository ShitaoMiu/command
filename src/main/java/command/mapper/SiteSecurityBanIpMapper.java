package command.mapper;

import java.util.List;

import command.vo.SecurityBanIpVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("siteSecurityBanIpMapper")
public interface SiteSecurityBanIpMapper {

	int saveBanIp(SecurityBanIpVo securityIpSetVo);

	int maxBanIpIdx();

	int selectSecurityCount(SecurityBanIpVo securityBanIpVo);

	List<SecurityBanIpVo> selectSecurityBoardList(SecurityBanIpVo securityBanIpVo);

	int checkBanIp(String banIp);

	int insertBanIp(SecurityBanIpVo securityBanVo);

	int insertBanReason(SecurityBanIpVo securityBanVo);

	int banIpRemoveBanIp(String ip);
 
}
