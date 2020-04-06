package project.sungho.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import project.sungho.cowork.service.CoworkService;
import project.sungho.cowork.vo.CoworkVO;

public class Interceptor extends HandlerInterceptorAdapter {
	@Autowired
	CoworkService coworkService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String mem_Id = (String) session.getAttribute("mem_Id");

		String uri = (String) request.getRequestURI();
		if (mem_Id == null) {
			response.sendRedirect("/member/loginPage");
			return false;
		}else if (mem_Id != null){
			System.out.println(uri);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("mem_Id", mem_Id);
			 
			List<CoworkVO> list = coworkService.searchList(searchMap);
			
			request.setAttribute("coworklist", list);

			return true;
		}
		

		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

}