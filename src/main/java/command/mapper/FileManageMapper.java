package command.mapper;

import java.util.List;
import egovframework.example.cmmn.service.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("fileManageMapper")
public interface FileManageMapper {
	public List<FileVO> selectFileInfs(FileVO fvo);

	public void insertFileMaster(FileVO vo);

	public void insertFileDetail(FileVO vo);

	public void deleteFileInf(FileVO fvo);

	public FileVO selectFileInf(FileVO fvo);

	public int getMaxFileSN(FileVO fvo);

	public void deleteAllFileInf(FileVO fvo);

	public int selectFileListCntByFileNm(FileVO fvo);

	public List<FileVO> selectImageFileList(FileVO vo);

	public List<FileVO> selectFileListByFileNm(FileVO fvo);

	public void deleteFileInfs(FileVO vo);

	public List<FileVO> selectFileList(FileVO fvo);

	public void deleteFileDetail(FileVO vo);

	public void deleteCOMTNFILE(FileVO fvo);
}
