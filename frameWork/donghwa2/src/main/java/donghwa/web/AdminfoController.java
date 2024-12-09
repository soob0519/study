package donghwa.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghwa.service.AdminfoService;
import donghwa.service.AdminfoVO;
import donghwa.service.DefaultVO;

@Controller
public class AdminfoController {

	@Resource(name="adminfoService")
	AdminfoService adminfoService;

	@RequestMapping(value="/admMain.do")
	public String admMain(HttpSession session) {

		String id    = session.getAttribute("SessionAdminUserid") + "";
		String grade = session.getAttribute("SessionAdminGrade")  + "";
		
		String src = "admin/admMain";
		
		//System.out.println("id :::::: " + id);
		
		if( id == null || id.equals("") || id.equals("null") ) {
			src = "redirect:/admLogin.do";
		}
		return src;
	}
	
	@RequestMapping(value="/admLogin.do")
	public String admLogin() {
		
		return "admin/admLogin";
	}
	

	@RequestMapping(value="/admWrite.do")
	public String admWrite() {
		
		return "admin/admWrite";
	}

	@RequestMapping(value="/admLogout.do")
	// 문자열 전달(화면)
	@ResponseBody
	public String admLogout(HttpSession session) {

		session.removeAttribute("SessionAdminUserid");
		session.removeAttribute("SessionAdminGrade");
		
		return "ok";
	}

	@RequestMapping(value="/admSession.do")
	// 메세지 전달
	@ResponseBody
	public String admSessionConfirm( AdminfoVO vo
									,HttpSession session) throws Exception {
		String msg = "";
		// 존재여부
		int cnt = adminfoService.selectAdminfoUseridCnt(vo);

		if(cnt == 0) {  // 존재하지 않음
			msg = "1";
		} else if(cnt == 1) {
			msg = "2";
			// 레벨 값 (1 ~ 3)
			int grade = adminfoService.selectAdminGrade(vo);

			//String SessionAdminUserid = "test12";
		    //String SessionAdminGrade = "2";
			session.setAttribute("SessionAdminUserid", vo.getUserid()); // ID
			session.setAttribute("SessionAdminGrade", grade); // 레벨
		}
		return msg;
	}

	@RequestMapping(value="/admList.do")
	public String admList(DefaultVO vo, ModelMap model) throws Exception {
		
		// 화면당 출력개수
		int pageUnit = vo.getPageUnit();
		
		// 출력페이지 번호
		int pageIndex = vo.getPageIndex();
		
		int total = adminfoService.selectAdminfoTotal(vo);
		// ex) 32/10 -> Math.ceil(3.2) -> (int)4.0 -> 4
		int totalpage = (int)Math.ceil((double)total/pageUnit);
		
		// 출력화면의 시작번호
		// ex) 32 :: 1->32~23 , 2->22~13, 3->12~3 , 4->2~1
		//           32-0     , 32-10   , 32-20   , 32-30
		int recordCountPerPage = total - (pageIndex-1)*pageUnit;
		
		// SQL의 출력 시작번호와 마지막번호
		// ex) 1page -> 1~10,  2page-> 11~20,    3page->21~30
		//     (1-1)*10+1-> 1, (2-1)*10+1 -> 11
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		int lastIndex  = firstIndex + (pageUnit-1);
		
		// VO에 세팅
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		List<?> list = adminfoService.selectAdminfoList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("recordCount", recordCountPerPage);

		return "admin/admList";
		
	}
	
	@RequestMapping(value="/admInsert.do")
	// 메세지 전달 어노테이션
	@ResponseBody
	public String insertAdminfo(AdminfoVO vo) throws Exception {
		
		String msg = "1"; // 저장성공
		
		String userid = vo.getUserid();
		String pattern = "^[a-zA-Z]{1}[0-9a-zA-Z]{3,11}";
		
		if( userid.matches(pattern) == false ) {
			msg = "2";  // 형식오류
		} else { 
			// 아이디 중복체크
			int result = adminfoService.selectAdminfoUserid(vo);
			if( result != 0 ) {
				msg = "4";  // 이미사용 중
			} else {
				int result2 = adminfoService.insertAdminfo(vo);
				if( result2 != 1 ) {  // 저장실패 
					msg = "3";
				}
			}
		}
		
		return msg;
	}
	
	/**
	 *  중복아이디 체크
	 */
	@RequestMapping(value="/admUseridCheck.do")
	// 메세지 전달 어노테이션
	@ResponseBody
	public String selectAdminfoUserid(AdminfoVO vo) throws Exception {
		
		String msg = "1"; // 사용가능
		
		// 정규표현식으로 형식 체크 : 4자 ~ 12자 : 영문+숫자 : 첫글자 영문
		String userid = vo.getUserid();
		if( userid.indexOf("%") > -1 ) {
			msg = "2";
		} else {
			String pattern = "^[a-zA-Z]{1}[0-9a-zA-Z]{3,12}";
			boolean result1 = userid.matches(pattern);
			
			if( result1 == false ) {
				msg = "2";    // 패턴오류
			}
		}
		// 사용중인 아이디가 없으면 => 0
		// 사용중인 아이디가 있으면 => 1
		int result = adminfoService.selectAdminfoUserid(vo);
		if( result != 0 ) {
			msg = "4";  // 이미사용중
		}
		
		return msg;
	}
	
	

}


