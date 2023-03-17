package mul.cam.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.BbsDao;
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
	public List<BbsDto> bbslist(BbsParam bbs) {		
		return dao.bbslist(bbs);
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
    
}
