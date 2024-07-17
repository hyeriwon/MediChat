<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
	<form:form action="login" id="member_login" modelAttribute="memberVO">
		<div class="loginLogo">
			<img src="/images/loginLogo.png" width="100" height="100" style="margin-top:50px;">
		</div>
		<ul>
			<li>
				<form:input path="mem_id" placeholder="아이디" autocomplete="off" style="margin-top:50px;"/>
				<form:errors path="mem_id" cssClass="error-color"/>
			</li>
			<li>
				<form:password path="mem_passwd" placeholder="비밀번호" style="margin-top:15px;"/>
				<form:errors path="mem_passwd" cssClass="error-color"/>
			</li>
		</ul>
		<div>
			<form:errors element="div" cssClass="error-color"/>
			<form:button class="login_btn">로그인</form:button>
		</div>
		<div class="button-container">
			<label for="auto">
			<input type="checkbox" name="auto" id="auto">자동로그인</label>
			<input type="button" value="아이디 찾기" style="margin-right:10px;">
			<input type="button" value="비밀번호 찾기">
		</div>
	</form:form>
	<hr size="1" width="50%" noshade="noshade" class="centered-hr">
	<div class="social">
		<!--  카카오 로그인시작 -->
		<img src="${pageContext.request.contextPath}/images/kakao_login_medium_narrow.png" width="200">
		<!--  카카오 로그인 끝 -->
		<!--  네이버 로그인 시작 -->
		<img src="${pageContext.request.contextPath}/images/naver_login.png" width="200">
		<!--  네이버 로그인 끝 -->
	</div>
</div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
	<form:form action="login" id="member_login" modelAttribute="memberVO">
		<ul>
			<li>
				<form:input path="mem_id" placeholder="아이디" autocomplete="off" style="margin-top:130px;"/>
				<form:errors path="mem_id" cssClass="error-color"/>
			</li>
			<li>
				<form:password path="mem_passwd" placeholder="비밀번호" style="margin-top:15px;"/>
				<form:errors path="mem_passwd" cssClass="error-color"/>
			</li>
		</ul>
		<div>
			<form:errors element="div" cssClass="error-color"/>
			<form:button class="login_btn">로그인</form:button>
		</div>
		<div class="button-container">
			<label for="auto">
			<input type="checkbox" name="auto" id="auto">자동로그인</label>
			<input type="button" value="아이디 찾기" style="margin-right:10px;">
			<input type="button" value="비밀번호 찾기">
		</div>
	</form:form>
	<hr size="1" width="50%" noshade="noshade" class="centered-hr">
	<div class="social">
		<!--  카카오 로그인시작 -->
		<img src="${pageContext.request.contextPath}/images/kakao_login_medium_narrow.png" width="200">
		<!--  카카오 로그인 끝 -->
		<!--  네이버 로그인 시작 -->
		<img src="${pageContext.request.contextPath}/images/naver_login.png" width="200">
		<!--  네이버 로그인 끝 -->
	</div>
</div>
>>>>>>> refs/remotes/origin/kcy-feature
