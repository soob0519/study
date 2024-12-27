package donghwa.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import donghwa.service.DefaultVO;
import donghwa.service.ResearchVO;

@Mapper("researchMapper")
public interface ResearchMapper {

	int insertResearch(ResearchVO vo);
	List<?> selectResearchList(DefaultVO vo);
	
	
}
