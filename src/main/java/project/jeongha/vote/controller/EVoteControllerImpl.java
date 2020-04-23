package project.jeongha.vote.controller;


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

import com.google.gson.JsonObject;

import project.jeongha.vote.dao.EVoteDAO;
import project.jeongha.vote.service.EVoteService;
import project.jeongha.vote.vo.Criteria;
import project.jeongha.vote.vo.PageMaker;
import project.jeongha.vote.vo.VoteVO;
import project.sungho.comember.service.ComemberService;
import project.sungho.cowork.service.CoworkService;

@Controller

@RequestMapping("/project/vote/*")
public class EVoteControllerImpl implements EVoteController {
	
	//
	@Inject
	EVoteService evoteService;
	

	
	@Inject
	EVoteDAO evoteDAO;
	
	@Inject
	CoworkService coworkService;
	
	@Inject
	ComemberService comemberService;

	
	//글 목록 조회 페이징
	@Override
	@GetMapping("/list")
	public ModelAndView searchList(Criteria cri, String c_Id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		List<Map> list = evoteService.searchList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evoteService.listCount(c_Id));
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("c_Id", c_Id);
		Map<String, Object>pjt = coworkService.searchMain(searchMap);
		
		ModelAndView mav = new ModelAndView("vote/voteList");
		mav.addObject("voteList", list);
		mav.addObject("pageMaker", pageMaker);
		
		mav.addObject("pjt", pjt); 
		
		
		return mav;
	}

	
	//글 쓰기 DB에 넣기
	@Override
	@PostMapping("/insert")
	public String issueInsert(VoteVO voteVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		String c_Id = voteVO.getC_Id();
		String v_Name = voteVO.getV_Name();
		String v_Content = voteVO.getV_Content();
		String v_Date = voteVO.getV_Date();
		String v_Start = voteVO.getV_Start();
		String v_End = voteVO.getV_End();
		String vs_Num = voteVO.getVs_Num();
		
		
		Map<String, Object> cmap = new HashMap<String,Object>();
		cmap.put("mem_Id", mem_Id);
		cmap.put("c_Id", c_Id);
		cmap.put("v_Name", v_Name);
		cmap.put("v_Content",v_Content);
		cmap.put("v_Date", v_Date);
		cmap.put("v_Start", v_Start);
		cmap.put("v_End", v_End);
		cmap.put("vs_Num", vs_Num);
		
		
		evoteService.voteInsert(cmap);
		System.out.println("!!!!!!!!!!!!!!!!!11cmapcontroller"+cmap);
		
		String v_Num = (String) cmap.get("v_Num");
		
		
		
		return "redirect:/project/vote/read?v_Num="+v_Num;
	
	}
	
	//글 쓰기 화면
	@Override
	@GetMapping("/insert")
	public ModelAndView voteInsert(String c_Id, HttpSession session) {
			
		ModelAndView mav = new ModelAndView("/vote/voteInsert");
		mav.addObject("c_Id", c_Id);
		return mav;
		
	}
	

	
	
//	//개별 글 조회
//	@Override
//	@GetMapping("/read")
//	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		
//		Map<String, Object> board = evoteService.issueRead(i_Num);
//		List<Map> list = appedixService.fileList(i_Num);
//		List<Map> chargerList = evoteService.chargerRead(i_Num);
//		
//		
//		ModelAndView mav = new ModelAndView("issue/issueRead");
//		mav.addObject("issueRead", board);
//		mav.addObject("file", list);
//		mav.addObject("chargerList", chargerList);
//		return mav;
//	}
//	
//	
//	//게시글 삭제
//	@Override
//	@GetMapping("/delete")
//	public String issueDelete(String c_Id, String i_Num, IssueVO issueVO) throws Exception{
//		
//		evoteService.chargerDelete(issueVO.getI_Num());
//		evoteService.issueDelete(issueVO.getI_Num());
//	
//		
//		
//		return "redirect:/project/issue/list?c_Id="+c_Id;
//	}
//	
//	//게시글 수정 페이지로 이동
//	@Override
//	@GetMapping("/update")
//	public String issueUpdate(String c_Id, String i_Num, IssueVO issueVO, Model model) throws Exception {
//		
//		
//		
//		List<Map> igRead = evoteService.igRead();
//		List<Map> comemList = evoteService.comemRead(c_Id);
//		List<Map> chargerList = evoteService.chargerRead(i_Num);
//		
//		model.addAttribute("issueUpdate",evoteService.issueRead(issueVO.getI_Num()) );
//		model.addAttribute("igRead",igRead);
//		model.addAttribute("c_Id", c_Id);
//		model.addAttribute("comemList", comemList);
//		model.addAttribute("chargerList", chargerList);
//
//		
//		return "/issue/issueUpdate";
//	}
//	
//	//이슈 담당자 목록 가져오기
//	@GetMapping("/chargerList")
//	@ResponseBody
//	public List<Map> chargerList(@RequestParam ("i_Num")String i_Num) throws Exception {
//		
//		List<Map> chargerList = evoteService.chargerRead(i_Num);
//		
//		return chargerList;
//	}
//	
//	
//	//게시글 수정 db에 넣기
//	@Override
//	@PostMapping("/update")
//	public String issueUpdate(IssueVO issueVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		evoteService.issueUpdate(issueVO);
//		
//		String i_Num = issueVO.getI_Num();
//		String c_Id = issueVO.getC_Id();
//		
//		
//		//이슈담당자 삭제 후 다시 입력
//		evoteService.chargerDelete(i_Num);
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
//					evoteService.comemInsert(coMap);
//			}
//		
//		}catch(NullPointerException e) {
//		}
//		
//		
//		//appedixService.updateFile(issueVO, appendixVO, files, fileNames, mpRequest);
//		
//		
//		//수정한 게시물로 리턴
//		return "redirect:/project/issue/read?i_Num="+i_Num;
//	}
//	
//
//	
//	
//	@PostMapping("/imageUpload")
//	@ResponseBody
//	@Override
//	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
//                 MultipartHttpServletRequest multiFile) throws Exception {
//		JsonObject json = new JsonObject();
//		PrintWriter printWriter = null;
//		OutputStream out = null;
//		MultipartFile file = multiFile.getFile("upload");
//		if(file != null){
//			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
//				if(file.getContentType().toLowerCase().startsWith("image/")){
//					try{
//						String fileName = file.getName();
//						byte[] bytes = file.getBytes();
//						String uploadPath = req.getServletContext().getRealPath("/img");
//						System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11"+uploadPath);
//						File uploadFile = new File(uploadPath);
//						if(!uploadFile.exists()){
//							uploadFile.mkdirs();
//						}
//						fileName = UUID.randomUUID().toString();
//						uploadPath = uploadPath + "/" + fileName;
//						out = new FileOutputStream(new File(uploadPath));
//                        out.write(bytes);
//
//                        printWriter = resp.getWriter();
//                        resp.setContentType("text/html");
//                        String fileUrl = req.getContextPath() + "/img/" + fileName;
//
//                        // json 데이터로 등록
//                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
//                        // 이런 형태로 리턴이 나가야함.
//                        json.addProperty("uploaded", 1);
//                        json.addProperty("fileName", fileName);
//                        json.addProperty("url", fileUrl);
//
//                        printWriter.println(json);
//                    }catch(IOException e){
//                        e.printStackTrace();
//                    }finally{
//                        if(out != null){
//                            out.close();
//                        }
//                        if(printWriter != null){
//                            printWriter.close();
//                        }		
//					}
//				}
//			}
//		}
//		return null;
//	}	

}





