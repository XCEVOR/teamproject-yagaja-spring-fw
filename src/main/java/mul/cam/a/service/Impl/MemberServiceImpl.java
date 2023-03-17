package mul.cam.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.MemberDao;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.service.MemberService;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;

	
	
	
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do, mypageUpdAf.do
	
	@Override
	public MemberDto login(MemberDto dto) {
		
		return dao.login(dto);
	}

	@Override
	public boolean addMember(MemberDto dto) {
		int count = dao.addMember(dto);
		return count>0?true:false;
	}

	@Override
	public boolean idCheck(String id) {
		int count = dao.idCheck(id);
		return count>0?true:false;
	}

	@Override
	public boolean myupdate(MemberDto dto) {
		// TODO Auto-generated method stub
		int cnt = dao.myupdate(dto);
		return cnt>0?true:false;
	}
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
}
