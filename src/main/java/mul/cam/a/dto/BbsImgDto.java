package mul.cam.a.dto;

import java.io.Serializable;

public class BbsImgDto implements Serializable{

	private int seq;
	private String id;
	private String nickname;
	private String title;
	private String content;
	private String wdate;
	private int ans; //0은 대답전 1 대답완료
	private int secret; //0 비밀글x 1 비밀글
	private int depth;  //답글이지만 1번이상 x
	private int step; //답글용
	
	
	
}
