package donghwa.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghwa.mapper.ScheduleMapper;
import donghwa.service.ScheduleService;
import donghwa.service.ScheduleVO;

@Controller
public class ScheduleController {
	
	@Resource(name="scheduleService")
	ScheduleService scheduleService;
	
	@RequestMapping("/schWrite.do")
	public String schWrite() {
		
		return "admin/schWrite";
	}
	
	@RequestMapping("/schSave.do")
	@ResponseBody
	public String insertSchedule(ScheduleVO vo) throws Exception {
		
		String msg ="ok";
		int result = scheduleService.insertSchedule(vo);
		if(result == 0) msg = "fail";
		
		return "admin/schWrite";
	}
	
}
