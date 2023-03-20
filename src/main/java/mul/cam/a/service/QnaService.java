package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.QnaDto;

public interface QnaService {
	boolean writeQna(QnaDto dto);
	
	List<QnaDto> qnalist();
	
	boolean deleteQna(int seq);
	
	boolean answerQns(QnaDto dto);
}
