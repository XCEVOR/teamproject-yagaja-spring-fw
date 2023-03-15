package mul.cam.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.BbsDao;
import mul.cam.a.dto.BbsDto;
import mul.cam.a.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService{

	@Autowired
	BbsDao dao;
	
	
	
	
	@Override
	public List<BbsDto> myBbsTest(BbsDto dto) {
		return dao.myBbsTest(dto);
	}
}
