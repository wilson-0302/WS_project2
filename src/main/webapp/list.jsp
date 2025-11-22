<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.exmaple.dao.BoardDAO, com.exmaple.bean.BoardVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
  request.setCharacterEncoding("utf-8");

  String keyword = request.getParameter("keyword");
  BoardDAO dao = new BoardDAO();
  List<BoardVO> list = null;

  if(keyword != null && !keyword.trim().equals("")) {
    list = dao.searchByTitle(keyword);
  } else {
    list = dao.getBoardList();
  }

  request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Board List</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- FontAwesome -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
    @font-face {
      font-family: 'Hitech';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310-1@1.1/Hitech.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
    }

    body {
      font-family: 'Hitech', sans-serif !important;
      padding: 40px;
    }
    .btn-custom {
      border: 1px solid #8ad7dd;
      color: #28a7af;
    }
    .btn-custom:hover {
      background: #28a7af;
      color: white;
    }
    .table thead th {
      background: #ffffff;
      font-weight: 600;
    }
    .card {
      border-radius: 16px;
    }
    .icon-btn {
      font-size: 18px;
      margin-left: 10px;
    }
    .icon-btn:hover {
      opacity: 0.7;
    }
    a {
      text-decoration: none;
    }
  </style>
</head>
<body>
<jsp:include page="top.jsp" />
<div class="container">
  <!-- 검색 -->
  <form method="get" action="list.jsp" class="mb-4">
    <div class="input-group">
      <input type="text" class="form-control" name="keyword" placeholder="제목 검색"
             value="<%= (keyword != null ? keyword : "") %>">
      <button class="btn btn-custom" type="submit">검색</button>
    </div>
  </form>

  <!-- 추가 버튼 -->
  <div class="d-flex justify-content-end mb-4">
    <a href="write.jsp" class="btn btn-custom">게시글 추가</a>
  </div>

  <div class="card p-4 shadow-sm">
    <table class="table align-middle">
      <thead>
      <tr>
        <th>ID</th>
        <th>제목</th>
        <th>작성자</th>
        <th>좋아요</th>
        <th>작성일</th>
        <th>조회수</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
      </thead>

      <tbody>

      <c:forEach var="u" items="${list}">
        <tr onclick="location.href='view.jsp?id=${u.id}'" style="cursor:pointer;">
          <td>${u.id}</td>

          <td>
            <strong>${u.title}</strong>
          </td>

          <td>
            <c:choose>
              <c:when test="${u.anonymous}">
                익명
              </c:when>
              <c:otherwise>
                ${u.writer}
              </c:otherwise>
            </c:choose>
          </td>

          <td>${u.like}</td>

          <td>${fn:substring(u.regdate, 0, 10)}</td>

          <td>${u.cnt}</td>

          <td>
            <a href="edit.jsp?id=${u.id}" class="text-primary icon-btn">
              <i class="fa-solid fa-pen"></i>
            </a>
          </td>

          <td>
            <a href="delete_ok.jsp?id=${u.id}" class="text-danger icon-btn">
              <i class="fa-solid fa-trash"></i>
            </a>
          </td>
        </tr>
      </c:forEach>

      </tbody>
    </table>
  </div>

</div>

<jsp:include page="bottom.jsp" />
</body>
</html>
