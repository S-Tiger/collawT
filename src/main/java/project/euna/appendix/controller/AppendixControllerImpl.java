package project.euna.appendix.controller;

import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import project.euna.issue.dao.IssueDAO;

import project.euna.appendix.dao.AppendixDAO;
import project.euna.appendix.service.AppendixService;
import project.euna.appendix.vo.AppendixVO;

import project.euna.issue.vo.IssueVO;

@Controller

@RequestMapping("/appendix/*")
public class AppendixControllerImpl implements AppendixController {
	
	
	@Inject
	AppendixDAO appendixDAO;
	
	@Inject
	AppendixService appendixService;
	

	

	
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
				
				appendixDAO.uploadFile(file);
				
				
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
	
//	//파일 임시 리스트 만들기
//	@Override
//	@PostMapping("/tmpfileList")
//	@ResponseBody
//	public String tmpfileList(IssueVO issueVO, MultipartHttpServletRequest mtfRequest, AppendixVO appendixVO) throws Exception{
//		List<MultipartFile> fileList = mtfRequest.getFiles("a_File");
//		
//		for (MultipartFile mf : fileList) {
//			String a_RealName = mf.getOriginalFilename(); // 원본 파일 명
//			String a_Size = Long.toString((mf.getSize())); // 파일 사이즈
//			String a_NameEx = a_RealName.substring(a_RealName.lastIndexOf(".")+1);
//			String i_Num=issueVO.getI_Num();
//		
//		
//			
//			try {
//				Map<String, Object> tmpfileList = new HashMap<String, Object>();
//				tmpfileList.put("a_RealName", a_RealName);
//				tmpfileList.put("a_File", appendixVO.getA_File().getBytes());
//				tmpfileList.put("a_NameEx", a_NameEx);
//				tmpfileList.put("a_Size", a_Size);
//				tmpfileList.put("i_Num", i_Num);
//				
//				//appendixDAO.uploadFile(file);
//				
//				
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//		return "redirect:/issue/list";
//
//	}
	
	
//	//파일 임시 리스트 보여주기
//	@Override
//	@PostMapping("/tmpfileView")
//	@ResponseBody
//	public String tmpfileView(IssueVO issueVO, MultipartHttpServletRequest mtfRequest, AppendixVO appendixVO) throws Exception{
//		List<MultipartFile> fileList = mtfRequest.getFiles("a_File");
//		
//		for (MultipartFile mf : fileList) {
//			String a_RealName = mf.getOriginalFilename(); // 원본 파일 명
//			String a_Size = Long.toString((mf.getSize())); // 파일 사이즈
//			String a_NameEx = a_RealName.substring(a_RealName.lastIndexOf(".")+1);
//			String i_Num=issueVO.getI_Num();
//		
//		
//			
//			try {
//				Map<String, Object> file = new HashMap<String, Object>();
//				file.put("a_RealName", a_RealName);
//				file.put("a_File", appendixVO.getA_File().getBytes());
//				file.put("a_NameEx", a_NameEx);
//				file.put("a_Size", a_Size);
//				file.put("i_Num", i_Num);
//				
//				//appendixDAO.uploadFile(file);
//				
//				
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//		return "redirect:/issue/list";
//
//	}
	
	
	//해당글의 첨부파일 목록 확인하기
	@Override
	@GetMapping("/fileread")
	@ResponseBody
	public List<Map> fileRead(@RequestParam ("i_Num")String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map> list = appendixService.fileList(i_Num);
		
		return list;
	}

	
	//파일 다운로드
	@Override
	@GetMapping("/download")
	public ResponseEntity<byte[]> download(AppendixVO appendixVO, HttpServletResponse response) {
		String a_Num = appendixVO.getA_Num();
	

		Map<String, Object> map = appendixDAO.download(a_Num);
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
	
	//첨부파일 수정
	@Override
	@PostMapping("/fileUpdate")
	@ResponseBody
	public void updateFile(AppendixVO appendixVO) throws Exception{
		
	
		appendixService.updateFile(appendixVO);
		
		
	}
	
	

	
}




