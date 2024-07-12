<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<!-- 비대면진료 채팅창 시작 -->
<div class="display">
	<%@ include file="/WEB-INF/views/chat/chatNav.jsp" %>
	<div class="chat-main">
		<div class="chat-header bg-green-7">
			<!-- 예약내역을 클릭한 경우에만 예약번호와 진료일시, 의사 표시 -->
			<div class="chat-title fs-25">
				예약번호: ${chat.res_num}
			</div>
			<div class="chat-date fs-20">
				${chat.res_date} ${chat.res_time}
			</div>
		</div>
		<!-- 채팅방 표시 시작 -->
		<div class="chat-body">
		</div>
		<!-- 입력창 표시 -->
		<div>
			<form action="messageInput" method="post" class="chat-input">
				<input type="button" class="bg-green-7">
				<input type="text" id="message_text">
				<input type="submit" value="전송" id="message_btn" class="btn-green">
			</form>
		</div>
</div>
</div>