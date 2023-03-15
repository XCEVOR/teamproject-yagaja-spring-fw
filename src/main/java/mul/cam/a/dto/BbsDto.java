package mul.cam.a.dto;

import java.io.Serializable;

public class BbsDto implements Serializable {
	
	
     private int seq;
     private String id;
     private String title;
     private String nickname;
     private String content;
     private String wdate;
     private int del;
     private int readcount;
     private int likecount;
     
     public BbsDto() {
		// TODO Auto-generated constructor stub
	}
     
     

	public BbsDto(int seq, String id, String title, String nickname, String content, String wdate, int del,
			int readcount, int likecount) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.nickname = nickname;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
		this.likecount = likecount;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	@Override
	public String toString() {
		return "BbsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", nickname=" + nickname + ", content="
				+ content + ", wdate=" + wdate + ", del=" + del + ", readcount=" + readcount + ", likecount="
				+ likecount + "]";
	}
     
     
     
     

}
