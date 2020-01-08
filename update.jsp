<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="studentUpdateBean.*" %>

<jsp:useBean id="studentMgr" class="studentUpdateBean.StudentMgr" scope="page"></jsp:useBean>
<html>
<head><title>수강신청 사용자 정보 수정</title></head>
<body>
<%@ include file="top.jsp" %>
<%
	if (session_id==null) response.sendRedirect("login.jsp");

	Student student = studentMgr.getStudent(session_id);
%>

<form method="post" action="update_verify.jsp">
  <input type="hidden" name="s_id" size="30" value="<%= session_id %>">
  <table width="75%" align="center" border>
     <tr><th>이름</th>
         <td><input type="text" name="s_name" size="50" value="<%= student.getS_name() %>"> </td>
     </tr>

     <tr><th>주소</th>
         <td><input type="text" name="s_addr" size="50" value="<%= student.getS_addr() %>"> </td>
     </tr>

     <tr><th>패스워드</th>
         <td><input type="password" name="s_pwd" size="20"  value="<%= student.getS_pwd() %>"></td>
     </tr>

     <tr><th>학부</th>
         <td><input type="text" name="s_college" size="50"  value="<%= student.getS_college() %>"></td>
     </tr>

     <tr><th>전공</th>
         <td><input type="text" name="s_major" size="50"  value="<%= student.getS_major() %>"></td>
     </tr>

     <tr><th>연락처</th>
        <td><input type="text" name="s_phonenumber" size="50"  value="<%= student.getS_phonenumber() %>"></td>
    </tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="수정">
	</td> 
</tr>
</table></form></body></html>
