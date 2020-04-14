package project.euna.issue.vo;

import org.springframework.web.multipart.MultipartFile;

public class AppendixVO {

	private String a_RealName;
	private MultipartFile a_File;
	private String a_NameEx;
	private String i_Num;
	private String a_Num;
	private String a_Size;
	
	
	public String getA_RealName() {
		return a_RealName;
	}
	public void setA_RealName(String a_RealName) {
		this.a_RealName = a_RealName;
	}
	public MultipartFile getA_File() {
		return a_File;
	}
	public void setA_File(MultipartFile a_File) {
		this.a_File = a_File;
	}
	public String getA_NameEx() {
		return a_NameEx;
	}
	public void setA_NameEx(String a_NameEx) {
		this.a_NameEx = a_NameEx;
	}
	public String getI_Num() {
		return i_Num;
	}
	public void setI_Num(String i_Num) {
		this.i_Num = i_Num;
	}
	public String getA_Num() {
		return a_Num;
	}
	public void setA_Num(String a_Num) {
		this.a_Num = a_Num;
	}
	
	public String getA_Size() {
		return a_Size;
	}
	public void setA_Size(String a_Size) {
		this.a_Size = a_Size;
	}
	
	

	

}
