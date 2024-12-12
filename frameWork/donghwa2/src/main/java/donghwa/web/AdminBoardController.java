package donghwa.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghwa.service.BoardService;
import donghwa.service.BoardVO;
import donghwa.service.DefaultVO;

@Controller
public class AdminBoardController {

	@Resource(name="boardService")
	BoardService boardService;

	@RequestMapping(value="/admBoardWrite.do")
	public String admBoardWrite() {
		
		return "admin/admBoardWrite";
	}
	
	/**
	 * 게시물 저장처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admBoardSave.do")
	// 문자(열) 전달
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {
		
		String msg = "ok";
		System.out.println("============ save ===============");
		int cnt = boardService.insertBoard(vo);
		if( cnt == 0 ) {
			msg = "fail";
		}
		return msg;
	}

	///admBoardModify.do
	@RequestMapping("/admBoardModify.do")
	public String selectBoardDetail(BoardVO vo,ModelMap model)  throws Exception {
		
		BoardVO boardVO = boardService.selectBoardDetail(vo);
		model.addAttribute("boardVO", boardVO);
		
		System.out.println("title : " + boardVO.getTitle());
		System.out.println("writer : " + boardVO.getWriter());

		return "admin/admBoardModify";
	}
	
	@RequestMapping("/admBoardUpdate.do")
	@ResponseBody
	public String updateBoard(BoardVO vo) throws Exception {
		
		String msg = "ok";
		int cnt = boardService.updateBoard(vo);
		if( cnt == 0 ) {
			msg = "fail";
		}
		return msg;
	}
	
	// /admBoardDelete.do
	@RequestMapping("/admBoardDelete.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception {
		String msg = "ok";
		int cnt = boardService.deleteBoard(vo);
		if(cnt == 0) {
			msg = "fail";
		}
		return msg;
	}

	@RequestMapping("/admBoardList.do")
	public String selectBoardList(DefaultVO vo,ModelMap model) throws Exception {

		// 현재 출력 페이지 번호
		int pageIndex = vo.getPageIndex(); // default: 1
		int pageUnit = vo.getPageUnit();   // default: 10
		
		int total = boardService.selectBoardTotal(vo);
		
		// 총 페이지 수
		int totalpage = (int) Math.ceil((double)total/pageUnit);
		
		// 출력 페이지의 시작번호  ex) 3page -> 100 - (3-1)x10
		int recordCountPerPage = total - (pageIndex-1)*pageUnit;

		// 1:1 , 2:11, 3:21 ~~
		// (3-1)*10 + 1 :: (현재페이지번호-1)*출력개수 + 1
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		int lastIndex  = firstIndex + (pageUnit-1);
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		// 검색, 페이징
		List<?> list = boardService.selectBoardList(vo);
		
		System.out.println(list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("gubun", vo.getGubun());
		model.addAttribute("total", total);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("recordCount", recordCountPerPage);
		
		return "admin/admBoardList";
	}
}
