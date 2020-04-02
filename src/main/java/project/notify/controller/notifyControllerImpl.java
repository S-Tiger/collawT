package project.notify.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import project.notify.service.NotifyService;
import project.notify.vo.NotifyVO;

@Controller

@RequestMapping("/notify/*")
public class notifyControllerImpl implements NotifyController {
	
	
	@Autowired
	NotifyService notifyService;
	
	
	@PostMapping("/insert")
	public String notifyInsert(NotifyVO notifyVO) throws Exception {
		
		notifyService.notifyInsert(notifyVO);
		
		return "redirect:/issue/list";
	
	}
	
	@GetMapping("/insert")
	public String test() {
		return "/notify/notifyadd";
	}

	
	}

