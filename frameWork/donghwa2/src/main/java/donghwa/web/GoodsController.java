package donghwa.web;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import donghwa.service.GoodsService;
import donghwa.service.GoodsVO;

@Controller
public class GoodsController {

	@Resource(name="goodsService")
	GoodsService goodsService;
	
	@RequestMapping("/admGoodsWrite.do")    
	public String goodsWrite() {
		
		return "admin/admGoodsWrite";
	}

	@RequestMapping("/admGoodsInput.do")
	@ResponseBody
	public String insertGoods(   MultipartHttpServletRequest multiRequest
								,GoodsVO vo) throws Exception {
		
		String dirPath = "C:/eGovFrameDev-4.2.0-64bit/workspace/donghwa2/src/main/webapp/upload";

		// 서버의 특정공간에 임시저장된 파일맵을 새로운 맵에 담는다.
		Map map = multiRequest.getFileMap();
		
		// 새로운 맵에 있는 정보를 순차적으로 가져오기 위한 작업
		// iterator() 메소드에 hasNext(), next() 메소드가 속해있음.
		Iterator itr = map.entrySet().iterator();
		
		// 파일의 존재유무
		if( itr.hasNext() ) {	// 참(true)
			
			// 존재하는 곳으로 커서를 이동한다.
			Entry entry = (Entry) itr.next();
			
			// 서버의 특정공간에 임시저장된 파일하나를 가져온다.
			MultipartFile file = (MultipartFile) entry.getValue();
			
			// 임시저장된 파일의 진짜이름을 가져온다.
			String orgname = file.getOriginalFilename();
			
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getSize());
			System.out.println(file.getContentType());
			
			// 우리가 지정한 경로를 설정한다.
			String filePath = dirPath + "/" + orgname;
			
			// 우리가 지정한 경로로 파일을 옮긴다.
			file.transferTo(new File(filePath));
		
			// 파일이름을 VO에 담는다.
			vo.setFilename(orgname);
		}
		
		String msg = "ok";
		
		int result = goodsService.insertGoods(vo);
		if(result == 0) {
			msg = "fail";
		}
		return msg;
	}
}







