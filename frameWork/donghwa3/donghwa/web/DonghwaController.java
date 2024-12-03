package donghwa.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DonghwaController {

	@RequestMapping(value="/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/main.do")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping(value="/goodsList.do")
	public String selectGoodsList() {
		return "product/goodsList";
	}
	
	@RequestMapping(value="/sub1.do")
	public String sub1() {
		return "intro/sub1";
	}
	
	@RequestMapping(value="/sub2.do")
	public String sub2() {
		return "intro/sub2";
	}
	
	@RequestMapping(value="/sub3.do")
	public String sub3() {
		return "intro/sub3";
	}

}





