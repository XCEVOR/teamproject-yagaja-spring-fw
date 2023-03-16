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
    
    @GetMapping(value = "mainsearch.do")
	public String mainsearch (BbsParam param, Model model) {
		
		// 글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<BbsDto> list = service.bbslist(param);
//		int len = service.getAllBbs(param);
		
//		int pageBbs = len / 10;		// 25 / 10 -> 2
//		if((len % 10) > 0) {
//			pageBbs = pageBbs + 1;
//		}
		
		if(param.getChoice() == null || param.getChoice().equals("")
			|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}
		
		model.addAttribute("bbslist", list);	// 게시판 리스트
//		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어	
		
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
