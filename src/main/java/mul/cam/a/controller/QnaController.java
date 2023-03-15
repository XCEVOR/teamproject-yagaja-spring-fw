package mul.cam.a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import mul.cam.a.service.QnaService;

@Controller
public class QnaController {

	
	@Autowired
	QnaService service;
	
}
