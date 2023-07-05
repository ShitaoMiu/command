package command.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.ContentPostMapper;
import command.service.ContentPostService;

@Service("contentPostService")
public class ContentPostServiceImpl implements ContentPostService {
	 @Resource(name="contentPostMapper")
	 private ContentPostMapper contentPostMapper;
}
