package donghwa.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import donghwa.mapper.ResearchMapper;

@Service("researchService")
public class ResearchServiceImpl implements ResearchService {
	
	@Resource(name="researchMapper")
	ResearchMapper researchMapper;
	
	@Override
	public int insertResearch(ResearchVO vo) throws Exception {
		return researchMapper.insertResearch(vo);
	}

	@Override
	public List<?> selectResearchList(DefaultVO vo) throws Exception {
		return researchMapper.selectResearchList(vo);
	}

}
