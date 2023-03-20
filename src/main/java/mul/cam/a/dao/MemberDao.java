package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.MemberDto;

public interface MemberDao {

	

    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // delete.do
	
	List<MemberDto> allMember();
    
	int deleteMember(String id);
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do. mypageUpdAf.do
	MemberDto login(MemberDto dto);

	int addMember(MemberDto dto);
   
	int idCheck(String id);
    
	int myupdate(MemberDto dto);
	
	MemberDto findId(MemberDto dto);
	MemberDto findPwd(MemberDto dto);
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
    
}
