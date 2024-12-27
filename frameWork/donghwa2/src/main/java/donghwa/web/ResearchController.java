package donghwa.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghwa.service.DefaultVO;
import donghwa.service.ResearchService;
import donghwa.service.ResearchVO;

@Controller
public class ResearchController {
	
	@Resource(name="researchService")
	ResearchService researchService;
	
	@RequestMapping("/researchList.do")
	public String selectResearchList(DefaultVO vo,ModelMap model) throws Exception{
		
		List<?> list = researchService.selectResearchList(vo);
		model.addAttribute("list", list);
		
		return "admin/researchList";
	}
	
	@RequestMapping("/researchWrite.do")
	public String researchWrite() throws Exception{
		
		return "admin/researchWrite";
	}
	
	@RequestMapping("/researchInsert.do")
	@ResponseBody
	public String insertResearch(ResearchVO vo) throws Exception{
		
		String[] ans = vo.getAns();
		String[] ans101 = new String[10];
		
		for(int i=0 ; i<ans.length; i++) {
			System.out.println(ans[i]);
			ans101[i] = ans[i];
		}
		
		vo.setAns(ans101);
		
		String msg ="ok";
		int result = researchService.insertResearch(vo);
		if(result == 0) {
			msg ="fail";
		}
		
		return msg;
	}
	
}
