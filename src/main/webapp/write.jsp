<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<% request.setCharacterEncoding("utf-8"); %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>게시글 추가</h1>--%>
<%--<form action="write_ok.jsp" method="post">--%>
<%--  <table>--%>
<%--    <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>--%>
<%--    <tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>--%>
<%--    <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>--%>
<%--    <tr>--%>
<%--      <td><a href="list.jsp">목록 보기</a></td>--%>
<%--      <td><input type="submit" value="Add Post"/></td>--%>
<%--    </tr>--%>
<%--  </table>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 추가</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

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
    .card {
      border-radius: 16px;
    }
    .btn-custom {
      border: 1px solid #8ad7dd;
      color: #28a7af;
    }
    .btn-custom:hover {
      background: #28a7af;
      color: white;
    }
    a {
      text-decoration: none;
    }
  </style>
</head>

<body>

<div class="container">

  <h2 class="mb-4">게시글 추가</h2>

  <div class="card p-4 shadow-sm">

    <form action="write_ok.jsp" method="post">

      <div class="mb-3">
        <label class="form-label">제목</label>
        <input type="text" name="title" class="form-control" required />
      </div>

      <div class="mb-3">
        <label class="form-label">작성자</label>
        <input type="text" name="writer" class="form-control" required />
      </div>

      <div class="form-check mb-3">
        <input class="form-check-input" type="checkbox" name="anonymous" value="true" id="anonCheck">
        <label class="form-check-label" for="anonCheck">
          익명
        </label>
      </div>

      <div class="mb-3">
        <label class="form-label">내용</label>
        <textarea class="form-control" name="content" rows="5" required></textarea>
      </div>

      <div class="d-flex justify-content-between">
        <a href="list.jsp" class="btn btn-secondary">목록 보기</a>
        <button type="submit" class="btn btn-custom">게시글 추가</button>
      </div>

    </form>

  </div>

</div>

</body>
</html>
