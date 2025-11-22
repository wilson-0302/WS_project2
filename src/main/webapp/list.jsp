<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="com.exmaple.dao.BoardDAO, com.exmaple.bean.BoardVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
  BoardDAO dao = new BoardDAO();
  List<BoardVO> list = dao.getBoardList();
  request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Board List</title>
</head>
<body>

<h2>게시글 목록</h2>

<c:forEach var="u" items="${list}">
  ${u.id} / ${u.title} / ${u.writer} / ${u.regdate}<br>
</c:forEach>

</body>
</html>
