package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.EmpService;
import egovframework.example.sample.service.EmpVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Service("empService")
public class EmpServiceImpl implements EmpService {

	@Resource(name="empMapper")
	EmpMapper mapper;
	
	@Override
	public List<?> selectEmpList(SampleDefaultVO defaultVO) throws Exception {
		return mapper.selectEmpList(defaultVO);
	}

	@Override
	public int selectEmpTotal() throws Exception {
		return mapper.selectEmpTotal();
	}

	@Override
	public int insertEmp(EmpVO vo) throws Exception {
		return mapper.insertEmp(vo);
	}

	@Override
	public int selectEmpnoNew() throws Exception {
		return mapper.selectEmpnoNew();
	}

	@Override
	public List<?> selectEmpJobList() throws Exception {
		return mapper.selectEmpJobList();
	}

	@Override
	public List<?> selectEmpMgrList() throws Exception {
		return mapper.selectEmpMgrList();
	}

}
