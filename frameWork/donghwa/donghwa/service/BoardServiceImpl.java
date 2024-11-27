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
	public List<?> selectBoardList(BoardVO vo) throws Exception {
		return boardMapper.selectBoardList(vo);
	}

}
