package mul.cam.a.dto;

import java.io.Serializable;

public class QnaDto implements Serializable{
	
	private int seq;
	private String id;
	private String nickname;
	private String title;
	private String content;
	private String wdate;
	private int ans; //0�� ����� 1 ���Ϸ�
	private int secret; //0 ��б�x 1 ��б�
	private int depth;  //��������� 1���̻� x
	private int step; //��ۿ�
	
	
	public QnaDto() {
		// TODO Auto-generated constructor stub
	}


	public QnaDto(int seq, String id, String nickname, String title, String content, String wdate, int ans, int secret,
			int depth, int step) {
		super();
		this.seq = seq;
		this.id = id;
		this.nickname = nickname;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.ans = ans;
		this.secret = secret;
		this.depth = depth;
		this.step = step;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getWdate() {
		return wdate;
	}


	public void setWdate(String wdate) {
		this.wdate = wdate;
	}


	public int getAns() {
		return ans;
	}


	public void setAns(int ans) {
		this.ans = ans;
	}


	public int getSecret() {
		return secret;
	}


	public void setSecret(int secret) {
		this.secret = secret;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}


	public int getStep() {
		return step;
	}


	public void setStep(int step) {
		this.step = step;
	}


	@Override
	public String toString() {
		return "QnaDto [seq=" + seq + ", id=" + id + ", nickname=" + nickname + ", title=" + title + ", content="
				+ content + ", wdate=" + wdate + ", ans=" + ans + ", secret=" + secret + ", depth=" + depth + ", step="
				+ step + "]";
	}
	

}
