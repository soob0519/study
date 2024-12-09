package donghwa.service;

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
	
}
