<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>APSI-Diary</title>
	<link rel="stylesheet" href="./StyleSheet/login.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Zen+Kurenaido&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script>
		function check() {
			if(document.getElementById("user_id").value == "") {
				alert("ID를 입력하십시오.");
				document.getElementById("user_id").focus();
				return false;
			}
			else if(document.getElementById("user_pw").value == "") {
				alert("비밀번호를 입력하십시오.");
				document.getElementById("user_pw").focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<header>
		<a href="./index.jsp">
			<h2>
				<%
					if(request.getRequestURL().toString().equals("http://localhost:8090/APSI-Diary/index.jsp")) {
						out.print("DIARY");
					}
					else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI-Diary/login.jsp")) {
						out.print("LOGIN");
					}
					else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI-Diary/register.jsp")) {
						out.print("REGISTER");
					}
					else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI-Diary/query.jsp")) {
						out.print("QUERY");
					}
					else if(request.getRequestURL().toString().equals("http://localhost:8090/APSI-Diary/mypage.jsp")) {
						out.print("MYPAGE");
					}
					else {
						out.print("UNDEFINDED PAGE");
					}
				%>
			</h2>
		</a>
		<a class="account" href="./mypage.jsp">
			<%
				request.setCharacterEncoding("utf-8");
				
				Cookie cookie = null;
   				Cookie[] cookies = null;
   				
   				String account_user_id = null;
   				
   				// 배열인 쿠키의 데이터를 가져옵니다.
   				cookies = request.getCookies();
   				if( cookies != null){
      				for(int i = 0; i < cookies.length; i++){
         				cookie = cookies[i];
        				
         				if(cookie.getName().equals("user_id")) {
         					account_user_id = cookie.getValue();
         				}
         				
         				/* out.print("매개변수 이름 : " + cookie.getName());
         				out.print("<br>");
         				out.print("매개변수 값 : " + URLDecoder.decode(cookie.getValue(), "utf-8") +" <br>");
         				out.print("------------------------------------<br>"); */
     				}
      				if(account_user_id == null){
      					out.print("Login");
      				}
      				else {
      					out.print(account_user_id);
      				}
  				} 
%>
		</a>
	</header>
	<section>
		<form action="./Actions/action1.jsp" onsubmit="return check()" method="get">
			<table>
				<tr>
					<td class="login_label"><p>ID</p></td>
					<td><input type="text" name="user_id" class="login_input" id="user_id"></td>
				</tr>
				<tr>
					<td class="login_label"><p>PW </p></td>
					<td><input type="password" name="user_pw" class="login_input" id="user_pw"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-outline-primary login_submit">로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<div class="footer-left">
			<a href="https://www.instagram.com/rkdals916/" target="_blank">
				<img src="./Image/icon_instagram.png" alt="instagram" width="40px" height="40px">
			</a>
			<a href="https://github.com/kmbm0916-biz" target="_blank">
				<img src="./Image/icon_github.png" alt="github" width="40px" height="40px">
			</a>
		</div>
		<div class="footer-right">
			
			<p>Copyright &copy; Kangmin Kim All rights reserved.</p>
		</div>
	</footer>
</body>
</html>