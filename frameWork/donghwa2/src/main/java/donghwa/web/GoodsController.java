package donghwa.web;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import donghwa.service.DefaultVO;
import donghwa.service.GoodsService;
import donghwa.service.GoodsVO;

@Controller
public class GoodsController {
	
	public static String dirPath = "C:/eGovFrameDev-4.2.0-64bit/workspace/donghwa3/src/main/webapp/upload";
	
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
		
		String msg = "ok";
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
			
			// 1byte
			
			int filesize = (int)file.getSize();
			int maxsize = 1024*1024*50;
			
			if(filesize>maxsize) {
				msg = "over";
			} else if(filesize > 0) {
				// 우리가 지정한 경로를 설정한다.
				String filePath = dirPath + "/" + orgname;
				
				// 우리가 지정한 경로로 파일을 옮긴다.
				file.transferTo(new File(filePath));
			
				// 파일이름을 VO에 담는다.
				vo.setFilename(orgname);
			}
		}
		
		if(msg != "over") {
			int result = goodsService.insertGoods(vo);
			if(result == 0) {
				msg = "fail";
			}
		}
		return msg;
	}
	
	@RequestMapping(value="/admGoodsUpdate.do")
	@ResponseBody
	public String updateGoods(MultipartHttpServletRequest multiRequest,GoodsVO vo) throws Exception {
		String msg ="ok";
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
			// 암호화된 파일을 실제 인식
			MultipartFile file = (MultipartFile) entry.getValue();
			// 임시저장된 파일의 진짜이름을 가져온다.
			String orgname = file.getOriginalFilename();
			
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getSize());
			System.out.println(file.getContentType());
			
			// 1byte
			
			int filesize = (int)file.getSize();
			int maxsize = 1024*1024*50;
			
			if(filesize>maxsize) {
				msg = "over";
			} else if(filesize > 0) { // 파일을 변경하겠다는 뜻
				String filename = vo.getFilename();
				// 기존파일삭제
				String delPath = dirPath+"/"+filename;
				File delfile = new File(delPath);
				delfile.delete(); // 파일 삭제
				
				// 우리가 지정한 경로를 설정한다.
				String filePath = dirPath + "/" + orgname;
				// 우리가 지정한 경로로 파일을 옮긴다.
				file.transferTo(new File(filePath));
				// 파일이름을 VO에 담는다.
				vo.setFilename(orgname);
			}
		}
		
		if(msg != "over") {
			int result = goodsService.updateGoods(vo);
			if(result == 0) {
				msg = "fail";
			}
		}
		return msg;
	}
	
	
	@RequestMapping("/admGoodsList.do")    
	public String selectGoodsAdmList(DefaultVO vo,ModelMap model) throws Exception {
		// 현재 출력 페이지 번호
		int pageIndex = vo.getPageIndex(); // default: 1
		int pageUnit = 10;   // default: 10
		
		int total = goodsService.selectGoodsTotal(vo);
		
		// 총 페이지 수
		int totalpage = (int) Math.ceil((double)total/pageUnit);
		
		// 출력 페이지의 시작번호  ex) 3page -> 100 - (3-1)x10
		int recordCountPerPage = total - (pageIndex-1)*pageUnit;

		// 1:1 , 2:11, 3:21 ~~
		// (3-1)*10 + 1 :: (현재페이지번호-1)*출력개수 + 1
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		int lastIndex  = firstIndex + (pageUnit-1);
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		// 검색, 페이징
		List<?> list = goodsService.selectGoodsList(vo);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("recordCount", recordCountPerPage);
		
		return "admin/admGoodsList";
	}
	
	
	
	@RequestMapping(value="/goodsList.do")
	public String selectGoodsList(DefaultVO vo,ModelMap model) throws Exception {

			// 현재 출력 페이지 번호
			int pageIndex = vo.getPageIndex(); // default: 1
			int pageUnit = 6;   // default: 10
			
			int total = goodsService.selectGoodsTotal(vo);
			
			// 총 페이지 수
			int totalpage = (int) Math.ceil((double)total/pageUnit);
			
			// 출력 페이지의 시작번호  ex) 3page -> 100 - (3-1)x10
			int recordCountPerPage = total - (pageIndex-1)*pageUnit;

			// 1:1 , 2:11, 3:21 ~~
			// (3-1)*10 + 1 :: (현재페이지번호-1)*출력개수 + 1
			int firstIndex = (pageIndex-1)*pageUnit + 1;
			int lastIndex  = firstIndex + (pageUnit-1);
			
			vo.setFirstIndex(firstIndex);
			vo.setLastIndex(lastIndex);
			
			// 검색, 페이징
			List<?> list = goodsService.selectGoodsList(vo);
			model.addAttribute("list", list);
			model.addAttribute("total", total);
			model.addAttribute("totalpage", totalpage);
		
		return "product/goodsList";
	}
	
	
	// unq filename
	@RequestMapping(value="/admGoodsDelete.do")
	@ResponseBody
	public String deleteGoods(GoodsVO vo) throws Exception {
		String msg ="ok";
		String filename = vo.getFilename();
		// 파일명이 넘어왔는지의 여부
		if(filename != null && 
			!filename.equals("") && 
			!filename.equals("null")){
			// 파일의 존재유무
			String filePath = dirPath +"/"+filename;
			// 물리적 파일로 인식
			File file = new File(filePath);
			// 파일 존재 여부
			if(file.exists() == true) {
				// 파일 삭제
				file.delete();
			}		
		}
		
		int result = goodsService.deleteGoods(vo);
		if(result == 0) msg = "fail";
		return msg;
	}
	
	@RequestMapping(value="/admGoodsModify.do")
	public String admGoodsModify(GoodsVO vo, ModelMap model) throws Exception {
		vo = goodsService.selectGoodsDetail(vo);
		model.addAttribute("defaultVO",vo);
		return "admin/admGoodsModify";
	}
	
	
	
}







