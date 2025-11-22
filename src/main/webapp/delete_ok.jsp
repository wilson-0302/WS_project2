<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.exmaple.dao.BoardDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    BoardDAO dao = new BoardDAO();
    int result = dao.deleteBoard(id);
    String msg = (result == 1 ? "데이터 삭제 성공" : "[에러] 데이터 삭제 실패");
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';
</script>