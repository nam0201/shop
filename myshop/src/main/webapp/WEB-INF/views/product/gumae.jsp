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
 
      margin:auto;
      text-align:center;
   }
   section table {
      border-spacing:0px; /* 셀과 셀의 공간 */
      margin-top:30px;
   }
   section table tr:first-child td {
     border-top:2px solid #cccccc;
   }
   section table tr:last-child td {
     border-bottom:1px solid #cccccc;
   }
   section table td {
     font-size:14px;
     height:30px;
     padding-left:10px;
   }
   section table tr td:first-child {
     background:#eeeeee;
     padding-right:10px;
   }
   section #bs {
     font-size:14px;
     font-weight:100;
     display:inline-block;
     width:72px;
     height:20px;
     border:1px solid #aaaaaa;
     padding:4px;
     margin-left:20px;
     cursor:pointer;
   }
 </style>
 <script>
  function bae_search()
  {
	  open("baeview","","width=500,height=620");
  }
  
  function member_phone()
  {
	if(confirm("정말 전화번호를 변경하시겠습니까?"))
	{ 	
	  var phone=document.gform.phone.value;
	  
	  var chk=new XMLHttpRequest();
	  chk.onload=function()
	  {
		  //alert(chk.responseText);
		  if(chk.responseText=="1")
			  alert("오류발생");
	  }
	  chk.open("get","member_phone?phone="+phone);
	  chk.send();
	}
  }
  
  function chgcla()
  {
	   var cla=document.gform.cla.value;
	   var id=document.gform.id.value;
	   open("chgcla?cla="+cla+"&id="+id,"","width=400,height=500");
  }
  
  function check(form)
  {
	   
  }
 </script>
