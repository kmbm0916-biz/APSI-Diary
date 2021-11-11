<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h1>쿠키 설정 페이지</h1>
	<%
		request.setCharacterEncoding("utf-8");
		// 쿠키 지정 name, value
		Cookie cookie = new Cookie("user_id", "kmbm0916");
		// 쿠키의 유효시간 설정
		cookie.setMaxAge(60*60);
		// 쿠키 추가
		response.addCookie(cookie);
	%>
	<br><br>
	<a href="./index.jsp">쿠키값 확인창으로 이동</a>
</body>
</html>