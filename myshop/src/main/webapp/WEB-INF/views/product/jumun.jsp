<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    section {
      width:1000px;
      height:600px;
      margin:auto;
   }
   section #a1 {
      text-align:center;
      font-size:20px;
      font-weight:900;
      height:40px;
      padding-top:10px;
   }
   section #a2 {
      font-size:20px;
      color:purple;
      font-weight:900;
      width:990px;
      height:40px;
      padding-top:10px;
      border:1px solid #cccccc;
      padding-left:10px;
   }
   section table {
     margin-top:20px;
   }
   section #a3 {
      font-size:18px;
      text-align:left;
      height:40px;
   }
   section td {
     height:30px;
     font-size:14px;
   }
   
   section #a4 {
     text-align:center;
     margin-top:20px;
   }
   section #a4 span {
  
     display:inline-block;
     width:200px;  
     height:30px;
     border:1px solid #cccccc;
     padding-top:8px;
     cursor:hand;
   }
 </style> 
</head>
<body>
         <c:choose>
             <c:when test="${tmap.get(0).pay==0}">
               <c:set var="pay" value="계좌이체"/>
             </c:when>
             <c:when test="${tmap.get(0).pay==1}">
               <c:set var="pay" value="쿠페이머니"/>
             </c:when>
             <c:when test="${tmap.get(0).pay==2}">
               <c:set var="pay" value="신용/체크카드"/>
             </c:when>
             <c:when test="${tmap.get(0).pay==3}">
               <c:set var="pay" value="법인카드"/>
             </c:when>
             <c:when test="${tmap.get(0).pay==4}">
               <c:set var="pay" value="휴대폰"/>
             </c:when>
             <c:when test="${tmap.get(0).pay==5}">
               <c:set var="pay" value="무통장입금"/>
             </c:when>
           </c:choose>
           
       <c:if test="${tmap.get(0).cla==0}">
           <c:set var="cla" value="문 앞"/>
         </c:if>
         <c:if test="${tmap.get(0).cla==1}">
           <c:set var="cla" value="직접받고 부재시 문 앞"/>
         </c:if>
         <c:if test="${tmap.get(0).cla==2}">
           <c:set var="cla" value="경비실"/>
         </c:if>
         <c:if test="${tmap.get(0).cla==3}">
           <c:set var="cla" value="택배함"/>
         </c:if>
   <section>
      <h2> 주문완료</h2>
      <hr>
      <div id="a1"> 주문이 완료되었습니다 </div>
      <hr>
      <h2> 상품배송 정보</h2>
      <c:forEach items="${tmap}" var="map">
      <c:choose>
       <c:when test="${map.yoil==1}">
               <c:set var="yoil2" value="일요일"/>
             </c:when>
             <c:when test="${map.yoil==2}">
               <c:set var="yoil2" value="월요일"/>
             </c:when>
             <c:when test="${map.yoil==3}">
               <c:set var="yoil2" value="화요일"/>
             </c:when>
             <c:when test="${map.yoil==4}">
               <c:set var="yoil2" value="수요일"/>
             </c:when>
             <c:when test="${map.yoil==5}">
               <c:set var="yoil2" value="목요일"/>
             </c:when>
             <c:when test="${map.yoil==6}">
               <c:set var="yoil2" value="금요일"/>
             </c:when>
             <c:when test="${map.yoil==7}">
               <c:set var="yoil2" value="토요일"/>
             </c:when>
           </c:choose>
      <div id="a2"> ${map.title} :  ${map.bday} ${yoil2} 도착예정(상품 1개) </div>
      
       
      </c:forEach>
      <div>
        <table width="900">
          <tr>
            <th colspan="2" id="a3"> 받는사람 정보 </th>
            <th colspan="2" id="a4"> 결제정보</th>
          </tr>
          <tr>
            <td> 받는 사람 </td>
            <td> ${tmap.get(0).name} / ${tmap.get(0).phone} </td>
            <td> 주문 금액 </td>
           <td> <fmt:formatNumber value="${totalprice}" pattern="#,###" type="number"/>원 </td>
          </tr>
          <tr>
            <td> 받는 주소 </td>
            <td> ${tmap.get(0).juso} ${tmap.get(0).juso_etc} </td>
            <td> 배송비 </td>
            <td> <fmt:formatNumber value="${totalbaesong}" pattern="#,###" type="number"/>원 </td>
          </tr>
          <tr>
            <td> 배송요청사항 </td>
            <td> ${cla} </td>
            <td> 총결제금액 </td>
             <td> ${pay} <fmt:formatNumber value="${totalcprice}" pattern="#,###" type="number"/>원 
          </tr>
        </table>
      </div>
      <div id="a4">
        <span onclick="location='../mypage/jumunview'"> 주문 내역보기 </span>
        <span onclick="location='../main/main'"> 쇼핑 계속하기</span>
      </div>
   </section>
</body>
</html>