</head>
<body>
   <section>
     <h2 align="left"> 주문/결제</h2>
     <hr>
    <form name="gform" method="post" action="gumae_ok" onsubmit="return check(this)"> 
      <input type="hidden" name="id" value="${bvo.id}">  <!-- 배송테이블의 id -->
      <input type="hidden" name="cla" value="${bvo.cla}">
      <input type="hidden" name="pcode" value="${pcode}">
      <input type="hidden" name="su2" value="${su}">
      <input type="hidden" name="juk" value="0">
      <input type="hidden" name="privateprice" value="${privateprice}">
     <!-- 구매자 정보 -->
     <table width="1000" align="center">
       <caption> <h3 align="left"> 구매자 정보 </h3> </caption>
       <tr>
         <td align="right" width="120"> 이름 </td>
         <td align="left"> ${mvo.name} </td>
       </tr>
       <tr>
         <td align="right"> 이메일 </td>
         <td align="left"> ${mvo.email} </td>
       </tr>
       <tr>
         <td align="right"> 휴대폰 </td>
         <td align="left">
           <input type="text" name="phone" value="${mvo.phone}">
           <input type="button" value="전송" onclick="member_phone()">
         </td>
       </tr>
     </table>
     
     <!-- 배송지정보 -->
        <table width="1000" align="center">
       <caption> <h3 align="left"> 배송지 정보 <span id="bs" onclick="bae_search()"> 배송지변경 </span> </h3> </caption>
       <tr>
         <td align="right" width="120"> 이름 </td>
         <td align="left"> <span class="my"> ${bvo.name} </span>  <span class="my"> 기본배송지 </span> </td>
       </tr>
       <tr>
         <td align="right"> 주소 </td>
         <td align="left"> <span class="my"> ${bvo.juso} ${bvo.juso_etc} </span> </td>
       </tr>
       <tr>
         <td align="right"> 휴대폰 </td>
         <td align="left"> <span class="my"> ${bvo.phone} </span> </td>
       </tr>
         <c:if test="${bvo.cla==0}">
           <c:set var="cla" value="문 앞"/>
         </c:if>
         <c:if test="${bvo.cla==1}">
           <c:set var="cla" value="직접받고 부재시 문 앞"/>
         </c:if>
         <c:if test="${bvo.cla==2}">
           <c:set var="cla" value="경비실"/>
         </c:if>
         <c:if test="${bvo.cla==3}">
           <c:set var="cla" value="택배함"/>
         </c:if>
       <tr>
         <td align="right"> 배송 요청사항 </td>
         <td align="left"> <span class="my" id="my2"> ${cla} </span> <input type="button" onclick="chgcla()" value="변경">
       </tr>
     </table>
     <!-- 배송일및 상품 -->
     <table width="1000" align="center">
       <caption> <h3 align="left"> 배송 1건 </h3> </caption>
         <c:forEach items="${plist}" var="pvo">
       <tr>
         <td align="left">  
          <c:choose>
             <c:when test="${pvo.yoil==1}">
               <c:set var="yoil2" value="일요일"/>
             </c:when>
             <c:when test="${pvo.yoil==2}">
               <c:set var="yoil2" value="월요일"/>
             </c:when>
             <c:when test="${pvo.yoil==3}">
               <c:set var="yoil2" value="화요일"/>
             </c:when>
             <c:when test="${pvo.yoil==4}">
               <c:set var="yoil2" value="수요일"/>
             </c:when>
             <c:when test="${pvo.yoil==5}">
               <c:set var="yoil2" value="목요일"/>
             </c:when>
             <c:when test="${pvo.yoil==6}">
               <c:set var="yoil2" value="금요일"/>
             </c:when>
             <c:when test="${pvo.yoil==7}">
               <c:set var="yoil2" value="토요일"/>
             </c:when>
           </c:choose>
           [${yoil2}] ${pvo.bday}배송예정
         </td>
       </tr>
       <tr>          
         <td align="left" style="background:white"> 
           ${pvo.title} 오전 10시전 주문건 당일배송  &nbsp;&nbsp;&nbsp;&nbsp; 수량 ${pvo.su} /
           <c:if test="${pvo.baesong==0}">
                           무료배송
           </c:if>
           <c:if test="${pvo.baesong!=0}"> 
               <fmt:formatNumber value="${pvo.baesong}" type="number" pattern="#,###"/>원 
           </c:if>
         </td>
       </tr>
       </c:forEach>
     </table>
     <!-- 결제정보 -->
     <table width="1000" align="center">
       <caption> <h3 align="left"> 결제정보 </h3> </caption>
       <tr>
         <td align="right" width="120"> 총상품가격 </td>
         <td align="left"> 
         <fmt:formatNumber value="${pprice}" pattern="#,###" type="number"/>원
         </td>
       </tr> 
       <tr>
         <td align="right"> 배송비 </td>
         <td align="left"> <fmt:formatNumber value="${pbae}" type="number" pattern="#,###"/>원 </td>
       </tr> 
       <tr>
         <td align="right"> 적립금 </td>
         <td align="left"> <fmt:formatNumber value="0" type="number" pattern="#,###"/>원</td>
       </tr> 
       <tr>
         <td align="right"> 총결제금액 </td>
         <td align="left">
         <input type="hidden" name="cprice" value="<fmt:formatNumber value='${payprice}' type='number' pattern='#'/>">
          <fmt:formatNumber value="${payprice}" pattern="#,###" type="number"/>원 
         </td>
       </tr> 
       <tr>
         <td align="right" valign="top"> 결제방법 </td>
         <td align="left"> 
           <input type="radio" name="pay" value="0" onclick="pay_change(0)">계좌이체
           <input type="radio" name="pay" value="1" onclick="pay_change(1)">쿠페이머니
           <input type="radio" name="pay" value="2" checked onclick="pay_change(2)">신용/체크카드
           <input type="radio" name="pay" value="3" onclick="pay_change(3)">법인카드
           <input type="radio" name="pay" value="4" onclick="pay_change(4)">휴대폰
           <input type="radio" name="pay" value="5" onclick="pay_change(5)">무통장입금
           
           <div class="pay"> 
             *은행선택 
             <select name="bank">
               <option value="0"> 선 택 </option>
               <option value="1"> 국민은행 </option>
               <option value="2"> 우리은행 </option>
               <option value="3"> 신한은행 </option>
               <option value="4"> 농협은행 </option>
               <option value="5"> 카카오 </option>
               <option value="6"> k뱅크 </option>
               <option value="7"> 축협은행 </option>
             </select> <hr>
             <input type="checkbox" name="gibonpay" value="0">
                           기본 결제 수단으로 사용
           </div>
           <div class="pay">
            <input type="hidden" name="coopay" value="0"> 
            * 잔액   0원  
            <hr>
            * 잔액이 부족할 경우, 결제 진행시에 충전됩니다.
            <hr>
            <input type="checkbox" name="gibonpay" value="1">
                           기본 결제 수단으로 사용
           </div>
           <div class="pay" style="display:block;">
            * 카드선택 
             <select name="card">
               <option value="0"> 선 택 </option>
               <option value="1"> 신한카드 </option>
               <option value="2"> 우리카드 </option>
               <option value="3"> 농협카드 </option>
               <option value="4"> 국민카드 </option>
               <option value="5"> 삼성카드 </option>
               <option value="6"> 롯데카드 </option>
             </select>
             <hr>
             * 할부기간
             <select name="gigan">
               <option value="0"> 선 택 </option>
               <option value="1"> 일시불 </option>
               <option value="2"> 2개월 </option>
               <option value="3"> 3개월 </option>
               <option value="4"> 4개월 </option>
               <option value="5"> 5개월</option>
               <option value="6"> 6개월 </option>
             </select> 
             * 할부는 50,000원 이상만 가능합니다.
             <hr>
            <input type="checkbox" name="gibonpay" value="2" checked>
                           기본 결제 수단으로 사용
           </div>
           <div class="pay"> 
            * 카드선택 
             <select name="card2">
               <option value="0"> 선 택 </option>
               <option value="1"> 신한카드 </option>
               <option value="2"> 우리카드 </option>
               <option value="3"> 농협카드 </option>
               <option value="4"> 국민카드 </option>
               <option value="5"> 삼성카드 </option>
               <option value="6"> 롯데카드 </option>
             </select>
             <hr>
             * 할부기간
             <select name="gigan2">
               <option value="1"> 일시불 </option>
             </select> 
             * 법인카드는 일시불 결제만 가능합니다
             <hr>
            <input type="checkbox" name="gibonpay" value="3">
                           기본 결제 수단으로 사용
           </div>
           <div class="pay"> 
            * 통신사 종류
             <select name="tong">
               <option value="0"> KT </option>
               <option value="1"> SKT </option>
               <option value="2"> LG </option>
               <option value="3"> 헬로모바일 </option>
             </select> 
              <hr>
            <input type="checkbox" name="gibonpay" value="4">
                           기본 결제 수단으로 사용
           </div>
           <div class="pay"> 
            * 입금은행 
            <select name="bank2">
               <option value="0"> 선 택 </option>
               <option value="1"> 국민은행 </option>
               <option value="2"> 우리은행 </option>
               <option value="3"> 신한은행 </option>
               <option value="4"> 농협은행 </option>
               <option value="5"> 카카오 </option>
               <option value="6"> k뱅크 </option>
               <option value="7"> 축협은행 </option>
             </select> 
             <hr>
             * 입금기한 ${gihan}  
              <hr>
            <input type="checkbox" name="gibonpay" value="5">
                           기본 결제 수단으로 사용
           </div>
         </td>
       </tr> 
     </table>
     <div id="submit"> <input type="submit" value="결제하기"> </div>
    </form>
    <script>
      function pay_change(n)
      {
    	  var pay=document.getElementsByClassName("pay");
    	  
    	  for(i=0;i<pay.length;i++)
    	  {	  
    		  pay[i].style.display="none";
    		  document.gform.gibonpay[i].checked=false;
    	  }
    	  pay[n].style.display="block";
    	  document.gform.gibonpay[n].checked=true;
      }
    </script>
    <style>
      section #submit {
        margin-top:20px;
      }
      section input[type=submit] {
         width:400px;
         height:50px;
         border:1px solid purple;
         background:white;
         font-size:17px;      
      }
      section .pay {
         width:800px;
         height:100px;
         display:none;
         padding:10px;
         border:1px solid #aaaaaa;
         margin-top:15px;
      }
      section hr {
         border-color:#eeeeee;
         border-top:none;
      }
    </style>
   </section>
</body>
</html>