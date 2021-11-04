<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 삭제 페이지</h1>
	<%
		request.setCharacterEncoding("utf-8");
	
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.equals("user_id")){
				out.println("cookies[" + i + "] name : " + name);
				out.println("<br/>");
				out.println("cookies[" + i + "] value : " + value);
				// 유효시간을 0초 설정 삭제하는 효과
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				out.println("cookies[" + i + "] name : " + name);
				out.println("<br/>");
				out.println("cookies[" + i + "] value : " + value);
			}
		}
	%>
	<br><br>
	<a href="./Common/header.jsp">쿠키값 확인창으로 이동</a>
</body>
</html>