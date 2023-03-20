package mul.cam.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.BbsDao;
import mul.cam.a.dto.BbsCommentDto;
import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;
import mul.cam.a.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService{

    @Autowired
    BbsDao dao;
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do
    @Override
    public List<BbsDto> getAllBbsPost (int bbsseq) {
        return dao.getAllBbsPost(bbsseq);
    }
    
    @Override
   	public boolean commentWrite(BbsCommentDto bbs) {
       	int n = dao.commentWrite(bbs);
   		return n>0?true:false;
   	}
       
       @Override
   	public List<BbsCommentDto> commentList(int seq) {
       	return dao.commentList(seq);
   	}
    @Override
    public List<BbsDto> detailhashtag(String tag) {
        return dao.detailhashtag(tag);
    }
    
    @Override
    public boolean readcount(int seq) {
        int n = dao.readcount(seq);
        return n > 0 ? true : false;
    }
    @Override
    public boolean likecount(int seq) {
        int n = dao.likecount(seq);
        return n > 0 ? true : false;
    }

    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
    @Override
    public List<BbsDto> mainBbsList(BbsDto dto) {
        return dao.mainBbsList(dto);
    }
    
    @Override
    public List<BbsDto> mainBbsList2(BbsDto dto) {
        return dao.mainBbsList2(dto);
    }
    
	@Override
	public List<BbsDto> bbsMainList (BbsParam bbs) {		
		return dao.bbsMainList(bbs);
	}
	
	@Override
    public int getAllBbs(BbsParam bbs) {        
        return dao.getAllBbs(bbs);
    }
    
    @Override
    public BbsDto getBbsTest(int seq) {     
        return dao.getBbsTest(seq);
    }
    
    @Override
    public boolean updateBbs(BbsDto dto) {
        int n = dao.updateBbs(dto); 
        return n > 0 ? true : false;
    }
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    //write.do 
    @Override
	public boolean bbsTempwriteAf(BbsDto dto) {
		// TODO Auto-generated method stub
		return dao.bbsTempwriteAf(dto)>0;
	}
    @Override
    public List<BbsDto> bbstTempList() {
    	// TODO Auto-generated method stub
    	return dao.bbstTempList();
    }
    
    @Override
    public BbsDto bbstTempDto(String date) {
    	// TODO Auto-generated method stub
    	return dao.bbstTempDto(date);
    }
    @Override
    public boolean bbsTempupdateAf(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbsTempupdateAf(dto)>0;
    }
    @Override
    public boolean bbsTempdelete(String date) {
    	// TODO Auto-generated method stub
    	return dao.bbsTempdelete(date)>0;
    }
    @Override
    public boolean bbsTempAlldelete() {
    	// TODO Auto-generated method stub
    	return dao.bbsTempAlldelete()>0;
    }
    @Override
    public BbsDto bbstempfirstGet() {
    	// TODO Auto-generated method stub
    	return dao.bbstempfirstGet();
    }
    @Override
    public boolean bbsTempsaveAf() {
    	// TODO Auto-generated method stub
    	return dao.bbsTempsaveAf()>0;
    }
    @Override
    public boolean bbswrite(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbswrite(dto)>0;
    }
    
    @Override
    public boolean bbsTempupdateAfnotImg(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbsTempupdateAfnotImg(dto)>0;
    }
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    //update.do
    @Override
    public BbsDto bbsPostDto(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbsPostDto(dto);
    }
    @Override
    public List<BbsDto> bbsPostList(int bbsseq) {
    	// TODO Auto-generated method stub
    	return dao.bbsPostList(bbsseq);
    }
    @Override
    public boolean bbsPostdelete(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbsPostdelete(dto)>0;
    }
    @Override
    public boolean bbsPostupdateAf(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbsPostupdateAf(dto)>0;
    }
    @Override
    public boolean bbsPostwriteAf(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbsPostwriteAf(dto)>0;
    }
    @Override
    public boolean bbsPostupdateAfnotImg(BbsDto dto) {
    	// TODO Auto-generated method stub
    	return dao.bbsPostupdateAfnotImg(dto)>0;
    }
    
}
