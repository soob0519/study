package donghwa.service;

import java.util.List;

public interface BoardService {
	
	List<?> selectBoardList(BoardVO vo) throws Exception;
	
	
}
