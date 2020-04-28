package project.sungho.chat.VO;

import com.google.gson.Gson;

public class MessageVO {

	private String chat_Id;
	private String mem_Id;
	private String ch_Num;
	private String ch_Content;
	private String ch_Date;
	
	
	
	public String getChat_Id() {
		return chat_Id;
	}
	public void setChat_Id(String chat_Id) {
		this.chat_Id = chat_Id;
	}
	public String getMem_Id() {
		return mem_Id;
	}
	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}
	public String getCh_Num() {
		return ch_Num;
	}
	public void setCh_Num(String ch_Num) {
		this.ch_Num = ch_Num;
	}
	public String getCh_Content() {
		return ch_Content;
	}
	public void setCh_Content(String ch_Content) {
		this.ch_Content = ch_Content;
	}
	public String getCh_Date() {
		return ch_Date;
	}
	public void setCh_Date(String ch_Date) {
		this.ch_Date = ch_Date;
	}
	
	
	public static MessageVO convertMessage(String source) {
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  MessageVO.class);
		return message;
	}
	
	
}
