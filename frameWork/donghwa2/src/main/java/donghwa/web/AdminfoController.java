package donghwa.web;

import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghwa.service.AdminfoService;
import donghwa.service.AdminfoVO;
import donghwa.service.BoardService;
import donghwa.service.DefaultVO;

@Controller
public class AdminfoController {
	
	@Resource(name="adminfoService")
	AdminfoService adminfoService;

	@RequestMapping(value="/admLogin.do")
	public String admLogin() {
		return "admin/admLogin";
	}
	
	@RequestMapping(value="/admBoardWrite.do")
	public String admBoardWrite() {
		return "admin/admBoardWrite";
	}
	
	@RequestMapping(value="/admWrite.do")
	public String admWrite() {
		return "admin/admWrite";
	}
	
	@RequestMapping(value="/admList.do")
	public String admList(DefaultVO vo, ModelMap model) throws Exception {
		
		// 화면당 출력갯수
		int pageUnit = vo.getPageUnit();
		// 출력페이지 번호
		int pageindex = vo.getPageIndex();
		
		int total = adminfoService.selectAdminfoTotal(vo);
		// 32 3.2 -> 4
		int totalpage = (int)Math.ceil((double)total/10);
		
		// 출력화면의 시작번호
		// ex) 32:: 1p 32-23	/2p 22-13	/3p 12-3	/4p 2-1
		//			32-0		,32-10		,32-20		,32-30
		int recordCountPerPage = total - (pageindex-1)*10;
		
		// SQL의 출력 시작번호와 마지막번호
		// ex) (1-1)*10+1 -> 1, (2-1)*10+1 -> 2
		int firstIndex = (pageindex-1)*pageUnit+1;
		int lastIndex = firstIndex+(pageUnit-1);
		
		// VO에 세팅
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		List<?> list = adminfoService.selectAdminfoList(vo);
		model.addAttribute("list",list);
		model.addAttribute("total",total);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("recordCount",recordCountPerPage);
		
		return "admin/admList";
	}
	
	
	@RequestMapping(value="/admInsert.do")
	// 메세지 전달 어노테이션
	@ResponseBody
	public String admInsert(AdminfoVO vo) throws Exception {
		String msg = "1";	// 저장성공
		
		String userid= vo.getUserid();
		String pattern = "^[a-zA-Z]{1}[0-9a-zA-Z]{3,11}";
		
		if(userid.matches(pattern) == false) {
			msg="2";	// 형식오류
		} else {
			// 아이디 중복체크
			int result = adminfoService.selectAdminfoUserid(vo);
			if(result != 0) {
				msg="4";	// 이미 사용중인 아이디
			} else {
				int result2 = adminfoService.insertAdminfo(vo);
				if(result2 != 1) {	// 저장실패
					msg="3";
				}
			}
		}
		return msg;
	}
	
		/*
		 * 중복아이디 체크
		 */
	@RequestMapping(value="/admUseridCheck.do")
	// 메세지 전달 어노테이션
	@ResponseBody
	public String selectAdminfoUserid(AdminfoVO vo) throws Exception {
		
		String msg = "1";	// 저장성공
		
		// 정규표현식으로 형식 체크 : 4자리 ~ 12자리
		String userid = vo.getUserid();
		
		if(userid.indexOf("%") > -1) {
			msg="2";
		} else {
		
			String pattern = "^[a-zA-Z]{1}[0-9a-zA-Z]{3,11}";
			boolean result1 = userid.matches(pattern);
			if(result1 == false) {
				msg = "2";	// 패턴오류
			}
			int result = adminfoService.selectAdminfoUserid(vo);
			if(result != 0) {
				msg="4";	// 이미 사용중인 아이디
			}
		}
		
		return msg;
	
		}
}
