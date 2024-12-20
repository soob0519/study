package donghwa.service;

import java.util.List;

public interface GoodsService {
	
	int insertGoods(GoodsVO vo) throws Exception;

	List<?> selectGoodsList(DefaultVO vo) throws Exception;

	int selectGoodsTotal(DefaultVO vo) throws Exception;

	int deleteGoods(GoodsVO vo)throws Exception;
	
	
	
}
