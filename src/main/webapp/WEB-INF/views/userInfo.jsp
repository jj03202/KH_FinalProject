<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOYAMOGA</title>
    
    <!-- include favicon -->
    <%@include file="/WEB-INF/views/common/favicon.jsp" %>

    <link rel="stylesheet" href="/resources/css/userInfo.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/1fe7ba446e.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

	<!-- 카카오 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="/resources/js/userInfo.js"></script>
</head>
<body>
    <body>
     <div class="topBanner">
        <div class="topbox">
            <div class="topcontent">
                    모두의 야채, 모두의 과일<br>
                    싱싱한 농산물을 합리적인 가격에 제공하는 직거래 유통 마켓
            </div>
            <button type="button" class="topBannerBtn">X</button>
        </div>
    </div>

    <header>    
            <ul class="container2">
            
            	<c:if test = "${member == null}">
                    <li><a href="/login">로그인</a></li>
                    <li><a href="/signup/main">회원가입</a></li>
                    <li><a href="/cart/${member.id}">장바구니</a></li>
                </c:if> 
                
                <!--로그인 O -->
                <c:if test = "${member != null}">

                        <!-- 관리자 계정 -->
                        <c:if test="${member.adminCk == 1}">
                            <li id="main_adminpage"><a href="/admin/main" id="main_adminpage">*관리자 페이지 click!</a></li>
                        </c:if>  
                    <li id="container2_name">${member.name}님 환영합니다 ^o^</li> 
                    <li><a href="/login/logout">로그아웃</a></li>
                    <!-- => 비동기 방식 로그아웃으로 변경 -->
                    <li><a href="/mypage/userInfo/${member.id}">마이페이지</a></li>
                    <li><a href="/cart/${member.id}">장바구니</a></li>
                </c:if>       
            </ul>

            <div class="container3">
                <a href="/main"><img id="logo" src="/resources/imgs/logo.png" alt="로고"></a>
        
                <form class="search1" action="#" method="GET">
                    <input class="search-txt" type="text" placeholder=" 검색어를 입력해주세요!">    
                    <button class="search-btn" type="submit"><img id="btn" src="/resources/imgs/search.png" alt="메인검색버튼"></button>
                </form>   
                 
            </div>
    </header>

    <nav> 
        <div class="menu">
            <ul class="container4">
                <li><a href="#"><i class="fas fa-bars"> 전체 카테고리</i></a>
                    <ul class="menu2">
                        <li><a href="#">농산 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; > </a>
                            <ul class="menu3">
                                <li><a href="#">전체보기</a></li>
                                <li><a href="#">오늘과일채소</a></li>
                                <li><a href="#">국내외과일</a></li>
                                <li><a href="#">친환경유기농채소</a></li>
                                <li><a href="#">우리땅채소</a></li>
                                <li><a href="#">채소/샐러드</a></li>
                                <li><a href="#">주곡/잡곡</a></li>
                                <li><a href="#">오늘의 특가</a></li>
                                <li><a href="#">신상품</a></li>
                            </ul>
                        </li>
                    </ul>
                <li><a href="#">오늘의 특가</a></li>
                <li><a href="#">신상품</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </div>
    </nav>

<!-- --------------위에는 헤더----------- -->

