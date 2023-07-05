package command.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.SiteServerMapper;
import command.service.SiteServerService;

@Service("siteServerService")
public class SiteServerServiceImpl implements SiteServerService {
	 @Resource(name="siteServerMapper")
	 private SiteServerMapper siteServerMapper;
 
}
