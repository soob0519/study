package donghwa.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import donghwa.service.DefaultVO;
import donghwa.service.ScheduleVO;

@Mapper
public interface ScheduleMapper {

	int insertSchedule(ScheduleVO vo);
	List<?> selectScheduleListSchdt(ScheduleVO vo);
	List<?> selectScheduleListEntry(String vdate);
	int deleteSchedule(ScheduleVO vo);
	int updateSchedule(ScheduleVO vo);
	int selectScheduleSchdtCnt(ScheduleVO vo);
	
}
