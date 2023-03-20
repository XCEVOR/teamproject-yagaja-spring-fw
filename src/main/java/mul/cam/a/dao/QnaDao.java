package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.QnaDto;

public interface QnaDao {
	int writeQna(QnaDto dto);
	
	List<QnaDto> qnalist();
	
	int deleteQna(int seq);
	
	int answerUpdate(QnaDto dto);
	
	int answerInsert(QnaDto dto);	
}
