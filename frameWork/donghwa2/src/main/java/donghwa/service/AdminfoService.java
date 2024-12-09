package donghwa.service;

import java.util.List;

public interface AdminfoService {
   /**
	 * 관리자정보 등록처리 */
	int insertAdminfo(AdminfoVO vo) throws Exception;
	
	/**
	 * 아이디 중복 체크 */
	int selectAdminfoUserid(AdminfoVO vo) throws Exception;
	
	/**
	 * 관리자 목록
	 * @param vo
	 * @return List
	 * @throws Exception
	 */
	List<?> selectAdminfoList(DefaultVO vo) throws Exception;

	/**
	 * 관리자 계정의 총 개수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int selectAdminfoTotal(DefaultVO vo) throws Exception;

	/**
	 * 로그인 정보확인
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int selectAdminfoUseridCnt(AdminfoVO vo) throws Exception;

	/**
	 * 관리자의 레벨을 확인
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int selectAdminGrade(AdminfoVO vo) throws Exception;

}





