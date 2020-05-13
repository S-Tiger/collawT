package project.euna.manager.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.euna.manager.dao.EManagerMainDAO;
import project.hm.hmp002_d001.service.Hmp002_d001Service;
import project.hm.hmp002_d001.vo.Hmp002_d001VO;
import project.sungho.comember.service.ComemberService;
import project.sungho.manager.service.ManagerService;

@Controller
@RequestMapping("/manager/euna/*")
public class EManagerMainControllerImpl implements EManagerMainController {
	@Autowired 
	EManagerMainDAO eManagerMainDAO;
	
	@Override
	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		List<Map> list = eManagerMainDAO.main();
		
		ModelAndView mav = new ModelAndView("/manager/managermain2");
		mav.addObject("recentBoard", list);
		return mav;
	} 

}
