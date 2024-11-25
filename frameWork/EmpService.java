package egovframework.example.sample.service;

import java.util.List;

public interface EmpService {
	
	/*
	 * 사원목록 출력
	 */
	List<?> selectEmpList(SampleDefaultVO defaultVO) throws Exception;

	/*
	 * 등록 사원번호 가져오기
	 */
	int selectEmpnoNew() throws Exception;
	
	/*
	 * 업무 가져오기
	 */
	List<?> selectEmpJobList() throws Exception;
	
	/*
	 * 매니저 가져오기
	 */
	List<?> selectEmpMgrList() throws Exception;
	
	/*
	 * 사원등록 개수
	 */
	int selectEmpTotal() throws Exception;
	
	/*
	 * 사원정보 등록
	 */
	int insertEmp(EmpVO vo) throws Exception; 
	
	
}





