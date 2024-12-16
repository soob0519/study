package donghwa.service;

import java.util.List;

public interface ScheduleService {
	
	// 스케줄 등록 서비스
	int insertSchedule(ScheduleVO vo) throws Exception;
	
	// 스케줄 삭제
	int deleteSchedule(ScheduleVO vo) throws Exception;
	
	// 스케줄 삭제
	int updateSchedule(ScheduleVO vo) throws Exception;
	
	// 출력 년/월의 예약 건수 목록
	List<?> selectScheduleListSchdt(ScheduleVO vo) throws Exception;
	
	// 출력 - 특정일의 예약 목록
	List<?> selectScheduleListEntry(String vdate) throws Exception;
	
	// 예약시간 중복체크
	int selectScheduleSchdtCnt(ScheduleVO vo) throws Exception;
	
	
}
