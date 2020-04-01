package project.member.vo;

import java.util.Date;

public class MemberVO {
	//VO는 파라미터와 이름을 맞춰줘야 자동으로 get set 가능합니다. 가능하면 이름 통일해주세요
	private String memId;
	private String memPw;
	private String memName;
	private Date memJoinDate;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Date getJoinDate() {
		return memJoinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.memJoinDate = joinDate;
	}
	
	
	
}