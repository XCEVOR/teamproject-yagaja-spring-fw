package mul.cam.a.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;
import mul.cam.a.service.BbsService;
import mul.cam.a.util.PdsUtil;

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
		
		// 湲��쓽 �떆�옉怨� �걹
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
			param.setChoice("寃��깋");
			param.setSearch("");
		}
		
		model.addAttribute("bbslist", list);	// 寃뚯떆�뙋 由ъ뒪�듃
//		model.addAttribute("pageBbs", pageBbs);	// 珥� �럹�씠吏��닔
		model.addAttribute("pageNumber", param.getPageNumber()); // �쁽�옱 �럹�씠吏�
		model.addAttribute("choice", param.getChoice());	// 寃��깋 移댄뀒怨좊━
		model.addAttribute("search", param.getSearch());	// 寃��깋�뼱	
		
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
        
        return "layoutMessage";
    }
    

	@PostMapping(value = "bbsTempwriteAf.do")
	public String bbswriteAf(BbsDto dto, Model model,
			@RequestParam(value = "fileload", required = false) 
	  MultipartFile fileload, HttpServletRequest req) {
		
		System.out.println("BbsController bbsTempwriteAf" + new Date());
		System.out.println("dto"+dto.toString());
		
		String filename = fileload.getOriginalFilename(); // 원본 파일명 체크

		dto.setFilename(filename); // 원본 파일명을 setting

		// upload의 경로 설정
		// server
		String path = req.getServletContext().getRealPath("/upload");

		// 클라이언트 폴더 설정
		// String fupload = "c:\\temp"

		String filepath = path + "/" + filename;
		File file = new File(filepath);
		// 파일명을 충돌되지 않은 이름으로 변경
		String newfilename = PdsUtil.getNewFileName(filename);

		dto.setNewfilename(newfilename);


		try {
			// 실제로 파일이 생성되어 기입되는 부분
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
			
			bos.write(fileload.getBytes());
			
			bos.close();
			// db에 저장
			service.bbsTempwriteAf(dto);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/bbsTempClick.do?date=" + 0;

	}

	
	@ResponseBody
	@PostMapping(value = "bbsTempupdateAf.do")
	public String bbsTempupdateAf(BbsDto dto, Model model,
		@RequestParam(value = "fileload", required = false)
	MultipartFile fileload, HttpServletRequest req) {

		System.out.println(" BbsController bbsTempupdateAf" + new Date());
		
		
		String filename = fileload.getOriginalFilename(); // 원본 파일명 체크

		dto.setFilename(filename); // 원본 파일명을 setting

		// upload의 경로 설정
		// server
		String path = req.getServletContext().getRealPath("/upload");

		// 클라이언트 폴더 설정
		// String fupload = "c:\\temp"

		String filepath = path + "/" + filename;
		File file = new File(filepath);
		// 파일명을 충돌되지 않은 이름으로 변경
		String newfilename = PdsUtil.getNewFileName(filename);

		dto.setNewfilename(newfilename);


		try {
			// 실제로 파일이 생성되어 기입되는 부분
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
			
			bos.write(fileload.getBytes());
			
			bos.close();
			// db에 저장
			service.bbsTempupdateAf(dto);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		boolean isS = service.bbsTempupdateAf(dto);
		String bbsTempupdateAf = "";
		if (isS) {
			bbsTempupdateAf = "BBS_ADD_OK";
		} else {
			bbsTempupdateAf = "BBS_ADD_NO";
		}
		model.addAttribute("bbsTempupdateAf", bbsTempupdateAf);

		return "layoutMessage";
	}

	@GetMapping(value = "bbsTempClick.do")
	public String bbsTempClick(String date, Model model) {

		List<BbsDto> bbsTempList = service.bbstTempList();
		BbsDto bbsTempDto = service.bbstTempDto(date);
		model.addAttribute("bbsTempList", bbsTempList);
		model.addAttribute("bbsTempDto", bbsTempDto);

		return "layoutWrite";

	}

	@GetMapping(value = "bbsTempdelete.do")
	public String bbsTempdelete(String date) {

		boolean isS = service.bbsTempdelete(date);
		/*
		 * String bbsTempdelete = ""; if (isS) { bbsTempdelete= "Temp_delete_OK"; } else
		 * { bbsTempdelete = "Temp_delete_NO"; }
		 * model.addAttribute("bbsTempdelete",bbsTempdelete);
		 * 
		 * return "layoutMessage";
		 */
		return "redirect:/bbsTempClick.do?date=" + 0;
	}
	
	@GetMapping(value = "bbsTempsaveAf.do")
	public String bbsTempsaveAf() {
		
		// tempbbs 테이블의 첫번째 값을 get
		BbsDto first_dto=service.bbstempfirstGet();
		
		// bbs 테이블에 첫 번째 값을 set
		service.bbswrite(first_dto);
		
		// postbbs 테이블에 tempbbs의 모든 값을 저장
		boolean isS=service.bbsTempsaveAf();
		if(isS) {
			service.bbsTempAlldelete();
		}else {
			
		}
		
		
		return "redirect:/main.do";
		
	}
    
}
