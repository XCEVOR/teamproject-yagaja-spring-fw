package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.BbsDao;
import mul.cam.a.dto.BbsDto;


@Repository
public class BbsDaoImpl implements BbsDao {

	
	@Autowired
	SqlSession session;
	
	String ns = "Bbs.";
	
	
	
	
	@Override
	public List<BbsDto> myBbsTest(BbsDto dto) {
		System.out.println("   @ dto.getId():  " + dto.getId());
		return session.selectList(ns + "mybbstest", dto);
	}
}
