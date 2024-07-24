<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
<style>
/* @import url('https://fonts.googleapis.com/icon?family=Material+Icons'); */
.memberInfo {
    display:flex;
    margin-top:80px;
}

.leftInfo, .rightInfo {
    flex:1;
    padding:0 10px;
}

.leftInfo li, .rightInfo li {
    list-style-type:none;
    margin-bottom:10px;
}

.leftInfo li:first-child, .rightInfo li:first-child {
    font-size:25px;
    font-weight:bold;
}

.leftInfo li:not(:first-child), .rightInfo li:not(:first-child) {
    font-size:15px;
}

.collapsible {
    cursor:pointer;
    user-select:none;
    background-color:#f0f0f0;
    padding:10px;
    border:none;
    text-align:left;
    outline:none;
    width:100%;
}

.collapsible:hover {
    background-color:#ccc;
}

.content {
    display:none;
    padding:0 18px;
    overflow:hidden;
    background-color:#f9f9f9;
}

@media (max-width: 768px) {
    .memberInfo {
        flex-direction:column;
    }
}

.dropdown{
  position :relative;
  display :inline-block;
  float:right;
}

/* .dropbtn_icon{
  font-family : 'Material Icons';
} */
.dropbtn{
  border:none;
  border-radius:4px;
  background-color:#fff;
  font-weight:400;
  color:rgb(37, 37, 37);
  width:100px;
  text-align:left;
  cursor:pointer;
  font-size:15px;
}
.dropdown-content{
  display:none;
  position:absolute;
  z-index:1; /*다른 요소들보다 앞에 배치*/
  font-weight:400;
  background-color:#fff;
  min-width:100px;
}

.dropdown-content a{
  display:block;
  text-decoration:none;
  color:rgb(37, 37, 37);
  font-size:12px;
  padding:12px
}

.dropdown-content a:hover{
  background-color:#ececec
}

.dropdown:hover .dropdown-content {
  display:block;
}

</style>
</head>
<body>
<div class="dropdown">
  <button class="dropbtn"> 
    <span class="dropbtn_icon"></span>
      나의 활동
  </button>
    <div class="dropdown-content">
      <a class="dropdown-item" href="#">좋아요</a>
      <a class="dropdown-item" href="#">댓글</a>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn"> 
      <span class="dropbtn_icon"></span>
      이용내역
    </button>
    <div class="dropdown-content">
      <a class="dropdown-item" href="#">진료기록</a>
      <a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/myResList">예약내역</a>
      <a class="dropdown-item" href="#">문의내역</a>
    </div>
</div>
    <div class="memberInfo">
        <div class="leftInfo">
            <ul>
                <li style="font-size:25px; font-weight:bold;">이름</li>
                <li style="font-size:15px;">${member.mem_name}</li>
                <li style="font-size:25px; font-weight:bold;">전화번호</li>
                <li style="font-size:15px;">${member.mem_phone}</li>
                <li style="font-size:25px; font-weight:bold;">생년월일</li>
                <li style="font-size:15px;">${member.mem_birth}</li>
                <li style="font-size:25px; font-weight:bold;">이메일</li>
                <li style="font-size:15px;">${member.mem_email}</li>
            </ul>
        </div>
        <div class="rightInfo">
            <ul>
                <li style="font-size:25px; font-weight:bold;">우편번호</li>
                <li style="font-size:15px;">${member.mem_zipcode}</li>
                <li style="font-size:25px; font-weight:bold;">주소</li>
                <li style="font-size:15px;">${member.mem_address1} ${member.mem_address2}</li>
                <li style="font-size:25px; font-weight:bold;">가입일</li>
                <li style="font-size:15px;">${member.mem_reg}</li>
                <c:if test="${!empty member.mem_modify}">
                    <li style="font-size:25px; font-weight:bold;">정보 수정일</li>
                    <li style="font-size:15px;">${member.mem_modify}</li>
                </c:if>
            </ul>
        </div>
    </div>
</body>
</html>
