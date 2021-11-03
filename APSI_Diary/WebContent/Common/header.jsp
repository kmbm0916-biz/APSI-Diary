<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<header>
		<h2>
		<%
			if(request.getRequestURL().toString().equals("http://localhost:8090/APSI_Diary/index.jsp")) {
				out.print("DIARY");
			}
			else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI_Diary/login.jsp")) {
				out.print("LOGIN");
			}
			else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI_Diary/register.jsp")) {
				out.print("REGISTER");
			}
			else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI_Diary/query.jsp")) {
				out.print("QUERY");
			}
			else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI_Diary/mypage.jsp")) {
				out.print("MYPAGE");
			}
			else {
				out.print("UNDEFINDED PAGE");
			}
		%>
		</h2>
		<a class="account">
			<%
				request.setCharacterEncoding("utf-8");
				
				Cookie cookie = null;
   				Cookie[] cookies = null;
   				
   				String account_user_id;
   				
   				// 배열인 쿠키의 데이터를 가져옵니다.
   				cookies = request.getCookies();
   				if( cookies != null){
      				for(int i = 0; i < cookies.length; i++){
         				cookie = cookies[i];
        				
         				/* if(cookie.getName().equals("user_id")) {
         					account_user_id = cookie.getValue();
         				} */
         				
         				out.print("매개변수 이름 : " + cookie.getName());
         				out.print("<br>");
         				out.print("매개변수 값 : " + URLDecoder.decode(cookie.getValue(), "utf-8") +" <br>");
         				out.print("------------------------------------<br>");
     				 }
  				} 
   				else {
     				 out.println("<h2>쿠키를 찾을 수 없습니다.</h2>");
 				}
%>
		</a>
	</header>
</body>
</html>