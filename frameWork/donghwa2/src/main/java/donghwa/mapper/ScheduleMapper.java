package donghwa.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import donghwa.service.ScheduleVO;

@Mapper
public interface ScheduleMapper {

	int insertSchedule(ScheduleVO vo);
	
}
