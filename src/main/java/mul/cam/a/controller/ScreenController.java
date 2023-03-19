package mul.cam.a.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;
import mul.cam.a.service.BbsService;
import mul.cam.a.service.MemberService;



@Controller
public class ScreenController {
    
    @Autowired
    MemberService memservice;
    @Autowired
    BbsService bbsservice;

    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do
    @GetMapping(value = "admin.do")
    public String admin () {
        System.out.println("  @ ScreenController admin (): " + new Date());
        return "layoutAdmin";
    }
    
    @GetMapping(value = "adminMem.do")
    public String adminMem (Model model) {
        System.out.println("  @ ScreenController admin (): " + new Date());
        //List<MemberDto> list = serive.allMember();
        //model.addAttribute("list", list);
        return "layoutAdmin_Mem";
    }
    
    @GetMapping(value = "adminQna.do")
    public String adminQna (Model model) {
        System.out.println("  @ ScreenController admin (): " + new Date());
        //List<MemberDto> list = serive.allMember();
        //model.addAttribute("list", list);
        return "layoutAdmin_Qna";
    }   
    
    @GetMapping(value = "qna.do")
    public String qna () {
        System.out.println("  @ ScreenController qna (): " + new Date());
        return "layoutQna";
    }
    
    @GetMapping(value = "qnawr.do")
    public String adminQnawr (Model model) {
        System.out.println("  @ ScreenController qnawr (): " + new Date());

        return "layoutQnaWr";
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
//    @GetMapping(value = "main.do")
//    public String main (BbsDto dto, Model model) {
//        System.out.println("  @ ScreenController main (): " + new Date());
//        List<BbsDto> blist = bbsservice.mainBbsList(dto);
//        model.addAttribute("bbslist", blist);
//        
//        return "layoutMain";
//    }
    
    @GetMapping(value = "main.do")
    public String main (BbsParam param, Model model) {
        System.out.println("  @ ScreenController main (): " + new Date());
        // 湲��쓽 �떆�옉怨� �걹
        int pn = param.getPageNumber();  // 0 1 2 3 4
        int start = 1 + (pn * 8);  // 1  11
//        int start = 1;  // 1  11
        int end = (pn + 1) * 8;    // 10 20 
        
        param.setStart(start);
        param.setEnd(end);
        
        List<BbsDto> list = bbsservice.bbslist(param);
        int len = bbsservice.getAllBbs(param);
        
        int pageBbs = len / 8;     // 25 / 10 -> 2
        if((len % 10) > 0) {
            pageBbs = pageBbs + 1;
        }
        
        if(param.getChoice() == null || param.getChoice().equals("")
            || param.getSearch() == null || param.getSearch().equals("")) {
            param.setChoice("寃��깋");
            param.setSearch("");
        }
        
        model.addAttribute("bbslist", list);    // 寃뚯떆�뙋 由ъ뒪�듃
        model.addAttribute("pageBbs", pageBbs); // 珥� �럹�씠吏��닔
        model.addAttribute("pageNumber", param.getPageNumber()); // �쁽�옱 �럹�씠吏�
        model.addAttribute("choice", param.getChoice());    // 寃��깋 移댄뀒怨좊━
        model.addAttribute("search", param.getSearch());    // 寃��깋�뼱  
        
        return "layoutMain";
    }
    
    @GetMapping(value = "update.do")
    public String update (int seq, Model model) {
        System.out.println("  @ ScreenController update (): " + new Date());
        
        System.out.println("seq"+seq);
        
        // seq에 해당하는 list 저장
        List<BbsDto> bbsPostList= bbsservice.bbsPostList(seq);
        // list의 첫번째 dto에 해당하는 게시글 저장
        System.out.println("bbsPostList"+bbsPostList);
        BbsDto bbsPostDto = bbsservice.bbsPostDto(bbsPostList.get(0));
        System.out.println("bbsPostDto"+bbsPostDto);
        
        
        model.addAttribute("bbsPostList", bbsPostList);
        model.addAttribute("bbsPostDto", bbsPostDto);
        
        
        return "layoutUpdate";
    }
    
    
    
    @GetMapping(value = "my.do")
    public String my () {
        System.out.println("  @ ScreenController my (): " + new Date());
        return "layoutMy";
    }
    

    
    @GetMapping(value = "write.do")
    public String write () {
        System.out.println("  @ ScreenController write (): " + new Date());
        return "layoutWrite";
    }
    
    
}
