package mul.cam.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.MemberDao;
import mul.cam.a.service.MemberService;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
}
