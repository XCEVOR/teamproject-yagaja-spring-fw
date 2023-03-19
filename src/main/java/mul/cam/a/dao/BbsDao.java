package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;

public interface BbsDao {

    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // admin.do, qna.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // detail.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // login.do, signup.do

    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // main.do
    List<BbsDto> mainBbsList(BbsDto dto);
    List<BbsDto> mainBbsList2(BbsDto dto);
    List<BbsDto> bbslist(BbsParam bbs);	
    int getAllBbs(BbsParam bbs);
    
    BbsDto getBbsTest(int seq);
    int updateBbs(BbsDto dto);
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // write.do
    int bbsTempwriteAf(BbsDto dto);
    List<BbsDto>bbstTempList();
    BbsDto bbstTempDto(String date);
    int bbsTempupdateAf(BbsDto dto);
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
    int bbsPostwriteAf(BbsDto dto);
    
}
