package donghwa.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import donghwa.service.AdminfoVO;

@Mapper("adminfoMapper")
public interface AdminfoMapper {

	public int insertAdminfo(AdminfoVO vo);

	public int selectAdminfoUserid(AdminfoVO vo);

}
