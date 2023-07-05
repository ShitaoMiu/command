package command.mapper;

import java.util.HashMap;
import java.util.List;

import command.vo.MenuVo;
import egovframework.example.cmmn.service.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonMapper")
public interface CommonMapper {

	void deleteEachFile(FileVO fileVo);

}
