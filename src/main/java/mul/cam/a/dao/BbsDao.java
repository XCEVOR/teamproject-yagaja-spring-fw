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
    
}
