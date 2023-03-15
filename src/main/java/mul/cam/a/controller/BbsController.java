package mul.cam.a.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.service.BbsService;

@Controller
public class BbsController {

	
	
	@Autowired
	BbsService service;
	
	
	
	
	
    @GetMapping(value = "mytest01.do")
    public String main (String id, Model model) {
        System.out.println("  @ ScreenController main (): " + new Date());
        System.out.println("  @ ScreenController main id (): " + id);
		BbsDto dto = new BbsDto(0, id, null, null, null, null, 0, 0, 0);
		List<BbsDto> blist = service.myBbsTest(dto);
		model.addAttribute("bbslist", blist);
		
        return "layoutMain";
    }
	
}
