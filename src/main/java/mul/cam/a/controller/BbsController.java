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
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
 
    
    @GetMapping(value = "mainid.do")
    public String main (String id, Model model) {
        System.out.println("  @ ScreenController main (): " + new Date());
        System.out.println("  @ ScreenController main id (): " + id);
        BbsDto dto = new BbsDto(id, "aaaa", "aaaaa");
        List<BbsDto> blist = service.mainBbsList2(dto);
        model.addAttribute("bbslist", blist);
        
        return "layoutMain";
    }
    
    @GetMapping(value = "bbsupdateAf.do")
    public String bbsupdateAf(BbsDto dto, Model model) {
        System.out.println(dto.toString());
        boolean isSucc = service.updateBbs(dto);
        
        String bbsupdate = "BBS_UPDATE_SUCCESS";
        if(isSucc == false) {          
            bbsupdate = "BBS_UP_FAIL";
        }
        model.addAttribute("bbsupdate", bbsupdate);
        model.addAttribute("seq", dto.getSeq());
        
        List<BbsDto> blist = service.mainBbsList(dto);
        model.addAttribute("bbslist", blist);
        
        return "layoutMain";
    }
    
}
