package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.EmpService;
import egovframework.example.sample.service.EmpVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class EmpController {

	@Resource(name="empService")
	EmpService empService;
	
	@Resource(name="sampleService")
	EgovSampleService egovSampleService;
	
	@RequestMapping(value="/empList.do")
	public String selectEmpList(ModelMap model, SampleDefaultVO defaultVO) throws Exception {
		
		// 화면 출력 단위(데이터)
		int pageUnit = defaultVO.getPageUnit();
		// 현재페이지 번호
		int pageIndex = defaultVO.getPageIndex();
		
		int total    = empService.selectEmpTotal();
		
		// 17/10 -> 1.7 -> ceil(1.7) -> 2.0 -> (int)2.0 -> 2
		int totalpage= (int)Math.ceil((double)total/pageUnit);
		
		// 현재 페이지의 시작 행번호 :: 지나간 페이지 개수 -> total-(현재페이지 번호 -1)*10
		int recordCountPerPage = total-(pageIndex-1)*pageUnit;
		
		// page index(1) = 1,page index(2) = 11
		// 1 -> (1-1)*10+1
		// 2 -> (2-1)*10+1
		// 3 -> (3-1)*10+1
		int firstIndex = (pageIndex-1)*pageUnit+1;
		int lastIndex = firstIndex+(pageUnit-1);
		
		defaultVO.setFirstIndex(firstIndex);
		defaultVO.setLastIndex(lastIndex);
		
		
		List<?> list = empService.selectEmpList(defaultVO);
		
		model.addAttribute("emplist", list);
		model.addAttribute("total", total);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("recordCountPerPage", recordCountPerPage);

		return "emp/empList";
	}
	
	@RequestMapping(value="/empWrite.do")
	public String empWrite(ModelMap model) throws Exception {
		int empno = empService.selectEmpnoNew();
		List<?> joblist = empService.selectEmpJobList();
		List<?> mgrlist = empService.selectEmpMgrList();
		List<?> deptlist = egovSampleService.selectDeptList();
		
		model.addAttribute("empno",empno);
		model.addAttribute("joblist",joblist);
		model.addAttribute("mgrlist",mgrlist);
		model.addAttribute("deptlist",deptlist);
		return "emp/empWrite";
	}
	
	@RequestMapping(value="/empSave.do")
	public String insertEmp(EmpVO vo) throws Exception {	
		
		System.out.print(vo.getHiredate());
		String hiredate = vo.getHiredate();
		String[] array = hiredate.split("/");
		
		String hiredate2 = array[2]+"-"+array[0]+"-"+array[1];
		vo.setHiredate(hiredate2);
		
		int result = empService.insertEmp(vo);
		if( result == 1 ) {
			System.out.println("저장결과:성공");
		} else {
			System.out.println("저장결과:실패");
		}
		return "redirect:/empList.do";
	}
	
}




