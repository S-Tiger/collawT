package project.jeongha.vote.vo;


public class VoteVO {

	//투표 번호
	private String v_Num;
	//투표 제목
	private String v_Content;
	//시작일
	private String v_Start;
	//마감일
	private String v_End;
	//보기번호
	private String vd_Num;
	//보기내용
	private String vd_Content;
	
	
	public String getVd_Num() {
		return vd_Num;
	}
	public void setVd_Num(String vd_Num) {
		this.vd_Num = vd_Num;
	}
	public String getVd_Content() {
		return vd_Content;
	}
	public void setVd_Content(String vd_Content) {
		this.vd_Content = vd_Content;
	}
	
	public String getV_Num() {
		return v_Num;
	}
	public void setV_Num(String v_Num) {
		this.v_Num = v_Num;
	}
	public String getV_Content() {
		return v_Content;
	}
	public void setV_Content(String v_Content) {
		this.v_Content = v_Content;
	}
	public String getV_Start() {
		return v_Start;
	}
	public void setV_Start(String v_Start) {
		this.v_Start = v_Start;
	}
	public String getV_End() {
		return v_End;
	}
	public void setV_End(String v_End) {
		this.v_End = v_End;
	}
	
	
	
}
