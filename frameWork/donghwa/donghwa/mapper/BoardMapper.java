package donghwa.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import donghwa.service.BoardVO;


@Mapper("boardMapper")
public interface BoardMapper {

	List<?> selectBoardList(BoardVO vo);


}
