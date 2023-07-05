package command.service.impl;


import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import command.mapper.SiteFunctionMapper;
import command.service.SiteFunctionService;

@Service("siteFunctionService")
public class SiteFunctionServiceImpl implements SiteFunctionService{
	 @Resource(name="siteFunctionMapper")
	 private SiteFunctionMapper siteFunctionMapper;
 
}
