package donghwa.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import donghwa.mapper.BoardMapper;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
 
	@Resource(name="boardMapper")
	BoardMapper boardMapper;
	
	@Override
	public List<?> selectBoardList(DefaultVO vo) throws Exception {
		return boardMapper.selectBoardList(vo);
	}

	@Override
	public int selectBoardTotal(DefaultVO vo) throws Exception {
		return boardMapper.selectBoardTotal(vo);
	}

	@Override
	public BoardVO selectBoardDetail(BoardVO vo) throws Exception {
		return boardMapper.selectBoardDetail(vo);
	}

}




