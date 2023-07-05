package command.mapper;

import java.util.List;

import command.vo.SiteBasicVo;
import egovframework.example.cmmn.service.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("siteBasicMapper")
public interface SiteBasicMapper {
	void saveSiteBasic(SiteBasicVo siteBasicVo);
	SiteBasicVo selectSiteBasic();
	List<FileVO> selectSiteBasicFaviFileList(SiteBasicVo siteBasicVo);
	List<FileVO> selectSiteBasicMainFileList(SiteBasicVo siteBasicVo);
	long selectMaxSequence();
}
