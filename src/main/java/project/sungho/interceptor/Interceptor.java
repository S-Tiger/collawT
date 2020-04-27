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

import project.sungho.comember.service.ComemberService;
import project.sungho.comember.vo.ComemberVO;

public class Interceptor extends HandlerInterceptorAdapter {
	@Autowired
	ComemberService comemberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Map<String, Object> member = new HashMap<String,Object>();
		
		member = (Map<String, Object>) session.getAttribute("member");
		
		String uri = (String) request.getRequestURI();
		if (member == null) {
			response.sendRedirect("/member/loginPage");
			return false;
		}else if (member != null){
			System.out.println(uri);
			
			List<Map> list = comemberService.searchList(member);
			
			for (int i = 0; i < list.size(); i++) {
				switch (i) {
				case 0: list.get(i).put("color", "#28a745");
				break;
				case 1: list.get(i).put("color", "#ffc107");
				break;
				case 2: list.get(i).put("color", "#6f42c1");
				break;
				case 3: list.get(i).put("color", "#dc3545");
				break;
				case 4: list.get(i).put("color", "#007bff");
				break;
				default:
				break;
				}
			}
			
			request.setAttribute("coworklist", list);

			return true;
		}
		

//		
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