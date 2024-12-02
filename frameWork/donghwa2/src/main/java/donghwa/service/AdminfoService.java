package donghwa.service;

public interface AdminfoService {
	/*
	 * 관리자 정보 등록처리
	 */
	int insertAdminfo(AdminfoVO vo) throws Exception;
	
	/*
	 * 아이디 중복체크
	 */
	int selectAdminfoUserid(AdminfoVO vo) throws Exception;
}
