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
    @Override
    public List<BbsDto> getAllBbsPost (int bbsseq) {
        System.out.println("   @  getAllBbsPost (int bbsseq):  " + bbsseq);
        return session.selectList(ns + "getAllBbsPost", bbsseq);
    }
    
    
    
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
	public List<BbsDto> bbsMainList (BbsParam bbs) {		
		return session.selectList(ns + "bbsMainList", bbs);
	}
    
	@Override
    public int getAllBbs(BbsParam bbs) {        
        return session.selectOne(ns + "getAllBbs", bbs);
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
    @Override
    public int bbsTempupdateAfnotImg(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.update(ns+"bbsTempupdateAfnotImg", dto);
    }
    
    
 // ========== ========== ========== ========== ========== ========== ========== 
    //update.do
    
    @Override
    public BbsDto bbsPostDto(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.selectOne(ns+"bbsPostDto", dto);
    }@Override
    public List<BbsDto> bbsPostList(int bbsseq) {
    	// TODO Auto-generated method stub
    	return session.selectList(ns+"bbsPostList",bbsseq);
    }
    @Override
    public int bbsPostdelete(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.update(ns+"bbsPostdelete", dto);
    }
    @Override
    public int bbsPostupdateAf(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.update(ns+"bbsPostupdateAf",dto);
    }
    @Override
    public int bbsPostwriteAf(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.insert(ns+"bbsPostwriteAf", dto);
    }
    @Override
    public int bbsPostupdateAfnotImg(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return session.update(ns+"bbsPostupdateAfnotImg", dto);
    }
}
