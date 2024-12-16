package donghwa.web;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghwa.mapper.ScheduleMapper;
import donghwa.service.DefaultVO;
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
		int cnt = scheduleService.selectScheduleSchdtCnt(vo);
		if(cnt >= 1) {
			msg = "already";
		} else {
			int result = scheduleService.insertSchedule(vo);
			if(result == 0) msg = "fail";
		}
		return msg;
	}
	
	@RequestMapping("/schList.do")
	public String schList(ScheduleVO vo,String vdate,ModelMap model) throws Exception {
		
		Map<String,String> map = new HashMap<String,String>();
		
		Calendar cal =  Calendar.getInstance();
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		String vdate2 = vdate;
		if(vdate == null || vdate.equals("")) {
			vdate = yy+"-"+mm;
		} else {
			// 형식이 2024-12-25인 경우
			String[] str = vdate.split("-");
			vdate = str[0]+"-"+str[1];
		}
		
		vo.setUserid("test1");
		vo.setSchdt(vdate);
		
		// 출력달력(년월)의 날짜들의 일정갯수
		List<?> list = scheduleService.selectScheduleListSchdt(vo);
		// System.out.println("=========================");
		// System.out.println(list);
		
		for(int i=0; i<list.size(); i++) {
			Map<String,Object> map1 = (Map<String,Object>)list.get(i);
			String dd = map1.get("DD")+"";
			String cnt = map1.get("CNT")+"";
			map.put(dd, cnt);
		}
		
		//특정날짜의 일정 목록을 얻는 서비스
		// vdate2 = "2024-12-1";
		if(vdate2 != null && vdate2.length() >= 8 ) {
			
			String[] str = vdate2.split("-");
			String strY = str[0];
			String strM = str[1];
			String strD = str[2];
			
			if(str[1].length() == 1) {
				strM = "0"+strM;
			}
			if(str[2].length() == 1) {
				strD = "0"+strD;
			}
			
			vdate2 = strY+"-"+strM+"-"+strD;
			
			List<?> list2 = scheduleService.selectScheduleListEntry(vdate2);
			model.addAttribute("list2",list2);
		}		
		
		model.addAttribute("myMap",map);
		System.out.println(map);
		
		return "admin/schList";
	}
	
	
	@RequestMapping("/schDelete.do")
	@ResponseBody
	public String deleteSchedule(ScheduleVO vo) throws Exception{
		
		// 스프링 : MVC 패턴 구조
		
		
		String msg = "ok";
		int cnt = scheduleService.deleteSchedule(vo);
		if(cnt != 1) {
			msg = "fail";
		}
		
		return msg;
	}
	

	@RequestMapping("/schUpdate.do")
	@ResponseBody
	public String updateSchedule(ScheduleVO vo) throws Exception{
		String msg = "ok";
		int result = scheduleService.updateSchedule(vo);
		if(result != 1) {
			msg = "fail";
		}
		return msg;
	}
	
	
}
