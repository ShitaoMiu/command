package command.service;

import command.vo.SiteBasicVo;

public interface SiteBasicService {

	void saveSiteBasic(SiteBasicVo siteBasicVo);

	SiteBasicVo selectSiteBasic();

	long selectMaxSequence();
 

}
