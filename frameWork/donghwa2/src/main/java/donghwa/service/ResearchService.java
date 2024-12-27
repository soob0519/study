package donghwa.service;

import java.util.List;

public interface ResearchService {
	
	// 저장처리
	public int insertResearch(ResearchVO vo) throws Exception;

	public List<?> selectResearchList(DefaultVO vo) throws Exception;
	
	
}
