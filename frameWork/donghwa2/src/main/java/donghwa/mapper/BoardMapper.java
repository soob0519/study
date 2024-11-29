package donghwa.mapper;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import donghwa.service.BoardVO;
import donghwa.service.DefaultVO;

@Mapper("boardMapper")
public interface BoardMapper {

	List<?> selectBoardList(DefaultVO vo);
	int selectBoardTotal(DefaultVO vo);
	BoardVO selectBoardDetail(BoardVO vo);

}
