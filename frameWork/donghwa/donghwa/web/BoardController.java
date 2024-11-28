package donghwa.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import donghwa.service.BoardService;
import donghwa.service.BoardVO;
import donghwa.service.DefaultVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	BoardService boardService;
	
	@RequestMapping(value="/boardList.do")
	public String selectBoardList(DefaultVO vo, ModelMap model) throws Exception {
		// 현재 출력 페이지 번호
		int pageIndex = vo.getPageIndex();
		int pageUnit = vo.getPageUnit();
		
		// 총 페이지 개수
		int total = boardService.selectBoardTotal(vo);
		int totalpage = (int)Math.ceil((double)total/pageUnit);
		
		// 출력 페이지의 시작번호
		int recordCountPerPage = total - (pageIndex-1)*pageUnit;
		
		// 1:1 , 2:11, 3:21
		// (1-1)*10+1 :: (현재페이지번호-1)*출력개수+1
		int firstIndex = (pageIndex-1)*pageUnit+1;
		int lastIndex = firstIndex+(pageUnit-1);
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		// 검색,페이징
		List<?> list = boardService.selectBoardList(vo);
		
		model.addAttribute("boardlist",list);
		model.addAttribute("total",total);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("recordCountPerPage",recordCountPerPage);
		
		// System.out.println("list============>"+list);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardDetail.do")
	public String selectBoardDetail() {
		return "board/boardDetail";
	}
	
}
