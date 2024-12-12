package donghwa.service;

import java.util.List;

public interface ScheduleService {
	
	// 스케줄 등록 서비스
	int insertSchedule(ScheduleVO vo) throws Exception;
	
	// 출력 년/월의 예약 건수 목록
	List<?> selectScheduleListSchdt(ScheduleVO vo) throws Exception;
	
	
	
	
}
