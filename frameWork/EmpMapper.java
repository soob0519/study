package egovframework.example.sample.service.impl;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.example.sample.service.EmpVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Mapper("empMapper")
public interface EmpMapper {
	List<?> selectEmpList(SampleDefaultVO defaultVO);
	int selectEmpTotal();
	int insertEmp(EmpVO vo);
	int selectEmpnoNew();
	List<?> selectEmpJobList();
	List<?> selectEmpMgrList();
}
