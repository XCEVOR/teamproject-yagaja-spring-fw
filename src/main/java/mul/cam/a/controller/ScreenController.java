package mul.cam.a.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.QnaDto;
import mul.cam.a.service.BbsService;
import mul.cam.a.service.MemberService;
import mul.cam.a.service.QnaService;



@Controller
public class ScreenController {
    
    @Autowired
    MemberService memservice;
    @Autowired
    BbsService bbsservice;
	@Autowired
	QnaService qservice;
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
        List<MemberDto> list = memservice.allMember();
        model.addAttribute("list", list);
        return "layoutAdmin_Mem";
    }
    
    @GetMapping(value = "adminQna.do")
    public String adminQna (Model model) {
        System.out.println("  @ ScreenController admin (): " + new Date());
	  	List<QnaDto> list = qservice.qnalist();
	  	model.addAttribute("qnalist", list);
        return "layoutAdmin_Qna";
    }   
    
    @GetMapping(value = "qna.do")
    public String qna (Model model) {
        System.out.println("  @ ScreenController qna (): " + new Date());
	  	List<QnaDto> list = qservice.qnalist();
	  	model.addAttribute("qnalist", list);
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
    public String detail1 (int seq, Model model) {
        System.out.println("  @ ScreenController detail (): " + new Date());
        int bbsseq = seq;
        List<BbsDto> allBbsPostList = bbsservice.getAllBbsPost(bbsseq);
        model.addAttribute("allBbsPostList", allBbsPostList);
 
        // 유사 해시태그를 찾기 위한 함수 
        // 해당 seq에 있는 게시물에 접근 -> 해당 해시태그 검사 -> 유사 시 uniqueHashtagsMap에 추가
        // 겹치는 값을 없애기 위한 key값 사용 
        Map<Integer, BbsDto> uniqueHashtagsMap = new HashMap<>();
        for (int i = 0; i < allBbsPostList.size(); i++) {
            BbsDto dto = allBbsPostList.get(i);
            String tags[] = dto.getHashtags().split(",");
            for (int j = 0; j < tags.length; j++) {
                List<BbsDto> list = bbsservice.detailhashtag(tags[j]);
                for (int k = 0; k < list.size(); k++) {
                    BbsDto hashtag = list.get(k);
                    int tseq = hashtag.getSeq();
                    if (!uniqueHashtagsMap.containsKey(tseq)) {
                        uniqueHashtagsMap.put(tseq, hashtag);
                    }
                }
            }
        }
        List<BbsDto> uniqueHashtags = new ArrayList<>(uniqueHashtagsMap.values());
        System.out.println("uniqueHashtags==="+uniqueHashtags);
        
        model.addAttribute("uniqueHashtags", uniqueHashtags);
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
    
    // 초기 화면 출력해 주는 컨트롤러.
    @GetMapping(value = "main.do")
    public String main (BbsParam param, Model model) {
        System.out.println("  @ ScreenController main (): " + new Date());
        // 湲��쓽 �떆�옉怨� �걹
        int pn = param.getPageNumber();  // 0 1 2 3 4
        int start = 1 + (pn * 10);  // 1  11   // => 8 pics
//        int start = 1;  // 1  11
        int end = (pn + 1) * 10;    // 10 20    // => 8 pics
        
        param.setStart(start);
        param.setEnd(end);
        
        List<BbsDto> list = bbsservice.bbsMainList(param);
        int len = bbsservice.getAllBbs(param);
        
        int pageBbs = len / 10;     // 25 / 10 -> 2   // => 8 pics
        if((len % 10) > 0) {
            pageBbs = pageBbs + 1;
        }
        
        if(param.getChoice() == null || param.getChoice().equals("")
            || param.getSearch() == null || param.getSearch().equals("")) {
            param.setChoice("寃��깋");
            param.setSearch("");
        }
        
        model.addAttribute("bbslist", list);   
        model.addAttribute("pageBbs", pageBbs);
        model.addAttribute("pageNumber", param.getPageNumber()); 
        model.addAttribute("choice", param.getChoice());   
        model.addAttribute("search", param.getSearch());    
        
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
        
        bbsservice.bbsTempAlldelete();
        return "layoutWrite";
    }
    
    
}
