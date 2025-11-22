<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Administrator--%>
<%--  Date: 25. 11. 22.--%>
<%--  Time: 오후 4:11--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--</body>--%>
<%--</html>--%>
<%@page import="com.exmaple.dao.BoardDAO"%>

<jsp:useBean id="u" class="com.exmaple.bean.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
    BoardDAO dao = new BoardDAO();
    int result = dao.insertBoard(u);
    String msg = (result == 1 ? "데이터 추가 성공" : "[에러] 데이터 추가 실패");
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';
</script>