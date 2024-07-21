<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .form-container {
       
        padding: 20px;
        border-radius: 10px;
       
    }
    .inputtext {
        height: 50px;
        font-size: 20px;
        width: 300px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    .inputtext-small {
        width: 50px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    .inputtext-medium {
        width: 100px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    select {
        height: 28px;
        font-size: 15px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    .label-text {
        color: #555555;
        font-weight: bold;
    }
    .radio-container {
        display: flex;
        justify-content: space-between;
        width: 300px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
    }
    td {
        padding: 5px 15px;
    }
    td:first-child {
        padding-right: 30px;
    }
    .submit-btn {
        width: calc(400px + 15px * 2); 
        background-color: #a781ee;
        color: white;
        border: none;
        height: 50px;
        font-size: 16px;
        font-weight: bolder;
        cursor: pointer;
        border-radius: 5px;
    }
</style>
<body>

<br>
<div class="form-container">
    <form name="joinForm">
        <table>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <h1>SUR</h1>
                </td>
            </tr>
           
            <tr style="height: 30px;"></tr>
            <tr>
                <td>
                    <input type="text" placeholder="아이디" class="inputtext" name="memberId">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td>
                    <input type="text" placeholder="비밀번호" class="inputtext" name="memberPasswd">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" class="submit-btn" onClick="login();">로그인</button>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    function login() {
    	if(confirm('로그인 하시겠습니까?')){
    		//document.DirForm.enctype = "multiplart/form-data";
    		document.joinForm.action = "${path}/member/loginProc";
    		document.joinForm.method = "post"
    		document.joinForm.submit();
    	}
    }
</script>
</body>
</html>

</body>
</html>