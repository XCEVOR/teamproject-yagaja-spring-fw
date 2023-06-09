package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.BbsCommentDto;
import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;

public interface BbsDao {

    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do
    List<BbsDto> getAllBbsPost (int bbsseq);
    int commentWrite(BbsCommentDto bbs);
    List<BbsCommentDto> commentList(int seq);
    List<BbsDto> detailhashtag(String tag);
    int readcount (int seq);
    int likecount (int seq);
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
    List<BbsDto> mainBbsList(BbsDto dto);
    List<BbsDto> mainBbsList2(BbsDto dto);
    List<BbsDto> bbsMainList (BbsParam bbs);	
    int getAllBbs(BbsParam bbs);
    
    BbsDto getBbsTest(int seq);
    int updateBbs(BbsDto dto);
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // write.do
    int bbsTempwriteAf(BbsDto dto);
    List<BbsDto>bbstTempList();
    BbsDto bbstTempDto(String date);
    int bbsTempupdateAf(BbsDto dto);
    int bbsTempupdateAfnotImg(BbsDto dto);
    int bbsTempdelete(String date);
    int bbsTempAlldelete();
    BbsDto bbstempfirstGet();
    int bbsTempsaveAf();
    int bbswrite(BbsDto dto);
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // update.do
    
    List<BbsDto> bbsPostList(int bbsseq);
    BbsDto bbsPostDto(BbsDto dto);
    int bbsPostdelete(BbsDto dto);
    int bbsPostupdateAf(BbsDto dto);
    int bbsPostupdateAfnotImg(BbsDto dto);
    int bbsPostwriteAf(BbsDto dto);
    
   
    
}
