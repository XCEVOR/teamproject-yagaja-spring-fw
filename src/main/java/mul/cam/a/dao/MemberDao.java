package mul.cam.a.dao;

import mul.cam.a.dto.MemberDto;

public interface MemberDao {

	

    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do
	MemberDto login(MemberDto dto);

	int addMember(MemberDto dto);
   
	int idCheck(String id);
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
    
}
