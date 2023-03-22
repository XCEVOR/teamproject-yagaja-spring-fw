package mul.cam.a.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.result.IntegerValueFactory;

import mul.cam.a.dto.BbsCommentDto;
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
    // detail.do ajax
    @ResponseBody
    @GetMapping(value = "ajaxDetail1.do")
    public List<BbsDto> detail1 (int bbsseq, Model model) {  // Model 필요 없음.
        System.out.println("  @ ScreenControllerrr detail (): " + new Date());
        /* int bbsseq = seq; */
        List<BbsDto> allBbsPostList = service.getAllBbsPost(bbsseq);
        // model.addAttribute("allBbsPostList", allBbsPostList);
        return allBbsPostList;
    }
    
    // comment
  	@PostMapping(value = "commentWriteAf.do")
  	public String commentWriteAf(BbsCommentDto bbs) {

  		
  		
  		boolean isS = service.commentWrite(bbs);
  		System.out.println(bbs);
  		if(isS) {
  			System.out.println("댓글작성에 성공했습니다");
  		}else {
  			System.out.println("댓글작성에 실패했습니다");
  		}
  		
  		return "redirect:/detail1.do?seq=" + bbs.getSeq();
  	}
  	
  	// commentlist
  	@ResponseBody
 	@GetMapping(value = "commentList.do")
 	public List<BbsCommentDto> commentList(int seq){
  		System.out.println("commentList.do" + new Date());
 		List<BbsCommentDto> list = service.commentList(seq);
 		System.out.println(list);
 		return list;
 	}
  	
    @ResponseBody
    @GetMapping(value = "ajaxReadcount.do")
    public String readcount (int seq) {
        System.out.println("  @ BbsController readcount (): " + new Date());
        boolean isSucc = service.readcount(seq);
        if (isSucc == false) {
            return "Fail";
        }
        return "ajaxReadcount Success";
    }

    @ResponseBody
    @GetMapping(value = "ajaxLikecount.do")
    public String likecount (int seq) {
        System.out.println("  @ BbsController likecount (): " + new Date());
        boolean isSucc = service.likecount(seq);
        if (isSucc == false) {
            return "Fail";
        }
        return "ajaxLikecount Success";
    }

    
    
    
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
    
    @ResponseBody
    @GetMapping(value = "mainnumpage.do")
    public List<BbsDto> mainnumpage (BbsParam param, Model model) {
    	System.out.println(param);
		
		
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 6);	// 1  11  // 시연을 위해 6개로 고정.
		int end = (pn + 1) * 6;	// 10 20   // 시연을 위해 6개로 고정.
		
		param.setStart(start);
		param.setEnd(end);
		
		List<BbsDto> list = service.bbsMainList(param);
		int len = service.getAllBbs(param);
	
		int pageBbs = len / 6;		// 25 / 10 -> 2  // 시연을 위해 6개로 고정.
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
		
		System.out.println(list.toString());
		return list;
	}
    
    @GetMapping(value = "mainsearch.do")
	public String mainsearch (BbsParam param, Model model) {
		
		// 글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 6);	// 1  11  // 시연을 위해 6개로 고정.
		int end = (pn + 1) * 6;	// 10 20   // 시연을 위해 6개로 고정.
		
		param.setStart(start);
		param.setEnd(end);
		
		List<BbsDto> list = service.bbsMainList(param);
		int len = service.getAllBbs(param);
		
		int pageBbs = len / 6;		// 25 / 10 -> 2  // 시연을 위해 6개로 고정.
		if((len % 10) > 0) {
			pageBbs = pageBbs + 1;
		}

		if(param.getChoice() == null || param.getChoice().equals("")
				|| param.getSearch() == null || param.getSearch().equals("")) {
				param.setChoice("검색");
				param.setSearch("");
			}
			
			model.addAttribute("bbslist", list);	// 게시판 리스트
			model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
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
        
        return "layoutMessage";
    }
    
    
    

    // ========== ========== ========== ========== ========== ========== ========== 
    // write.do
 
	
	@PostMapping(value = "bbsTempwriteAf.do")
	public String bbswriteAf(BbsDto dto, Model model,
			@RequestParam(value = "fileload", required = false) 
	  MultipartFile fileload, HttpServletRequest req) {
		
		System.out.println("BbsController bbsTempwriteAf" + new Date());
		System.out.println("dto"+dto.toString());
		 // filename 취득
	    String filename = fileload.getOriginalFilename();
	    dto.setFilename(filename);

	    // upload 경로 설정
	    // server에 파일 저장 -> 재시작 시 refresh되면서 파일 삭제됨
	    String fupload = req.getServletContext().getRealPath("/upload");
	    //String fupload = "c:\\temp";
	    // 새 파일명 취득
	    String newfilename = PdsUtil.getNewFileName(filename);
	    dto.setNewfilename(newfilename);
		
	    // 서버에 실제 파일 생성 및 기입 (= 업로드)
	    File file = new File(fupload + "/" + newfilename);
		
		try {
			// 실제로 파일이 생성되어 기입되는 부분
			 FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
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
		System.out.println("filename===="+filename);
		if(filename=="") {
			service.bbsTempupdateAfnotImg(dto);
		}else {
		
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
			service.bbsTempupdateAf(dto);			
			bos.close();
			// db에 저장

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}

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
	
	
	// ========== ========== ========== ========== ========== ========== ========== 
    // update.do
	
	
	@PostMapping(value = "bbsPostwriteAf.do")
	public String bbsPostwriteAf(BbsDto dto, Model model,
			@RequestParam(value = "fileload", required = false) 
	  MultipartFile fileload, HttpServletRequest req) {
		
		System.out.println("BbsController bbsTempwriteAf" + new Date());
		System.out.println("dto"+dto.toString());
		 // filename 취득
	    String filename = fileload.getOriginalFilename();
	    dto.setFilename(filename);

	    // upload 경로 설정
	    // server에 파일 저장 -> 재시작 시 refresh되면서 파일 삭제됨
	    String fupload = req.getServletContext().getRealPath("/upload");
	    //String fupload = "c:\\temp";
	    // 새 파일명 취득
	    String newfilename = PdsUtil.getNewFileName(filename);
	    dto.setNewfilename(newfilename);
		
	    // 서버에 실제 파일 생성 및 기입 (= 업로드)
	    File file = new File(fupload + "/" + newfilename);
		
		try {
			// 실제로 파일이 생성되어 기입되는 부분
			 FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			service.bbsPostwriteAf(dto);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/bbsTempClick.do?date=" + 0;

	}

	
	@ResponseBody
	@PostMapping(value = "bbsPostupdateAf.do")
	public String bbsPostupdateAf(BbsDto dto, Model model,
		@RequestParam(value = "fileload", required = false)
	MultipartFile fileload, HttpServletRequest req) {

		System.out.println(" BbsController bbsPostupdateAf" + new Date());
		
		
		String filename = fileload.getOriginalFilename(); // 원본 파일명 체크
		if(filename=="") {
			service.bbsPostupdateAfnotImg(dto);
		}else {
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
			service.bbsPostupdateAf(dto);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}

		

		return "layoutMessage";
	}

	@GetMapping(value = "bbsPostClick.do")
	public String bbsPostClick(BbsDto dto,Model model) {
		
	
		List<BbsDto> bbsPostList = service.bbsPostList(dto.getBbsseq());
		BbsDto bbsPostDto = service.bbsPostDto(dto);
		
		System.out.println("li"+bbsPostList);
		System.out.println("d"+bbsPostDto);
		
		
		model.addAttribute("bbsPostList", bbsPostList);
		model.addAttribute("bbsPostDto", bbsPostDto);

		return "layoutUpdate";

	}

	@GetMapping(value = "bbsPostdelete.do")
	public String bbsPostdelete(BbsDto dto) {

		boolean isS = service.bbsPostdelete(dto);
		/*
		 * String bbsTempdelete = ""; if (isS) { bbsTempdelete= "Temp_delete_OK"; } else
		 * { bbsTempdelete = "Temp_delete_NO"; }
		 * model.addAttribute("bbsTempdelete",bbsTempdelete);
		 * 
		 * return "layoutMessage";
		 */
		return "redirect:/bbsPostClick.do?date=" + 0;
	}
	
	
	
	
    
    
    
    
    
}
