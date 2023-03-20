package mul.cam.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.QnaDao;
import mul.cam.a.dto.QnaDto;
import mul.cam.a.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {

	
	@Autowired
	QnaDao dao;
	
	@Override
	public boolean writeQna(QnaDto dto) {
		// TODO Auto-generated method stub
		int cnt = dao.writeQna(dto);
		return cnt>0?true:false;
	}

	@Override
	public List<QnaDto> qnalist() {
		// TODO Auto-generated method stub
		return dao.qnalist();
	}

	@Override
	public boolean deleteQna(int seq) {
		// TODO Auto-generated method stub
		int cnt = dao.deleteQna(seq);
		return cnt>0?true:false;
	}

	@Override
	public boolean answerQns(QnaDto dto) {
		// TODO Auto-generated method stub
		dao.answerUpdate(dto);
		int n = dao.answerInsert(dto);
		return n>0?true:false;
	}
}
