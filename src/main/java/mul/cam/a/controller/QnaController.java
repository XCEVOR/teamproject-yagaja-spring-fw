package mul.cam.a.controller;

import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.cam.a.dto.QnaDto;
import mul.cam.a.service.QnaService;

@Controller
public class QnaController {

	
	@Autowired
	QnaService service;
	
	@PostMapping(value = "qnawriteAf.do")
	public String qnawriteAf(QnaDto dto, Model model) {
		System.out.println(dto.toString());
		
		boolean b = service.writeQna(dto);
		System.out.println("chk1");
		String msg = "qna_write_no";
		if(b) {
			msg = "qna_write_yes";
		}
		model.addAttribute("writemsg",msg);
		System.out.println("chk2");
		return "layoutMessage";
	}
	
	//qna삭제
	@RequestMapping(value="qnadelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String delete(HttpServletRequest req) {
		System.out.println("qnadelete " + new Date());
		String str[] = req.getParameterValues("valueArr");
		String msg ="del_yes";
		System.out.println(Arrays.toString(str));
		System.out.println(Integer.parseInt(str[0]));
		for(int i = 0; i< str.length; i++) {
			int seq = Integer.parseInt(str[i]);
			boolean b = service.deleteQna(seq);
			System.out.println("chk1");
			if(!b) {
				msg ="del_no";
				return msg;
			}
			msg ="del_yes";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "answerAf.do", method = RequestMethod.POST)
	public String answerAf(Model model, int seq, QnaDto dto) {
		System.out.println(dto.getSeq());
		System.out.println(seq);
		dto.setSeq(seq);
		boolean isS = service.answerQns(dto);
		System.out.println("check2");
		String msg= "";
		
		if(isS) {	
			msg = "Qns_Answer_OK";		
		}else {
			msg = "Qns_Answer_NO";
		}
		
		model.addAttribute("qnaupdwrite", msg);
		System.out.println("check4");
		return "layoutMessage";
	}
}
