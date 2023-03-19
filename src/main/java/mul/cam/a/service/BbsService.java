package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;

public interface BbsService {

    
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
    boolean updateBbs(BbsDto dto);
    
    
    
    // ========== ========== ========== ========== ========== ========== ========== 
    //write.do
    boolean bbsTempwriteAf(BbsDto dto);
    List<BbsDto>bbstTempList();
    BbsDto bbstTempDto(String date);
    boolean bbsTempupdateAf(BbsDto dto);
    boolean bbsTempdelete(String date);
    boolean bbsTempAlldelete();
    BbsDto bbstempfirstGet();
    boolean bbsTempsaveAf();
    boolean bbswrite(BbsDto dto);
    
    // ========== ========== ========== ========== ========== ========== ========== 
    // update.do
    
    List<BbsDto> bbsPostList(int bbsseq);
    BbsDto bbsPostDto(BbsDto dto);
    boolean bbsPostdelete(BbsDto dto);
    boolean bbsPostwriteAf(BbsDto dto);
    boolean bbsPostupdateAf(BbsDto dto);
}
