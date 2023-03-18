package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.BbsDao;
import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;


@Repository
public class BbsDaoImpl implements BbsDao {

    
    @Autowired
    SqlSession session;
    
    String ns = "Bbs.";

    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
    @Override
    public List<BbsDto> mainBbsList (BbsDto dto) {
        System.out.println("   @  mainBbsList dto.getId():  " + dto.getId());
        return session.selectList(ns + "mainbbslist", dto);
    }

    @Override
    public List<BbsDto> mainBbsList2 (BbsDto dto) {
        System.out.println("   @ mainBbsList2 dto.getId():  " + dto.getId());
        return session.selectList(ns + "mainbbslist2", dto);
    }
    
    @Override
	public List<BbsDto> bbslist(BbsParam bbs) {		
		return session.selectList(ns + "bbslist", bbs);
	}
    
    @Override
    public BbsDto getBbsTest (int seq) {     
        return session.selectOne(ns + "getBbsTest", seq);
    }
    
    @Override
    public int updateBbs (BbsDto dto) {  
        System.out.println("   @ updateBbs dto.getId():  " + dto.getId());
        return session.update(ns + "updateBbs", dto);
    }
    
    
    
 // ========== ========== ========== ========== ========== ========== ========== 
    //write.do
    
    @Override
    public int bbsTempwriteAf(BbsDto dto) {
		// TODO Auto-generated method stub
		return session.insert(ns+"bbsTempwriteAf",dto);
	}
    @Override
    public List<BbsDto> bbstTempList() {
    	// TODO Auto-generated method stub
    	return session.selectList(ns+"bbstTempList");
    }
    @Override
    public BbsDto bbstTempDto(String date) {
    	// TODO Auto-generated method stub
    	return session.selectOne(ns+"bbstTempDto", date);
    }
    @Override
    public int bbsTempupdateAf(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.update(ns+"bbsTempupdateAf", dto);
    }
    @Override
    public int bbsTempdelete(String date) {
    	// TODO Auto-generated method stub
    	return session.delete(ns+"bbsTempdelete", date);
    }
    @Override
    public int bbsTempAlldelete() {
    	// TODO Auto-generated method stub
    	return session.delete(ns+"bbsTempAlldelete");
    }
    @Override
    public BbsDto bbstempfirstGet() {
    	// TODO Auto-generated method stub
    	return session.selectOne(ns+"bbstempfirstGet");
    }
    @Override
    public int bbsTempsaveAf() {
    	// TODO Auto-generated method stub
    	return session.insert(ns+"bbsTempsaveAf");
    }
    @Override
    public int bbswrite(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.insert(ns+"bbswrite", dto);
    }
}
