package donghwa.service;

import java.util.List;

public interface BoardService {
	
	List<?> selectBoardList(DefaultVO vo) throws Exception;

	int selectBoardTotal(DefaultVO vo)throws Exception;
	
	
}
