package command.service;

import java.util.List;
import command.vo.SecurityBanIpVo;
public interface SiteSecurityBanIpService {

	int saveBanIp(SecurityBanIpVo securityBanIpVo);

	int maxBanIpIdx();

	List<SecurityBanIpVo> selectSecurityBoardList(SecurityBanIpVo securityBanIpVo);

	int selectSecurityCount(SecurityBanIpVo securityBanIpVo);

	int checkBanIp(String banIp);

	int insertBanIp(SecurityBanIpVo securityBanVo);

	int insertBanReason(SecurityBanIpVo securityBanVo);

	int banIpRemoveBanIp(String ip);


}
