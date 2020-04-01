package project.member.vo;

import java.util.Date;

public class MemberVO {
	//VO는 파라미터와 이름을 맞춰줘야 자동으로 get set 가능합니다. 가능하면 이름 통일해주세요
	private String mem_Id;
	private String mem_Pwd;
	private String mem_Name;
	
	
	public String getMem_Id() {
		return mem_Id;
	}
	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}
	public String getMem_Pwd() {
		return mem_Pwd;
	}
	public void setMem_Pwd(String mem_Pwd) {
		this.mem_Pwd = mem_Pwd;
	}
	public String getMem_Name() {
		return mem_Name;
	}
	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}
	
	
}