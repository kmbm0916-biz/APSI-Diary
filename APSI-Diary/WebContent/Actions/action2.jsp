<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	
	String sql_check = "SELECT idx FROM board WHERE ROWNUM = 1 ORDER BY idx DESC";
	ResultSet rs1 = stmt.executeQuery(sql_check);
	rs1.next();
	
	int idx = rs1.getInt(1);
	++idx;
	
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
			}
		}
	
	String title = Util.getParamNN(request.getParameter("title"));
	String description = Util.getParamNN(request.getParameter("description"));
	
	String sql = "INSERT INTO board VALUES(" + idx + ", '" + title + "', '" + description + "', '" + account_user_id + "', sysdate)";
	stmt2.executeQuery(sql);
	
	response.sendRedirect("../index.jsp");
%>