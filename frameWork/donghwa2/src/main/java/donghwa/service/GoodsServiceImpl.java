package donghwa.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import donghwa.mapper.GoodsMapper;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	
	@Resource(name="goodsMapper")
	GoodsMapper goodsMapper;

	@Override
	public int insertGoods(GoodsVO vo) throws Exception {	
		return goodsMapper.insertGoods(vo);
	}

	@Override
	public List<?> selectGoodsList(DefaultVO vo) throws Exception {
		return goodsMapper.selectGoodsList(vo);
	}

	@Override
	public int selectGoodsTotal(DefaultVO vo) throws Exception {
		return goodsMapper.selectGoodsTotal(vo);
	}

	@Override
	public int deleteGoods(GoodsVO vo) throws Exception {
		return goodsMapper.deleteGoods(vo);
	}
	

}
