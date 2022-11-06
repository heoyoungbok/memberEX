<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-11-06
  Time: 오전 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave.jsp</title>
  <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container" id="save-form">
  <form action="/save" method="post" name="saveForm">

    <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일" onblur="emailDuplicateCheck()" ><br>
    <span id="email-input"></span>

    <span id="emailCK"></span>

    <input type="text" name="memberPassword" id="memberPassword" placeholder="비밀번호"><br>
    <span id="inputPass"></span>
    <input type="text" name="memberName" id="memberName" placeholder="이름"><br>
    <input type="text" name="memberPhone" id="memberPhone" placeholder="전화번호"><br>
    <input type="text" name="memberAge" id="memberAge" placeholder="나이"><br>
    <input type="button" onclick="memberSave()" value="회원가입">
  </form>
</div>
</body>
<script>
  const memberSave = () => {
   if (document.saveForm.memberEmail.value == ""){
     const emailCheck = document.getElementById("email-input")
     emailCheck.innerHTML="이메일을 입력해주세요";
     emailCheck.style.color="red";
     return false;
   }else if(document.saveForm.memberPassword.value == ""){
     const passCheck = document.getElementById("inputPass")
     passCheck.innerHTML="비밀번호를 입력해주세요";
     passCheck.style.color="red";
     return false;
   }else if(document.saveForm.memberName.value == ""){
      alert("이름을 입력해주세요");
   }else if(document.saveForm.memberPhone.value == ""){
     alert("전화번호를 입력해주세요");
   }else if(document.saveForm.memberAge.value == ""){
     alert("나이를 입력해주세요");
   }
   document.saveForm.submit();
  }
  const emailDuplicateCheck = () => {
    const email = document.getElementById("memberEmail").value;
    const checkResult = document.getElementById("emailCK");
    $.ajax({
      type:"post",
      url:"/duplicate-Check",
      data:{inputEmail: email},
      dataType:"text",
      success: function (result) {
      if (result == "ok"){
        checkResult.innerHTML="사용할 수 있는 이메일입니다.";
        checkResult.style.color="green";
      }else {
        checkResult.innerHTML="사용중인 이메일입니다";
        checkResult.style.color="red";
      }
      },
      error: function (){
        console.log("실패");
      }
    });
  }

</script>
</html>
