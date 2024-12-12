package donghwa.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import donghwa.mapper.ScheduleMapper;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Resource(name="scheduleMapper")
	ScheduleMapper scheduleMapper;
	
	@Override
	public int insertSchedule(ScheduleVO vo) throws Exception{
		return scheduleMapper.insertSchedule(vo);
	}

	@Override
	public List<?> selectScheduleListSchdt(ScheduleVO vo) throws Exception {
		return scheduleMapper.selectScheduleListSchdt(vo);
	}
	
}
