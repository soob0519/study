package donghwa.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghwa.service.AdminfoService;
import donghwa.service.AdminfoVO;
import donghwa.service.BoardService;

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
	
	@RequestMapping(value="/admInsert.do")
	// 메세지 전달 어노테이션
	@ResponseBody
	public String admInsert(AdminfoVO vo) throws Exception {
		
		String msg = "ok";
		int result = adminfoService.insertAdminfo(vo);
		
		if(result != 1) {
			msg="fail";
		}
		
		return msg;
	}
	
		
	@RequestMapping(value="/admUseridCheck.do")
	// 메세지 전달 어노테이션
	@ResponseBody
	public String selectAdminfoUserid(AdminfoVO vo) throws Exception {
		
		String msg = "ok";
		int result = adminfoService.selectAdminfoUserid(vo);
		
		if(result != 0) {
			msg="fail";
		}
		
		return msg;
	}
	

}
