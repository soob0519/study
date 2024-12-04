package donghwa.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import donghwa.service.AdminfoVO;
import donghwa.service.DefaultVO;

@Mapper("adminfoMapper")
public interface AdminfoMapper {

	public int insertAdminfo(AdminfoVO vo);

	public int selectAdminfoUserid(AdminfoVO vo);

	public List<?> selectAdminfoList(DefaultVO vo);

	public int selectAdminfoTotal(DefaultVO vo);

	public int selectAdminfoUseridCnt(AdminfoVO vo);

	public int selectAdminGrade(AdminfoVO vo);

}
