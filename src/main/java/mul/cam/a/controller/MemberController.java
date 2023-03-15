package mul.cam.a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import mul.cam.a.service.MemberService;

@Controller
public class MemberController {

    
    
    @Autowired
    MemberService service;
}
