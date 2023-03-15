package mul.cam.a.dto;

import java.io.Serializable;

public class MemberDto  implements Serializable{

	
	private String id;
	private String pwd;
	private String gender;
	private String nickname;
	private String email;
	private int auth; //인증
	private String mbti;
	private String grade; //'0 고객 1 관리자'
	
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

    
	public MemberDto(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}


	public MemberDto(String id, String pwd, String gender, String nickname, String email, int auth, String mbti,
			String grade) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.gender = gender;
		this.nickname = nickname;
		this.email = email;
		this.auth = auth;
		this.mbti = mbti;
		this.grade = grade;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getAuth() {
		return auth;
	}


	public void setAuth(int auth) {
		this.auth = auth;
	}


	public String getMbti() {
		return mbti;
	}


	public void setMbti(String mbti) {
		this.mbti = mbti;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", gender=" + gender + ", nickname=" + nickname + ", email="
				+ email + ", auth=" + auth + ", mbti=" + mbti + ", grade=" + grade + "]";
	}
	
	
}
