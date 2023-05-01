<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOYAMOGA</title>

	<!-- 파비콘 -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    
	<!-- 로그인 메인창 css -->
    <link rel="stylesheet" href="/resources/css/login/Login_Main.css">

</head>

<body>

	<!-- header -->
	<%@include file= "../common/header.jsp" %>

    <main>

        <div class="login_wrapper">

            <div class="login_container">
			
                <form id="login_form" action="/login" method="post">
                    <div class="login_title">로그인</div>

                    <!-- 아이디 입력창 -->
                    <div class="id_class">
                        <label for="userId"></label>
                        <input id="userId" type="text" name="id" placeholder="아이디" required>
                    </div>

                    <!-- 비밀번호 입력창 -->
                    <div class="password_class">
                        <label for="password"></label>
                        <input id="password" type="password" name="password" placeholder="비밀번호" required>
                    </div>
                    
                    <!-- 로그인 실패 시 띄우는 알림 문구 -->
                    <c:if test = "${result == 0}">
                        <div class = "login_fail">
                            ID 또는 비밀번호를 잘못 입력하셨습니다.
                        </div>
                    </c:if>

                    <!-- 아이디 저장, 자동 로그인, 아이디 찾기, 비밀번호 찾기 -->
                    <div class="login_box">

                        <!-- 아이디 저장 체크박스 -->
                        <div class="rememberId">
                            <input type="checkbox" id="rememberId" name="rememberId" value="off">
                            <label for="rememberId2">아이디 저장</label>
                        </div>

                        <!-- 자동 로그인 체크박스 -->
                        <div class="autoLogin">
                            <input type="checkbox" id="rememberMe" name="remember-me" value="true">
                            <label for="autoLogin">자동 로그인</label>
                        </div>
                        
                        <!-- 아이디 비밀번호 찾기 -->
                        <span class="finding">
                            <li>
                                <a href="/login/findid" class="find_id">아이디 찾기</a><span>|</span> <a href="/login/changepw" class="change_pw">비밀번호 변경</a>
                            </li>
                        </span>

                    </div>

                    <!-- 로그인 버튼들 -->
                    <!-- 로그인 버튼 -->
                    <div class="signIn">
                        <button type="button" id="signInButton">로그인</button>
                    </div>
            
                    <!-- 네이버로 로그인 -->
                    <div class="naverLogin">
                        <button type="button" id="naverLoginButton">
                            <img src="/resources//imgs/btnG_완성형.png" class="nimg"></button>
                    </div>

                    <!-- 카카오로 로그인 -->
                    <div class="kakaoLogin">
                        <button type="button" id="kakaoLoginButton">
                            <img src="/resources//imgs/kakao_login_large_narrow.png" class="kimg"></button>
                    </div>
            
                </form>
            </div>
        </div>

    </main>
    
    
    <%
    String clientId = "0uv9EITi7mWXq43C1IuC";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/main", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 	%>
  	<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
    
    <!-- footer -->
    <%@include file= "../common/footer.jsp" %>
    
</body>

	<!-- 이거 헤드에다가 넣으면 작동 XX 왜인지는 모르겠음 ㅠㅠ -->
	<!-- 로그인 메인창 js -->
	<script src="/resources/js/login/Login_Main.js"></script>

</html>