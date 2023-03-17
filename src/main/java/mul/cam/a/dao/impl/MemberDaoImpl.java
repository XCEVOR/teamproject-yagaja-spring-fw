package mul.cam.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.MemberDao;
import mul.cam.a.dto.MemberDto;
@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession session;

	String ns = "Member.";
	
	
	
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do
	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto mem = session.selectOne(ns + "login", dto);
		return mem;
	}


	@Override
	public int addMember(MemberDto dto) {	
		return session.insert(ns + "addmember", dto);
	}


	@Override
	public int idCheck(String id) {
		return session.selectOne(ns + "idcheck", id);
	}

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
}
