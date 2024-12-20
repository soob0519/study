package donghwa.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import donghwa.service.DefaultVO;
import donghwa.service.GoodsVO;

@Mapper("goodsMapper")
public interface GoodsMapper {

	int insertGoods(GoodsVO vo);
	List<?> selectGoodsList(DefaultVO vo);
	int selectGoodsTotal(DefaultVO vo);
	int deleteGoods(GoodsVO vo);

}
