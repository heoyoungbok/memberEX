<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-11-06
  Time: 오후 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberList.jsp</title>
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
<tr>
    <th>번호</th>
    <th>이메일</th>
    <th>비밀번호</th>
    <th>이름</th>
    <th>나이</th>
    <th>전화번호</th>
    <th>조회</th>
</tr>
<c:forEach items="${memberList}" var="member">
    <tr>
        <td>${member.id}</td>
        <td>${member.memberEmail}</td>
        <td>${member.memberPassword}</td>
        <td>${member.memberName}</td>
        <td>${member.memberAge}</td>
        <td>${member.memberPhone}</td>
    </tr>
</c:forEach>
</div>
</body>
</html>
