package mul.cam.a.service;

import mul.cam.a.dto.MemberDto;

public interface MemberService {

	

    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do
	MemberDto login(MemberDto dto);
	boolean addMember(MemberDto dto);
	boolean idCheck(String id);  

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
}
