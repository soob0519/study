package donghwa.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import donghwa.mapper.AdminfoMapper;

@Service("adminfoService")
public class AdminfoServiceImpl implements AdminfoService {
	
	@Resource(name="adminfoMapper")
	AdminfoMapper adminfoMapper;
	
	@Override
	public int insertAdminfo(AdminfoVO vo) throws Exception {
		return adminfoMapper.insertAdminfo(vo);
	}

	@Override
	public int selectAdminfoUserid(AdminfoVO vo) throws Exception {
		return adminfoMapper.selectAdminfoUserid(vo);
	}
	
	
}
