<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();

	String user_id = Util.getParamNN(request.getParameter("user_id"));
	String user_pw = Util.getParamNN(request.getParameter("user_pw"));
	
	String sql = "SELECT user_id, user_pw FROM user_info WHERE user_id = '" + user_id + "'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
		
	String db_user_id = rs.getString("user_id");
	String db_user_pw = rs.getString("user_pw");
		
	if(db_user_id.equals(user_id)) {
		if(db_user_pw.equals(user_pw)) {
			// 쿠키 지정 name, value
			Cookie cookie = new Cookie("user_id", "kmbm0916");
			// 쿠키의 유효시간 설정
			cookie.setMaxAge(60*60);
			// 쿠키 추가
			response.addCookie(cookie);
				
			out.print("로그인 성공");
			response.sendRedirect("../mypage.jsp");
		}
		else {
			out.print("비밀번호 불일치");
		}
	}
	else {
		out.print("아이디 불일치");
	}
%>