<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "";
    String url = "jdbc:mysql://localhost:3306/aiclass";
    String uid = "root";
    String upw = "1234";
    ResultSet rs = null;
    
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection(url, uid, upw);
    	if(conn != null){
			sql = "select * from tb_member where mem_userid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(userpw.equals(rs.getString("mem_userpw"))){
					session.setAttribute("userid",userid);
				
%>
		<script>
			alert('로그인 되었습니다');
			location.href="2_login.jsp";
		</script>
<% 					
				
			}
		
			
    	}else{
    		
%>
    		<script>
    			alert('아이디 또는 비밀번호를 확인하세요');
    			history.back();
    		</script>
<%		
    	}
	}
	}catch(Exception e){
			e.printStackTrace();
		}
	
%>



