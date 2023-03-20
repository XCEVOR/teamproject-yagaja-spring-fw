package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.QnaDao;
import mul.cam.a.dto.QnaDto;
@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	SqlSession session;
	
	String qna = "Qna."; 
	@Override
	public int writeQna(QnaDto dto) {
		// TODO Auto-generated method stub
		return session.insert(qna+"writeQna", dto);
	}
	@Override
	public List<QnaDto> qnalist() {
		// TODO Auto-generated method stub
		return session.selectList(qna+"qnalist");
	}
	@Override
	public int deleteQna(int seq) {
		// TODO Auto-generated method stub
		return session.delete(qna+"deleteQna", seq);
	}
	
	@Override
	public int answerUpdate(QnaDto dto) {
		// TODO Auto-generated method stub
		return session.update(qna +"answerUpdate",dto);
	}

	@Override
	public int answerInsert(QnaDto dto) {
		// TODO Auto-generated method stub
		return session.insert(qna +"answerInsert", dto);
	}
	
}
