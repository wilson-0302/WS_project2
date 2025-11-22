<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>게시글 추가</h1>
<form action="write_ok.jsp" method="post">
  <table>
    <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
    <tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>
    <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
    <tr>
      <td><a href="list.jsp">목록 보기</a></td>
      <td><input type="submit" value="Add Post"/></td>
    </tr>
  </table>
</form>
</body>
</html>
