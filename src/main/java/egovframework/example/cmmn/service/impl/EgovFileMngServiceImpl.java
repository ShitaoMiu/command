package egovframework.example.cmmn.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import command.mapper.FileManageMapper;
import egovframework.example.cmmn.service.EgovFileMngService;
import egovframework.example.cmmn.service.FileVO;

 
@Service("EgovFileMngService")
public class EgovFileMngServiceImpl implements EgovFileMngService {

	@Resource(name ="fileManageMapper")
	private FileManageMapper fileManageMapper;
	
	/**
	 * 여러 개의 파일을 삭제한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#deleteFileInfs(java.util.List)
	 */
	@Override
	public void deleteFileInfs(List<?> fvoList) throws Exception {
		Iterator<?> iter = fvoList.iterator();
		FileVO vo;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			fileManageMapper.deleteFileDetail(vo);
		}
	}

	/**
	 * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#insertFileInf(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public String insertFileInf(FileVO fvo) throws Exception {
		String atchFileId = fvo.getAtchFileId();

		fileManageMapper.insertFileMaster(fvo);
		fileManageMapper.insertFileDetail(fvo);
		

		return atchFileId;
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#insertFileInfs(java.util.List)
	 */
	@Override
	public String insertFileInfs(List<?> fvoList) throws Exception {
		String atchFileId = "";

		if (fvoList.size() != 0) {
			FileVO vo = (FileVO) fvoList.get(0);
			atchFileId = vo.getAtchFileId();
			fileManageMapper.insertFileMaster(vo);
 		
			Iterator<?> iter = fvoList.iterator();
			while (iter.hasNext()) {
				vo = (FileVO) iter.next();
				fileManageMapper.insertFileDetail(vo);
			}
		}
		if (atchFileId == "") {
			atchFileId = null;
		}
		return atchFileId;
	}

	/**
	 * 파일에 대한 목록을 조회한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#selectFileInfs(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public List<FileVO> selectFileInfs(FileVO fvo) throws Exception {
		return fileManageMapper.selectFileList(fvo);
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#updateFileInfs(java.util.List)
	 */
	@Override
	public void updateFileInfs(List<?> fvoList) throws Exception {
		//Delete & Insert
		FileVO vo;
		Iterator<?> iter = fvoList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();
			fileManageMapper.insertFileDetail(vo);
		}
	}

	/**
	 * 하나의 파일을 삭제한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#deleteFileInf(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public void deleteFileInf(FileVO fvo) throws Exception {
		fileManageMapper.deleteFileDetail(fvo);
	}

	/**
	 * 파일에 대한 상세정보를 조회한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#selectFileInf(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public FileVO selectFileInf(FileVO fvo) throws Exception {
		return fileManageMapper.selectFileInf(fvo);
	}

	/**
	 * 파일 구분자에 대한 최대값을 구한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#getMaxFileSN(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public int getMaxFileSN(FileVO fvo) throws Exception {
		return fileManageMapper.getMaxFileSN(fvo);
	}

	/**
	 * 전체 파일을 삭제한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#deleteAllFileInf(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public void deleteAllFileInf(FileVO fvo) throws Exception {
		fileManageMapper.deleteCOMTNFILE(fvo);
	}

	/**
	 * 파일명 검색에 대한 목록을 조회한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#selectFileListByFileNm(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public Map<String, Object> selectFileListByFileNm(FileVO fvo) throws Exception {
		List<FileVO> result = fileManageMapper.selectFileListByFileNm(fvo);
		int cnt = fileManageMapper.selectFileListCntByFileNm(fvo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 이미지 파일에 대한 목록을 조회한다.
	 *
	 * @see egovframework.com.cmm.service.EgovFileMngService#selectImageFileList(egovframework.com.cmm.service.FileVO)
	 */
	@Override
	public List<FileVO> selectImageFileList(FileVO vo) throws Exception {
		return fileManageMapper.selectImageFileList(vo);
	}
}
