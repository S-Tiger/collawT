package project.euna.issue.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.euna.issue.dao.IssueDAO;
import project.euna.issue.service.IssueService;
import project.euna.issue.vo.AppendixVO;
import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;
import project.euna.issue.vo.PageMaker;
import project.euna.reply.service.ReplyService;

@Controller

@RequestMapping("/issue/*")
public class IssueControllerImpl implements IssueController {
	
	
	@Inject
	IssueService issueService;
	
	@Inject
	ReplyService replyService;
	
	@Inject
	IssueDAO issueDAO;

	
	//글 목록 조회 페이징
	@Override
	@GetMapping("/list")
	public ModelAndView searchList(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		List<Map> list = issueService.searchList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(issueService.listCount());
		
		
		ModelAndView mav = new ModelAndView("issue/issueList");
		mav.addObject("issueList", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
		
	}

	
	//글 쓰기 DB에 넣기
	@Override
	@PostMapping("/insert")
	public String issueInsert(AppendixVO appendixVO, IssueVO issueVO, HttpSession session) throws Exception {
	
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		
		//System.out.println("파일크기 + :"+appendixVO.getA_File().getBytes());
		
		
		issueVO.setMem_Id(mem_Id);
		
		issueService.issueInsert(issueVO);
		
		return "redirect:/issue/list";
	
	}
	
	//글 쓰기 화면
	@Override
	@GetMapping("/insert")
	public String issueInsert() {
		
		return "/issue/issueInsert";
	}
	

	
	
	//개별 글 조회
	@Override
	@GetMapping("/read")
	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Map<String, Object> board = issueService.issueRead(i_Num);
		
		ModelAndView mav = new ModelAndView("issue/issueRead");
		mav.addObject("issueRead", board);
		return mav;
	}
	
	
	//게시글 삭제
	@Override
	@PostMapping("/delete")
	public String issueDelete(IssueVO issueVO) throws Exception{
	
		issueService.issueDelete(issueVO.getI_Num());
		
		return "redirect:/issue/list";
	}
	
	//게시글 수정 페이지로 이동
	@Override
	@GetMapping("/update")
	public String issueUpdate(IssueVO issueVO, Model model) throws Exception {
		model.addAttribute("issueUpdate",issueService.issueRead(issueVO.getI_Num()) );
		return "/issue/issueUpdate";
	}
	
	//게시글 수정 db에 넣기
	@Override
	@PostMapping("/update")
	public String issueUpdate(IssueVO issueVO) throws Exception {
		issueService.issueUpdate(issueVO);
		
		String i_Num = issueVO.getI_Num();
		
		//수정한 게시물로 리턴
		return "redirect:/issue/read?i_Num="+i_Num;
	}
	
	
	//파일첨부화면 테스트
	@GetMapping("/file")
	public String fileInsert() {
		
		return "/issue/fileUploadTest";
	}
	

	
	//실제 파일첨부 테스트
	@Override
	@PostMapping("/fileUpload")
	public String saveFile(MultipartHttpServletRequest mtfRequest, AppendixVO appendixVO) throws Exception{
		List<MultipartFile> fileList = mtfRequest.getFiles("a_File");
		
		for (MultipartFile mf : fileList) {
			String a_RealName = mf.getOriginalFilename(); // 원본 파일 명
			String a_Size = Long.toString(mf.getSize()); // 파일 사이즈
			String a_NameEx = a_RealName.substring(a_RealName.lastIndexOf(".")+1);
			
			try {
				Map<String, Object> file = new HashMap<String, Object>();
				file.put("a_RealName", a_RealName);
				file.put("a_File", appendixVO.getA_File().getBytes());
				file.put("a_NameEx", a_NameEx);
				file.put("a_Size", a_Size);
				file.put("i_Num", "225");
				
				issueDAO.saveFile(file);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:/issue/list";

	}
	
	
	//파일첨부 리스트 조회
	@Override
	@GetMapping("/viewfile")
	public ModelAndView fileList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String i_Num = "225";
		
		List<Map> list = issueService.fileList(i_Num);

		ModelAndView mav = new ModelAndView("issue/fileview");
		mav.addObject("file", list);
		return mav;
		
	}
	
	//파일 다운로드
	@Override
	@GetMapping("/download")
	public ResponseEntity<byte[]> download(AppendixVO appendixVO, HttpServletResponse response) {
		String a_Num = appendixVO.getA_Num();
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : "+a_Num);
	

		Map<String, Object> map = issueDAO.download(a_Num);
		String a_RealName = (String) map.get("a_RealName");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : "+a_RealName);
		
		byte[] file = (byte[]) map.get("a_File");
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!a_File: "+map.get("a_File"));
		
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		
			try {
				headers.add("Content-Disposition","attachment; filename="+new String(a_RealName.getBytes("UTF-8"),"8859_1"));
				headers.add("Content-Type", "text/html; charset=utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		return new ResponseEntity<byte[]>(file, headers, HttpStatus.OK);

	}



	
	
	//ckeditor 이미지 파일 업로드
//	@GetMapping("/imageUpload")
//	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
//		System.out.println("ckeditor image test!!!!!!!!!!!!!!!!!!!!!!!");
//		
//		 // 랜덤 문자 생성
//        UUID uid = UUID.randomUUID();
//        
//        OutputStream out = null;
//        PrintWriter printWriter = null;
//        
//        //인코딩
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//        
//        try{
//            
//            //파일 이름 가져오기
//            String fileName = upload.getOriginalFilename();
//            byte[] bytes = upload.getBytes();
//            
//            //이미지 경로 생성
//            String path = fileDir.getPath() + "ckImage/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
//            String ckUploadPath = path + uid + "_" + fileName;
//            File folder = new File(path);
//            
//            //해당 디렉토리 확인
//            if(!folder.exists()){
//                try{
//                    folder.mkdirs(); // 폴더 생성
//                }catch(Exception e){
//                    e.getStackTrace();
//                }
//            }
//            
//            out = new FileOutputStream(new File(ckUploadPath));
//            out.write(bytes);
//            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
//            
//            String callback = request.getParameter("CKEditorFuncNum");
//            printWriter = response.getWriter();
//            String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
//            
//        // 업로드시 메시지 출력
//          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
//          printWriter.flush();
//            
//        }catch(IOException e){
//            e.printStackTrace();
//        } finally {
//          try {
//           if(out != null) { out.close(); }
//           if(printWriter != null) { printWriter.close(); }
//          } catch(IOException e) { e.printStackTrace(); }
//         }
//        
//        return;
//    }
//	
		
	}




