package donghwa.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import donghwa.service.BoardService;
import donghwa.service.BoardVO;

@Controller
public class BoardController {
	@Resource(name="boardService")
	BoardService boardService;
	
	@RequestMapping(value="/boardList.do")
	public String selectBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		List<?> list = boardService.selectBoardList(vo);
		model.addAttribute("boardlist",list);
		
		System.out.println("list============>"+list);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardDetail.do")
	public String selectBoardDetail() {
		return "board/boardDetail";
	}
	
}
