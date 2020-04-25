package project.jeongha.vote.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;



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
        Map<String, Object> pjt = coworkService.searchMain(searchMap);

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

        Map<String, Object> member = new HashMap<String, Object>();
        member = (Map<String, Object>) session.getAttribute("member");
        String mem_Id = (String) member.get("mem_Id");
        String c_Id = voteVO.getC_Id();
        String v_Name = voteVO.getV_Name();
        String v_Content = voteVO.getV_Content();
        String v_Start = voteVO.getV_Start();
        String v_End = voteVO.getV_End();
        String vs_Num = voteVO.getVs_Num();
        String v_Subject = voteVO.getV_Subject();
        String v_Count = voteVO.getV_Count();

        Map<String, Object> cmap = new HashMap<String, Object>();
        cmap.put("mem_Id", mem_Id);///
        cmap.put("c_Id", c_Id);///
        cmap.put("v_Name", v_Name);///
        cmap.put("v_Content", v_Content);///
        cmap.put("v_Start", v_Start);///
        cmap.put("v_End", v_End);///
        cmap.put("vs_Num", vs_Num);///
        cmap.put("v_Subject", v_Subject);
        cmap.put("v_Count", v_Count);
        System.out.println("!222222222222ddddcccccccccc!!11cmapcontroller" + cmap);
        evoteService.voteInsert(cmap);

        //v_Num가져오기
        //Map<String, Object> voteVODb = evoteService.voteInfo(cmap);
        String v_Num = (String) cmap.get("v_Num");
        //보기항목 넣기
        String vd_Num[] = request.getParameterValues("vd_Num");
        String vd_Content[] = request.getParameterValues("vd_Content");
        // boted 테이블에 들어갈 정보
        System.out.println("@@@" + vd_Num + "@@@@@" + vd_Content);
        Map<String, Object> vd_Info = new HashMap<String, Object>();
        for (int i = 0; i < vd_Num.length; i++) {
            vd_Info.put("v_Num", v_Num);
            vd_Info.put("vd_Num", vd_Num[i]);
            vd_Info.put("vd_Content", vd_Content[i]);
            vd_Info.put("c_Id", c_Id);
            System.out.println("vd_Info @@@@@@@@:" + vd_Info);
            evoteService.votedInsert(vd_Info);

        }


        //System.out.println("!!!!!!!!!!!!!!!!!11cmapcontroller"+cmap);


        return "redirect:/project/vote/read?v_Num=" + v_Num;

    }

    //글 쓰기 화면
    @Override
    @GetMapping("/insert")
    public ModelAndView voteInsert(String c_Id, HttpSession session) {

        ModelAndView mav = new ModelAndView("/vote/voteInsert");

        mav.addObject("c_Id", c_Id);
        return mav;

    }


    //개별 글 조회
    @Override
    @GetMapping("/read")
    public ModelAndView voteRead(String v_Num, HttpServletRequest request, HttpServletResponse response) throws Exception {


        Map<String, Object> vote = evoteService.voteRead(v_Num);
        List<Map> voted = evoteService.votedRead(v_Num);
        //List<Map> list = appedixService.fileList(i_Num);
        //List<Map> chargerList = evoteService.chargerRead(v_Num);


        ModelAndView mav = new ModelAndView("/vote/voteRead");
        mav.addObject("voteRead", vote);
        mav.addObject("votedRead", voted);
        //mav.addObject("file", list);
        //mav.addObject("chargerList", chargerList);
        return mav;
    }

    //
