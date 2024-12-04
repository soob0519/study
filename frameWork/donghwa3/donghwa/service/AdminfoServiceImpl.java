package donghwa.service;

import java.util.List;

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

	@Override
	public List<?> selectAdminfoList(DefaultVO vo) throws Exception {
		return adminfoMapper.selectAdminfoList(vo);
	}

	@Override
	public int selectAdminfoTotal(DefaultVO vo) throws Exception {
		return adminfoMapper.selectAdminfoTotal(vo);
	}

	@Override
	public int selectAdminfoUseridCnt(AdminfoVO vo) throws Exception {
		return adminfoMapper.selectAdminfoUseridCnt(vo);
	}

	@Override
	public int selectAdminGrade(AdminfoVO vo) throws Exception {
		return adminfoMapper.selectAdminGrade(vo);
	}
	
	
}
