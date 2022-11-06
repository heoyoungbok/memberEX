<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-11-06
  Time: 오전 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
</head>
<body>
  <button onclick="saveFn()">회원가입</button>
  <button onclick="login()">로그인</button>
  <button onclick="listFn()">목록</button>


</body>
<script>
    const saveFn = () => {
      location.href="/save";
    }
    const login = () => {
      location.href="/login";
    }
    const listFn = () => {
      location.href="listFn";
    }
</script>
</html>
