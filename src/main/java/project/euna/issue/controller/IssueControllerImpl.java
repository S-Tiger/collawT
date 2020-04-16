package project.euna.issue.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import project.euna.issue.dao.IssueDAO;
import project.euna.issue.service.IssueService;
import project.euna.issue.vo.AppendixVO;
import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;
import project.euna.issue.vo.PageMaker;
import project.euna.reply.service.ReplyService;
import project.euna.reply.vo.ReplyVO;

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
	public String issueInsert(IssueVO issueVO, HttpSession session) throws Exception {
	
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		

		issueVO.setMem_Id(mem_Id);
		
		issueService.issueInsert(issueVO);
		
		return "redirect:/issue/list";
	
	}
	
	//글 쓰기 화면
	@Override
	@GetMapping("/insert")
	public ModelAndView issueInsert() {
		Map<String, Object> i_Num = issueDAO.get_i_Num();
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!"+i_Num);
		ModelAndView mav = new ModelAndView("/issue/issueInsert");
		mav.addObject("i_Num", i_Num);
		return mav;
	}
	

	
	
	//개별 글 조회
	@Override
	@GetMapping("/read")
	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Map<String, Object> board = issueService.issueRead(i_Num);
		List<Map> list = issueService.fileList(i_Num);
		
		ModelAndView mav = new ModelAndView("issue/issueRead");
		mav.addObject("issueRead", board);
		mav.addObject("file", list);
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
	

	
	//파일첨부
	@Override
	@PostMapping("/fileUpload")
	@ResponseBody
	public String saveFile(IssueVO issueVO, MultipartHttpServletRequest mtfRequest, AppendixVO appendixVO) throws Exception{
		List<MultipartFile> fileList = mtfRequest.getFiles("a_File");
		
		for (MultipartFile mf : fileList) {
			String a_RealName = mf.getOriginalFilename(); // 원본 파일 명
			String a_Size = Long.toString((mf.getSize())); // 파일 사이즈
			String a_NameEx = a_RealName.substring(a_RealName.lastIndexOf(".")+1);
			String i_Num=issueVO.getI_Num();
		
		
			
			try {
				Map<String, Object> file = new HashMap<String, Object>();
				file.put("a_RealName", a_RealName);
				file.put("a_File", appendixVO.getA_File().getBytes());
				file.put("a_NameEx", a_NameEx);
				file.put("a_Size", a_Size);
				file.put("i_Num", i_Num);
				
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
	
	
	//해당글의 첨부파일 목록 확인하기
	@Override
	@GetMapping("/fileread")
	@ResponseBody
	public List<Map> fileRead(@RequestParam ("i_Num")String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map> list = issueService.fileList(i_Num);
		
		return list;
	}

	
	//파일 다운로드
	@Override
	@GetMapping("/download")
	public ResponseEntity<byte[]> download(AppendixVO appendixVO, HttpServletResponse response) {
		String a_Num = appendixVO.getA_Num();
	

		Map<String, Object> map = issueDAO.download(a_Num);
		String a_RealName = (String) map.get("a_RealName");
		
		byte[] file = (byte[]) map.get("a_File");
		
		
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
	
	//첨부파일 삭제
	@Override
	@PostMapping("/filedelete")
	@ResponseBody
	public void fileDelete(AppendixVO appendixVO) throws Exception{
		
	
		issueService.fileDelete(appendixVO);
		
		
	}



	
	
	//ckeditor 이미지 파일 업로드
	@PostMapping("/imageUpload")
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/img");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() + "/img/" + fileName;
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	
	
}