//	
    //게시글 삭제
    @Override
    @GetMapping("/delete")
    public String voteDelete(String c_Id, String i_Num, VoteVO voteVO) throws Exception {

        evoteService.chargerDelete(voteVO.getV_Num());
        evoteService.voteDelete(voteVO.getV_Num());


        return "redirect:/project/vote/list?c_Id=" + c_Id;
    }

    //
    //게시글 수정 페이지로 이동
    @Override
    @GetMapping("/update")
    public String voteUpdate(String c_Id, String v_Num, VoteVO voteVO, Model model) throws Exception {
        System.out.println("================controller===============");
        System.out.println("c_Id: " + c_Id);
        System.out.println("c" + v_Num);
        System.out.println("=========================================");
        List<Map> igRead = evoteService.igRead();
        List<Map> comemList = evoteService.comemRead(c_Id);
        //List<Map> chargerList = evoteService.chargerRead(v_Num);

        model.addAttribute("voteUpdate", evoteService.voteRead(voteVO.getV_Num()));
        model.addAttribute("igRead", igRead);
        model.addAttribute("c_Id", c_Id);
        model.addAttribute("comemList", comemList);
        //model.addAttribute("chargerList", chargerList);


        return "/vote/voteUpdate";
    }

    //
    //이슈 담당자 목록 가져오기
    @GetMapping("/chargerList")
    @ResponseBody
    public List<Map> chargerList(@RequestParam("i_Num") String i_Num) throws Exception {

        List<Map> chargerList = evoteService.chargerRead(i_Num);

        return chargerList;
    }

    //
//	
    //게시글 수정 db에 넣기
    @Override
    @PostMapping("/update")
    public String voteUpdate(VoteVO voteVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //evoteService.voteUpdate(voteVO);

        String v_Num = voteVO.getV_Num();
        String c_Id = voteVO.getC_Id();


        //이슈담당자 삭제 후 다시 입력
        evoteService.chargerDelete(v_Num);

        try {
            Map<String, Object> coMap = new HashMap<String, Object>();
            String comem_Id[] = request.getParameterValues("comem_Id");
            for (int i = 0; i < comem_Id.length; i++) {

                coMap.put("v_Num", v_Num);
                coMap.put("c_Id", c_Id);
                coMap.put("mem_Id", comem_Id[i]);
                coMap.put("cr_Status", "");

                evoteService.comemInsert(coMap);
            }

        } catch (NullPointerException e) {
        }


        //appedixService.updateFile(issueVO, appendixVO, files, fileNames, mpRequest);


        //수정한 게시물로 리턴
        return "redirect:/project/vote/read?i_Num=" + v_Num;
    }
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

    //투표지 선택
    @Override
    @GetMapping("/insertVoter")
    public ModelAndView voter(String v_Num, String c_Id, String vd_Num, VoteVO voteVO, HttpSession session, Model model) throws Exception {

        Map<String, Object> vote = evoteService.voteRead(v_Num);
        List<Map> voted = evoteService.votedRead(v_Num);
        //List<Map> list = appedixService.fileList(i_Num);
        //List<Map> chargerList = evoteService.chargerRead(v_Num);
//		Map<String, Object> cowork = new HashMap<String,Object>();
//		cowork = (Map<String, Object>) session.getAttribute("coworklist");
//
//		String c_Id = (String) cowork.get("c_Id");
        System.out.println("=====controller insertVoter=====");
        System.out.println("vd_Num: " + vd_Num);
        System.out.println("v_Num: " + v_Num);
        System.out.println("c_Id: " + c_Id);
        System.out.println("Model: " + voteVO.getMem_Id());
        //System.out.println("member: "+member);
        System.out.println("================================");
        Map<String, Object> member = new HashMap<String, Object>();
        member = (Map<String, Object>) session.getAttribute("member");

        String mem_Id = (String) member.get("mem_Id");

        Map<String, Object> cmap = new HashMap<String, Object>();
        cmap.put("mem_Id", mem_Id);///
        cmap.put("c_Id", c_Id);///

        cmap.put("v_Num", v_Num);///
        cmap.put("vd_Num", vd_Num);///

        ModelAndView mav = new ModelAndView("redirect:/project/vote/read?v_Num=" + v_Num);
        System.out.println("ccccccccccvcccccc" + cmap);
        evoteService.voterInsert(cmap);
        mav.addObject("voteRead", vote);
        mav.addObject("votedRead", voted);

        return mav;
    }

}





