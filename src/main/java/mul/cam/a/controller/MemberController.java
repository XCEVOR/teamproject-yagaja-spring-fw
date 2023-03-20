package mul.cam.a.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.cam.a.dto.MemberDto;
import mul.cam.a.service.MemberService;
import mul.cam.a.service.Impl.MemberServiceImpl;

@Controller
public class MemberController {

    
    
    @Autowired
    MemberService service;
    
    // 로그인
    @RequestMapping(value = "loginAf.do", method= RequestMethod.POST)
	public String login(HttpServletRequest req, Model model, MemberDto dto) {
		
    	System.out.println("MemberController login " + new Date());
    	MemberDto mem = service.login(dto);
    	System.out.println("MemberController login2 " + dto);
		String msg = "";
		if(mem != null) {	// login 성공
			req.getSession().setAttribute("login", mem);
		//	req.getSession().setMaxInactiveInterval(60 * 2);
			
			msg = "LOGIN_OK";
		}else {				// login 실패
			msg = "LOGIN_FAIL";
		}
		model.addAttribute("login", msg);		
    	
    	return "layoutMessage";
    }
    
    // 회원가입 
    @RequestMapping(value = "signupAf.do", method = RequestMethod.POST)
	public String signupAf(Model model, MemberDto dto) {
		System.out.println("MemberController signup " + new Date());
		boolean isS = service.addMember(dto);
		System.out.println(dto);
		String message = "";
		if(isS) {
			message = "MEMBER_ADD_YES";
		}else {
			message = "MEMBER_ADD_NO";
		}
		model.addAttribute("message", message);		
		
		return "layoutMessage";
	}
    
    @ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
		System.out.println("MemberController idcheck " + new Date());
		
		boolean isS = service.idCheck(id);
		if(isS == true) {	// id가 있음
			return "NO";
		}		
		return "YES";	// id가 없음
	}
    
    //내정보 수정
	@PostMapping(value="mypageUpdAf.do")
	public String mypageUpdAf(MemberDto dto, Model model) {
		
		boolean b = service.myupdate(dto);
		String msg = "mem_update_fail";
		if(b) {
			msg = "mem_update_success";
		}
		model.addAttribute("memupdate", msg);
		model.addAttribute("id", dto.getId());
		
		return "layoutMessage";
	}
	
	// log out
	@GetMapping(value="logout.do")
    public String logout(HttpSession session) {
        // invalidate the session to remove all session attributes
        session.invalidate();
            
        // redirect to the home page or any other page after logout
        return "layoutLogin";
    }
	
	// 아이디찾기
			@RequestMapping(value = "findId.do", method = RequestMethod.GET)
			public String findId() {
				System.out.println("MemberController findId " + new Date());
				
				return "layoutfindId";			
			}	
			
			@RequestMapping(value="findIdAf.do",  method = RequestMethod.POST)
		 	public String findIdAf(Model model, MemberDto dto ) {
				
				System.out.println("MemberController findIdAf " + new Date());
		 		
				MemberDto findId = service.findId(dto);	// 데이터 형태로 .  		
		 		
		 		System.out.println(findId);
		 		model.addAttribute("findId", findId);
			
		 		return "layoutfindIdAf";		
		 	}
			
			// 비밀번호찾기
					@RequestMapping(value = "findPwd.do", method = RequestMethod.GET)
					public String findPwd() {
						System.out.println("MemberController findPwd " + new Date());
						
						return "layoutfindPwd";			
					}	
					
					@RequestMapping(value="findPwdAf.do",  method = RequestMethod.POST)
				 	public String findPwdAf(Model model, MemberDto dto ) {
						
						System.out.println("MemberController findPwdAf " + new Date());
				 		
						MemberDto findPwd = service.findPwd(dto);	// 데이터 형태로 .  		
				 		
				 		System.out.println(findPwd);
				 		model.addAttribute("findPwd", findPwd);
					
				 		return "layoutfindPwdAf";		
				 	}
	
		//멤버삭제
		@RequestMapping(value="memberdelete.do", method = RequestMethod.POST)
		@ResponseBody
		public String delete(HttpServletRequest req) {
			System.out.println("delete " + new Date());
			String str[] = req.getParameterValues("valueArr");
			String msg ="del_yes";
			System.out.println(Arrays.toString(str));
			for(int i = 0; i< str.length; i++) {
				
				boolean b = service.deleteMember(str[i]);
				if(!b) {
					msg ="del_no";
					return msg;
				}
				msg ="del_yes";
			}
			
			return msg;
		}
}

