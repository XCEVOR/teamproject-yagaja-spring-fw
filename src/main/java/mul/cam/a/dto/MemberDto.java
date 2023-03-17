
package mul.cam.a.dto;

import java.io.Serializable;

public class MemberDto  implements Serializable{
	
	private String id;
	private String pwd;
	private String phonenumber;
	private String nickname;
	private String email;
	private int auth; //����
	private String mbti;
	private String grade;
	private String gender;
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberDto(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public MemberDto(String id, String pwd, String phonenumber, String nickname, String email, int auth, String mbti,
			String grade, String gender) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.phonenumber = phonenumber;
		this.nickname = nickname;
		this.email = email;
		this.auth = auth;
		this.mbti = mbti;
		this.grade = grade;
		this.gender = gender;
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

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", phonenumber=" + phonenumber + ", nickname=" + nickname
				+ ", email=" + email + ", auth=" + auth + ", mbti=" + mbti + ", grade=" + grade + ", gender=" + gender
				+ "]";
	}


}


	