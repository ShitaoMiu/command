package command.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.SiteBasicMapper;
import command.service.SiteBasicService;
import command.vo.SiteBasicVo;
import egovframework.example.cmmn.service.FileVO;

@Service("siteBasicService")
public class SiteBasicServiceImpl implements SiteBasicService {
	 @Resource(name="siteBasicMapper")
	 private SiteBasicMapper siteBasicMapper;

	@Override
	public void saveSiteBasic(SiteBasicVo siteBasicVo) {
		siteBasicMapper.saveSiteBasic(siteBasicVo);
	}

	@Override
	public SiteBasicVo selectSiteBasic() {
		SiteBasicVo siteBasicVo = siteBasicMapper.selectSiteBasic();
		
		if(siteBasicVo != null) {
 		List<FileVO> faviFileList= siteBasicMapper.selectSiteBasicFaviFileList(siteBasicVo);
		List<FileVO> mainFileList= siteBasicMapper.selectSiteBasicMainFileList(siteBasicVo);

		Optional<List<FileVO>> optionalList = Optional.ofNullable(faviFileList);
 		faviFileList = optionalList.isPresent() ? optionalList.get() : new ArrayList<FileVO>();
 		siteBasicVo.setFaviFileList(faviFileList);

 		Optional<List<FileVO>> optionalList2 = Optional.ofNullable(mainFileList);
 		mainFileList = optionalList2.isPresent() ? optionalList2.get() : new ArrayList<FileVO>();
 		siteBasicVo.setMainFileList(mainFileList);
		
		}
		return siteBasicVo;
	}

	@Override
	public long selectMaxSequence() {
 		return siteBasicMapper.selectMaxSequence();  
	}
}
