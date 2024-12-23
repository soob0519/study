package donghwa.service;

import java.util.List;

public interface GoodsService {
	
	int insertGoods(GoodsVO vo) throws Exception;

	List<?> selectGoodsList(DefaultVO vo) throws Exception;

	int selectGoodsTotal(DefaultVO vo) throws Exception;

	int deleteGoods(GoodsVO vo)throws Exception;
	// 상세보기 서비스
	GoodsVO selectGoodsDetail(GoodsVO vo) throws Exception;
	// 업데이트 서비스
	int updateGoods(GoodsVO vo) throws Exception;
	
	
	
}
