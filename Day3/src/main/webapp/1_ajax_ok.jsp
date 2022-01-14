<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // http://localhost:8080/Day3/1_ajax_ok.jsp?userid=apple&userpw=1111
	String userid = request.getParameter("userid"); //apple
	String userpw = request.getParameter("userpw"); //1111
	out.println(userid); // apple
	out.println(userpw); // 1111

%>