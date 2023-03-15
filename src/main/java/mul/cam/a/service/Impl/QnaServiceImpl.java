package mul.cam.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.QnaDao;
import mul.cam.a.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {

	
	@Autowired
	QnaDao dao;
}
