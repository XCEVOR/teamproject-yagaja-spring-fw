package mul.cam.a.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.service.BbsService;
import mul.cam.a.service.MemberService;

@Controller
public class ScreenController {
	
	
	@Autowired
	MemberService mservice;
	@Autowired
	BbsService bservice;

    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do
    @GetMapping(value = "admin.do")
    public String admin () {
        System.out.println("  @ ScreenController admin (): " + new Date());
        return "layoutAdmin";
    }
    
    @GetMapping(value = "qna.do")
    public String qna () {
        System.out.println("  @ ScreenController qna (): " + new Date());
        return "layoutQna";
    }
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do
    @GetMapping(value = "detail1.do")
    public String detail1 () {
        System.out.println("  @ ScreenController detail (): " + new Date());
        return "layoutDetail1";
    }
    
    @GetMapping(value = "detail2.do")
    public String detail2 () {
        System.out.println("  @ ScreenController detai2 (): " + new Date());
        return "layoutDetail2";
    }
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do
    @GetMapping(value = "login.do")
    public String login () {
        System.out.println("  @ ScreenController login (): " + new Date());
        return "layoutLogin";
    }
    
    @GetMapping(value = "signup.do")
    public String signup () {
        System.out.println("  @ ScreenController signup (): " + new Date());
        return "layoutSignup";
    }
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
    @GetMapping(value = "main.do")
    public String main (BbsDto dto, Model model) {
        System.out.println("  @ ScreenController main (): " + new Date());
		
		
		dto = new BbsDto(0, null, null, null, null, null, 0, 0, 0);
		
		List<BbsDto> blist = bservice.myBbsTest(dto);
		model.addAttribute("bbslist", blist);
		
        return "layoutMain";
    }
    
    
    
    @GetMapping(value = "my.do")
    public String my () {
        System.out.println("  @ ScreenController my (): " + new Date());
        return "layoutMy";
    }
    
    @GetMapping(value = "update.do")
    public String update () {
        System.out.println("  @ ScreenController update (): " + new Date());
        return "layoutUpdate";
    }
    
    @GetMapping(value = "write.do")
    public String write () {
        System.out.println("  @ ScreenController write (): " + new Date());
        return "layoutWrite";
    }
    
    
}
