package project.euna.personal.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import project.euna.appendix.service.AppendixService;
import project.euna.appendix.vo.AppendixVO;
import project.euna.personal.dao.PersonalDAO;
import project.euna.personal.service.PersonalService;
import project.euna.personal.vo.Criteria;
import project.euna.personal.vo.PersonalVO;
import project.euna.personal.vo.PageMaker;
import project.euna.reply.service.ReplyService;
import project.sungho.comember.service.ComemberService;
import project.sungho.cowork.service.CoworkService;

@Controller

@RequestMapping("/personal/*")
public class PersonalControllerImpl implements PersonalController {
	
	//
	@Inject
	PersonalService personalService;
	
	@Inject
	AppendixService appendixService;
	
	@Inject
	ReplyService replyService;
	
	@Inject
	PersonalDAO personalDAO;
	
	@Inject
	CoworkService coworkService;
	
	@Inject
	ComemberService comemberService;
	


	
	//글 목록 조회 페이징
	@Override
	@GetMapping("/list")
	public ModelAndView searchList(PersonalVO personalVO, Criteria cri, String mem_Id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			List<Map> list = personalService.searchList(cri);
			PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(personalService.listCount(mem_Id));
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
	
		ModelAndView mav = new ModelAndView("personal/personalList");
		mav.addObject("personalList", list);
		mav.addObject("pageMaker", pageMaker);
	
		return mav;
		
	}

	
	//글 쓰기 DB에 넣기
//	@Override
//	@PostMapping("/insert")
//	public String personalInsert(personalVO personalVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
//	
//		Map<String, Object> member = new HashMap<String,Object>();
//		member = (Map<String, Object>) session.getAttribute("member");
//		String mem_Id = (String) member.get("mem_Id");
//		String c_Id = personalVO.getC_Id();
//		String i_Name = personalVO.getI_Name();
//		String i_Content = personalVO.getI_Content();
//		String i_Start = personalVO.getI_Start();
//		String i_End = personalVO.getI_End();
//		String ig_Num = personalVO.getig_Num();
//		String i_Num = personalVO.getI_Num();
//		
//		
//		Map<String, Object> cmap = new HashMap<String,Object>();
//		cmap.put("mem_Id", mem_Id);
//		cmap.put("c_Id", c_Id);
//		cmap.put("i_Name", i_Name);
//		cmap.put("i_Content",i_Content);
//		cmap.put("i_Start", i_Start);
//		cmap.put("i_End", i_End);
//		cmap.put("ig_Num", ig_Num);
//		cmap.put("i_Num", i_Num);
//
//		
//		personalService.personalInsert(cmap);
//		
//		
//		try {
//			Map<String, Object> coMap = new HashMap<String, Object>();
//			String comem_Id[] = request.getParameterValues("comem_Id");
//			
//			
//			for (int i = 0; i < comem_Id.length; i++) {
//				
//				coMap.put("i_Num", i_Num);
//				coMap.put("c_Id", c_Id);
//				coMap.put("mem_Id", comem_Id[i]);
//				coMap.put("cr_Status", "");
//				
//				personalService.comemInsert(coMap);
//				
//				
//			}
//		}catch(NullPointerException e) {
//		}
//
//		
//		
//		
//		
//		return "redirect:/project/personal/read?i_Num="+i_Num;
//	
//	}
//	
//	//글 쓰기 화면
//	@Override
//	@GetMapping("/insert")
//	public ModelAndView personalInsert(String c_Id, HttpSession session) {
//		Map<String, Object> i_Num = personalDAO.get_i_Num();
//
//		
//		List<Map> comemList = personalService.comemRead(c_Id);
//		
//				
//		ModelAndView mav = new ModelAndView("/personal/personalInsert");
//		mav.addObject("c_Id", c_Id);
//		mav.addObject("comemList", comemList);
//		mav.addObject("i_Num", i_Num);
//		return mav;
//		
//	}
//	
//
//	
//	
//	//개별 글 조회
//	@Override
//	@GetMapping("/read")
//	public ModelAndView personalRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		Map<String, Object> member = new HashMap<String,Object>();
//		member = (Map<String, Object>) session.getAttribute("member");
//		String mem_Id = (String) member.get("mem_Id");
//		
//		List<Map> coworkList = personalService.coRead(mem_Id);
//		Map<String, Object> board = personalService.personalRead(i_Num);
//		List<Map> list = appendixService.fileList(i_Num);
//		List<Map> chargerList = personalService.chargerRead(i_Num);
//		
//		
//		ModelAndView mav = new ModelAndView("personal/personalRead");
//		mav.addObject("personalRead", board);
//		mav.addObject("file", list);
//		mav.addObject("chargerList", chargerList);
//		mav.addObject("coworkList", coworkList);
//		return mav;
//	}
//
//	
//	//게시글 삭제
//	@Override
//	@GetMapping("/delete")
//	public String personalDelete(String c_Id, String i_Num, personalVO personalVO) throws Exception{
//		
//		personalService.chargerDelete(personalVO.getI_Num());
//		personalService.personalDelete(personalVO.getI_Num());
//	
//		
//		
//		return "redirect:/project/personal/list?c_Id="+c_Id;
//	}
//	
//	//게시글 수정 페이지로 이동
//	@Override
//	@GetMapping("/update")
//	public String personalUpdate(String c_Id, String i_Num, personalVO personalVO, Model model) throws Exception {
//		
//		
//		
//		List<Map> igRead = personalService.igRead();
//		List<Map> comemList = personalService.comemRead(c_Id);
//		List<Map> chargerList = personalService.chargerRead(i_Num);
//		
//		model.addAttribute("personalUpdate",personalService.personalRead(personalVO.getI_Num()) );
//		model.addAttribute("igRead",igRead);
//		model.addAttribute("c_Id", c_Id);
//		model.addAttribute("comemList", comemList);
//		model.addAttribute("chargerList", chargerList);
//
//		
//		return "/personal/personalUpdate";
//	}
//	
//	//이슈 담당자 목록 가져오기
//	@GetMapping("/chargerList")
//	@ResponseBody
//	public List<Map> chargerList(@RequestParam ("i_Num")String i_Num) throws Exception {
//		
//		List<Map> chargerList = personalService.chargerRead(i_Num);
//		
//		return chargerList;
//	}
//	
//	
//	//게시글 수정 db에 넣기
//	@Override
//	@PostMapping("/update")
//	public String personalUpdate(personalVO personalVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		personalService.personalUpdate(personalVO);
//		
//		String i_Num = personalVO.getI_Num();
//		String c_Id = personalVO.getC_Id();
//		
//		
//		//이슈담당자 삭제 후 다시 입력
//		personalService.chargerDelete(i_Num);
//		
//		try {
//			Map<String, Object> coMap = new HashMap<String, Object>();
//			String comem_Id[] = request.getParameterValues("comem_Id");
//			for (int i = 0; i < comem_Id.length; i++) {
//					
//					coMap.put("i_Num", i_Num);
//					coMap.put("c_Id", c_Id);
//					coMap.put("mem_Id", comem_Id[i]);
//					coMap.put("cr_Status", "");
//					
//					personalService.comemInsert(coMap);
//			}
//		
//		}catch(NullPointerException e) {
//		}
//		
//		
//		//appedixService.updateFile(personalVO, appendixVO, files, fileNames, mpRequest);
//		
//		
//		//수정한 게시물로 리턴
//		return "redirect:/project/personal/read?i_Num="+i_Num;
//	}
//	
//	
//	//다른 협업공간으로 복제 글 쓰기 DB에 넣기
//	@Override
//	@PostMapping("/copy")
//	public String personalCopy(personalVO personalVO, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
//	
//		Map<String, Object> member = new HashMap<String,Object>();
//		member = (Map<String, Object>) session.getAttribute("member");
//		String mem_Id = (String) member.get("mem_Id");
//		
//		String c_Id = personalVO.getC_Id();
//		String i_Name = personalVO.getI_Name();
//		String i_Content = personalVO.getI_Content();
//		String i_Start = personalVO.getI_Start();
//		String i_End = personalVO.getI_End();
//		String ig_Num = personalVO.getig_Num();
//		String i_Num = personalVO.getI_Num();
//		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!"+i_Num);
//		
//		Map<String, Object> cmap = new HashMap<String,Object>();
//		cmap.put("mem_Id", mem_Id);
//		cmap.put("c_Id", c_Id);
//		cmap.put("i_Name", i_Name);
//		cmap.put("i_Content",i_Content);
//		cmap.put("i_Start", i_Start);
//		cmap.put("i_End", i_End);
//		cmap.put("ig_Num", ig_Num);
//		
//		
//		personalService.personalCopy(cmap);
//		String redirecti_Num = (String) cmap.get("i_Num");
//		
//		Map<String, Object> hmap = new HashMap<String,Object>();
//		hmap.put("i_Num", i_Num);
//		hmap.put("redirecti_Num", redirecti_Num);
//
//		appendixService.copyFile(hmap);
//
//		
//		rttr.addFlashAttribute("msg", "success");
//
//		return "redirect:/project/personal/read?c_Id="+c_Id+"&i_Num="+redirecti_Num;
//	
//	}
//
//	
//
//	
//	
//	@PostMapping("/imageUpload")
//	@ResponseBody
//	@Override
//	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
//		HttpSession session = request.getSession();
//	    OutputStream out = null;
//	    PrintWriter printWriter = null;
//	    response.setCharacterEncoding("utf-8");
//	    response.setContentType("text/html;charset=utf-8");
//        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//
//	    try{
//	 
//	        String fileName = upload.getOriginalFilename();
//	        byte[] bytes = upload.getBytes();
//	        String uploadPath = session.getServletContext().getRealPath("/") + fileName;//저장경로
//	        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+uploadPath);
//	 
//	        out = new FileOutputStream(new File(uploadPath));
//	        out.write(bytes);
//	        String callback = request.getParameter("CKEditorFuncNum");
//	 
//	        printWriter = response.getWriter();
//	        String fileUrl = uploadPath+("/") + fileName;//url경로
//	 
//	        printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//	                + callback
//	                + ",'"
//	                + fileUrl
//	                + "','이미지를 업로드 하였습니다.'"
//	                + ")</script>");
//	        printWriter.flush();
//	 
//	    }catch(IOException e){
//	        e.printStackTrace();
//	    } finally {
//	        try {
//	            if (out != null) {
//	                out.close();
//	            }
//	            if (printWriter != null) {
//	                printWriter.close();
//	            }
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//	    }
//	 
//	    return;
//	}


}





