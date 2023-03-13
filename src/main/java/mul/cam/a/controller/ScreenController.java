package mul.cam.a.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ScreenController {

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
    @GetMapping(value = "detail.do")
    public String detail () {
        System.out.println("  @ ScreenController detail (): " + new Date());
        return "layoutDetail";
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
    public String main () {
        System.out.println("  @ ScreenController main (): " + new Date());
        return "layoutMain";
    }
    
    
}
