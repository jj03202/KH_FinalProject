<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 전체 목록</title>
    <!-- <link href="/admin_page/css/member/member_list.css" type="text/css" rel="stylesheet" /> -->
    <link rel="stylesheet" href="/resources/css/admin/common.css">
	<link rel="stylesheet" href="/resources/css/admin/list.css">
</head>

<body>

<!-- 헤더 - 로그인/로그아웃 로고, 관리자페이지 메인글씨 -->
<%@include file= "/WEB-INF/views/admin/common/header.jsp" %> 

<!-- 메인 - 보라색 가로줄(메인페이지글자), 왼쪽 메뉴 -->
<main>
    <div class="sub_content">
<!-- 메인 - 공지사항 글 목록 테이블, 이동페이지, 수정, 삭제 -->            
                
        <div class="content">
            <table>
                <h2>회원관리 <span class="test">테스트</span></h2>
                <thead>
	                <tr>
	                    <th>회원번호</th>
	                    <th>아이디</th>
	                    <th>이름</th>
	                    <th>성별</th>
	                    <th>이메일</th>
	                    <th>전화번호</th>
	                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="MemberDTO">
                         <tr>
                            <td><a href="/admin/member/get?id=${MemberDTO.id}">${MemberDTO.no}</a></td>
                            <td><a href="/admin/member/get?id=${MemberDTO.id}">${MemberDTO.id}</a></td>
                            <td><a href="/admin/member/get?id=${MemberDTO.id}">${MemberDTO.name}</a></td>
                            <td><a href="/admin/member/get?id=${MemberDTO.id}">${MemberDTO.gender}</a></td>
                            <td><a href="/admin/member/get?id=${MemberDTO.id}">${MemberDTO.email}</a></td>
                            <td><a href="/admin/member/get?id=${MemberDTO.id}">${MemberDTO.tel}</a></td>
                        </tr>        
                    </c:forEach>    
                </tbody>
            </table>
            
            
	 		<div class="pageInfo_wrap" >
			  <form id=moveForm method="get">
			    <div class="pageInfo_area">
			    	<ul id="pageInfo" class="pageInfo">
			    	
			    		<!-- 이전페이지 버튼 -->
			            <c:if test="${pageMaker.prev}">
			                <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
			            </c:if>
			            
		            	<!-- 각 번호 페이지 버튼 -->
		                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                    <li class="pageInfo_btn "><a href="/admin/member/list?currPage=${num}&amount=${pageMaker.cri.amount}">${num}</a></li>
		                </c:forEach>
		             
			            <!-- 다음페이지 버튼 -->
			            <c:if test="${pageMaker.next}">
			                <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
			            </c:if>  
		             </ul>
		            
            	</div>

			        <input type="hidden" name="currPage" value="${pageMaker.cri.currPage }">
			        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		        
            </form>
           </div>
        </div>
        

    </div>
</main>

    
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>

</html>