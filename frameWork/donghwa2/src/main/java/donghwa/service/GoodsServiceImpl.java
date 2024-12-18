package donghwa.service;

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
	

}
