package mul.cam.a.dao.impl;

import java.util.List;

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
    // delete.do
	
	@Override
	public List<MemberDto> allMember() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"allMember");
	}
	
	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return session.delete(ns+"deleteMember", id);
	}
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do, mypageUpdAf.do
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

	@Override
	public int myupdate(MemberDto dto) {
		// TODO Auto-generated method stub
		return session.update(ns+"myupdate", dto);
	}
	
	@Override
	public MemberDto findId(MemberDto dto) {
		MemberDto findId = session.selectOne(ns + "findId", dto);
		return findId;
	}
	
	@Override
	public MemberDto findPwd(MemberDto dto) {
		MemberDto findPwd = session.selectOne(ns + "findPwd", dto);
		return findPwd;
	}
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
}