<main>
    <aside class="userinfoAside">
        <ul class="box1">
            <img src="/resources/imgs/profileimg.jpg" alt="프로필 사진">
            <li class="small1">${details.name} 님</li>
            <li class="small1"><a href="/mypage/userInfo/main"><i class="fab fa-whmcs"></i>회원정보관리</a></li>
        </ul>

        <ul class="box2">
            <li class="small2 small3"><a href="/mypage/userInfo/main">정보수정</a></li>
            <li class="small2 small3"><a href="/mypage/?">주문내역</a></li>
            <li class="small2"><a href="/mypage/?">배송현황</a></li>
        </ul>
    </aside>
    
    
    <div class="huiwon">
        <div class="sujeong1">
            <h2 id="sujeong2">회원정보수정</h2>
            <h6 id="sujeong3"><span class="red">*</span>필수 입력</h6>
        </div>
        
        <!-- form 태그 -->
        <form action="/mypage/userInfo/update" method="POST" name="userUpdateForm" id="userUpdateForm">
            <table>
                <tr>
                    <th>&nbsp;아이디</th>
                    <td><input type="text" name="id" value="${details.id}" readonly></td>
                </tr>
                
                <tr>
                    <th>&nbsp;현재 비밀번호</th>
                    <td><input type="password" id="originPw" onchange="checkPw()" ></td>
                    <input type="hidden" name = "password" data-password="${details.password}" id="checkOringinPw" >
                    <td class="sletter">&nbsp;*기존 비밀번호를 입력해 주세요.</td>         
                </tr>
                
                <tr>
                    <th>&nbsp;신규 비밀번호<span class="red">*</span></th>
                    <td><input type="password" id="newPw" onchange="newPwforDetails()"></td>
                    <td class="sletter" colspan="2">&nbsp;*대/소문자 구분, 숫자 8~16자리로 입력해주세요.</td>
                </tr>
                
                <tr>
                    <th>&nbsp;신규 비밀번호 확인<span class="red">*</span></th>
                    <td><input type="password" id="checkNewPw" onchange="confirmNewPw()"></td>
                    <td class="sletter" colspan="2">&nbsp;*비밀번호 확인을 위해 한 번 더 입력해 주세요.</td>
                </tr>
                
                <tr>
                    <th>&nbsp;성명<span class="red">*</span></th>
                    <td><input type="text" name="name" value="${details.name}"></td>
                </tr>
                
                <tr class="specialtr">
                    <th class="th_height" rowspan="2">&nbsp;휴대전화<span class="red">*</span></th>
                    <td><input type="text"></td>
                    <td><input type="button" value="휴대폰 인증" class="btntr">&nbsp;<input type="button" value="재발송" class="btntr"></td>
                </tr>
                
                <tr>
                    <td><input type="text" name="tel" value="${details.tel}"></td>
                    <td><input type="button" value="확인" class="btntr"></td>
                </tr>
                
                <tr class="specialtr">
                    <th class="th_height2" rowspan="3">&nbsp;주소<span class="red">*</span></th>
                    <td><input type="text"  name="address1" value="${details.address1}" class="addrInput1 addrtr" readonly = "readonly" id="sample6_postcode"></td>
                    <td><input type="button" value="우편번호 찾기" class="btntr" onclick="kakaoAdress()"></td>
                </tr>
                
                <tr class="addr_tr">
                    <td colspan="2"><input type="text" name="address2" value="${details.address2}" id="sample6_address" class="addrwidth"></td>
                </tr>
                
                <tr>
                    <td><input type="text" name="address3" value="${details.address3}"class="addrInput2" id="sample6_detailAddress"></td>
                </tr>
                
                <tr>
                    <!-- 이메일 변경 불가능 -->
                    <th>&nbsp;이메일</th>
                    <td><input type="text" name="email" value="${details.email}" readonly></td>
                </tr>
                
                <tr>
                    <!-- 성별 변경 불가능 -->
                    <th>&nbsp;성별</th>
                    <td class="radio">
                        <input type="radio" name="gender" value="남자" ${details.gender eq '남자' ? 'checked' : ''} >남자&nbsp;
                        <input type="radio" name="gender" value="여자" ${details.gender eq '여자' ? 'checked' : ''} >여자&nbsp;
                        <input type="radio" name="gender" value="선택안함" ${details.gender eq '선택안함' ? 'checked' : ''} >선택안함
                    </td>
                </tr>
                <tr>
                    <!-- 생년월일 변경 불가능 -->
                    <th>&nbsp;생년원일</th>
                    <td><input type="text" name="birth_date" value="${details.birth_date}" readonly></td>
                </tr>
            </table>
				
	        <div class="btnset">
	            <button class="userbtn1" type="submit" class="modifyUserDetails" onClick="goform()">정보수정</button>
	            <input class="userbtn2" type="button" value="메인으로" onClick="location.href='/main'">
	            <button class="userbtn2" type="button" onClick="deleteUser('${details.id}')">회원탈퇴</button>
	            <!-- <input class="userbtn2" type="button" value="회원탈퇴" onClick="deleteUser()">  -->
	        </div>     
		</form>               
    </div>    

</main>
    <!-- ---------------footer---------------- -->
   <%@include file= "../views/common/footer.jsp" %>
</body>

<script>
function deleteUser(id){
if(window.confirm("탈퇴하시겠습니다?")){
	location.href = "/mypage/userInfo/"+ id+ "/delete";
}

};
</script>

</html>