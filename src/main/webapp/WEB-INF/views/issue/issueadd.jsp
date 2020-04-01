<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div>
<form action="/issue/insert" method="post">
	협업공간ID<input name="c_Id" type="text">
	<br>
	
	이슈명<input name="i_Name" type="text"><br>
	
	이슈내용<input name="i_Content" type="text"><br>
	
	이슈그룹<input name="i_Groupnum" type="text"><br>
	데이트<input name="i_Date" type="text"><br>
	회원아이디<input name="mem_Id" type="text"><br>
	
	<input type="submit" value="작성완료"><br>
	
</form>
</div>
