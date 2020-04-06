package project.sungho.aop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.soap.Addressing;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import project.sungho.cowork.service.CoworkService;
import project.sungho.cowork.vo.CoworkVO;

@Aspect
@EnableAspectJAutoProxy(proxyTargetClass = true)
@Component
public class CoworkAopImpl {

	/*
	 * @Autowired CoworkService coworkService;
	 */
	/*
	 * public void searchList(Model model) throws Exception {
	 * System.out.println("aop실행"); HttpServletRequest request =
	 * ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).
	 * getRequest();
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * String mem_Id = (String)session.getAttribute("mem_id");
	 * 
	 * Map<String, Object> searchMap = new HashMap<String, Object>();
	 * searchMap.put("mem_Id", mem_Id);
	 * 
	 * List<CoworkVO> list = coworkService.searchList(searchMap); //vo타입에 list를 생성하고
	 * 서비스에서 가져온 데이터를 list에 넣습니다
	 * 
	 * model.addAttribute("coworklist", list); //work_List 라는 이름으로 list객체를 넣습니다
	 * 
	 * //뷰url지정해주세요
	 * 
	 * }
	 */

	// @After("execution(* project.*..*.*())")

	
	@Autowired
	CoworkService coworkService;
	
//	@After("execution(* project.*.*.dao.*.*(..))")
//	public void aroundAdvice() throws Throwable {
//
//		HttpServletRequest request = 
//				((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
//				.getRequest();
//
//		HttpSession session = request.getSession();
//
//		String mem_Id = (String) session.getAttribute("mem_Id");
//
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		searchMap.put("mem_Id", mem_Id);
//		 
//		List<CoworkVO> list = coworkService.searchList(searchMap);
//		
//		request.setAttribute("coworklist", list);
//
//		System.out.println("AOP 실행");
//	}
}
