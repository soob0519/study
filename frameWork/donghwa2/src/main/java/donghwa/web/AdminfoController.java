package donghwa.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String admInsert(AdminfoVO vo) throws Exception {
		
		int result = adminfoService.insertAdminfo(vo);
		System.out.println("dddddddd   "+result);
		return "redirect:/admList.do";
	}
	


}
