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