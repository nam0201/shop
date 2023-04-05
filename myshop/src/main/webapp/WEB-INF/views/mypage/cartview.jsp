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
     border-spacing:0px;
   }
   section table td {  
     height:80px;
     font-size:14px;
     border-bottom:1px solid purple;
   }
   section table tr:first-child td {  
      border-top:2px solid purple;
   }
   section table tr:last-child td {  
      border-bottom:2px solid purple;
   }
   section table #cdel {
      display:inline-block;
      width:90px;
      height:21px;
      border:1px solid purple;
      text-align:center;
      cursor:pointer;
   }
   section #cdel {
      width:70px;
   }
   section input[type=submit] {
    width:408px;
    height:54px;
    background:purple;
    color:white;
    font-size:18px;
    border:1px solid #cccccc;
  }
   section input[type=submit]:disabled {
     background:white;
     color:purple;
   }
  </style>
  <script>
   function maincheck(my)
   {
	   //alert(my.checked);
	   var csub=document.getElementsByClassName("csub");
	   //alert(csub.length);
	   
	   var len=csub.length; // 상품의 갯수
	   
	   if(my.checked) // true, false
	   {
		   // 체크가 되었다면 => 상품의 체크박스에 전부 체크
		   for(i=0;i<len;i++)
		   {
			   csub[i].checked=true;
		   } 	   
		   // 전체선택 체크박스도 체크
		   document.getElementById("up").checked=true;
		   document.getElementById("down").checked=true;
	   }	
	   else
	   {
		   // 체크가 안되었다면 => 상품의 체크박스에 전부 해제
		   for(i=0;i<len;i++)
		   {
			   csub[i].checked=false;
		   } 	   
		   // 전체선택 체크박스도 체크
		   document.getElementById("up").checked=false;
		   document.getElementById("down").checked=false;
	   }	   
	   
	   price_cal();
	   
	   // 전체선택이 클릭되었을때 submit버튼 사용여부
	   var n=0;
	   for(i=0;i<len;i++)
	   {
		   if(csub[i].checked)
			   n++; // 체크가 된 상품의 갯수
	   }
	   if(n==0)
       { 
    	   document.gform.submit.disabled=true;
       }
       else
       {
           document.gform.submit.disabled=false;	   
       }
   }
   
   function subcheck()
   {
	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; // 총상품의 갯수
	   
	   // 상품의 체크박스가 몇개 체크되었나를 계산
	   var n=0;
	   for(i=0;i<len;i++)
	   {
		   if(csub[i].checked)
			   n++; // 체크가 된 상품의 갯수
	   }

       if(len==n)
       {
    	   document.getElementById("up").checked=true;
		   document.getElementById("down").checked=true;
       }	
       else
       {
    	   document.getElementById("up").checked=false;
		   document.getElementById("down").checked=false;
       }	  
       
       //checked가 하나도 안되어 있으면 전송버튼 사용불가
       if(n==0)
       { 
    	   document.gform.submit.disabled=true;
       }
       else
       {
           document.gform.submit.disabled=false;	   
       }
    	   
       price_cal();
   }
   
   var proprice=[${proprice}]; // [5000,6000,8000]
   var prohalin=[${prohalin}]; // [500,300,100]
   var probae=[${probae}];   // [0,3000,2000]
   function price_cal() //체크박스가 클릭될때 실행
   {
	   // 체크박스가 체크된 것을 확인(subcheck)
	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; // 상품의 갯수
	   
	   var chongprice=0;
	   var halin=0;
	   var bprice=0;
	   var totalpcode="";
	   var totalsu="";
	   for(i=0;i<len;i++)
	   {
		   if(csub[i].checked)  // 체크된 상품이면
		   {
			   var su=parseInt(document.getElementsByClassName("su")[i].value);
			  // alert(su);
			   // 총상품가격 product.price
			   chongprice=chongprice+(proprice[i]*su);
			   // 총할인금액 product.halin
			   halin=halin+(prohalin[i]*su);
			   // 총배송비    product.baesong
			   bprice=bprice+probae[i];
			   
			   // 체크된 상품코드 추가
			   totalpcode=totalpcode+document.getElementsByClassName("pcode")[i].value+",";
			   // 체크된 상품 수량추가
			   totalsu=totalsu+document.getElementsByClassName("su")[i].value+",";
		   }	   
	   }	   
	   //alert(totalpcode);
	   //alert(totalsu);
	   // 체크된 상품코드와 수량을 form태그에 전달
	   document.gform.pcode.value=totalpcode;
	   document.gform.su.value=totalsu;
	   
	   // 총결제금액 
	   cprice=chongprice+bprice-halin;
	   // , 추가
	   chongprice=new Intl.NumberFormat().format(chongprice);
	   halin=new Intl.NumberFormat().format(halin);
	   bprice=new Intl.NumberFormat().format(bprice);
	   //cprice=new Intl.NumberFormat().format(cprice);
	   cprice=comma(cprice);
	   
	   
	   // 문서에 출력
	   document.getElementById("chongprice").innerText=chongprice+"원";
	   document.getElementById("halin").innerText=halin+"원";
	   document.getElementById("bprice").innerText=bprice+"원";
	   document.getElementById("cprice").innerText=cprice+"원";
	   /*
	   var chk="";
	   for(i=0;i<len;i++)
	   {
		   if(csub[i].checked)
			   chk=chk+i+",";
	   }	   
	   */
	   // 배열을 이용하여 체크된 상품의 인덱스를 저장
	   /*
	   var pro=new Array(len); // 체크박스의 갯수만큼 배열 생성
	   
	   for(i=0;i<len;i++)
	   {
		   if(csub[i].checked) // 상품앞에 있는 체크박스가 체크되었느냐?
			    pro[i]=1;
		   else
			    pro[i]=-1;  
	   }	   
	   // 체크된 인덱스는 0이상  , 체크가 안된 인덱스는 -1
	   //alert(pro);
	   */
	   
	   // gumae에 보내기 위한 pcode와 su를 합치기
	   
   }
   function comma(num)
   {
	   return new Intl.NumberFormat().format(num);
   }
   
   function cartdel()
   {
	   var id="";
	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; 
  
       for(i=0;i<len;i++)
       {
		    if(csub[i].checked)
		       id=id+csub[i].value+",";
	   }	   
	   
	   // alert(id);
	   
	      // 하나이상의 상품의 wish테이블의 id를  , 로 구분하여 전달
	   if(id!="")   
	      location="cartdel?id="+id;
   }
   </script>
   <script src="https://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
 <script>
   $(function()
   {
	   var $imsi=$(".su");
	   $(".su").spinner(
	   { 
		   min:1,
		   max:10,
		   spin:function(e,ui)  
	       { 
			   
			   //price_cal(); // 체크된 상품의 가격을 계산하여 아래에 출력
			   
			   // 수량, 단가를 알아야 된다..
			   // ui.value : 수량
			   var n=$imsi.index(this);
			   alert($(".su").val());
		       // alert( $("section .pr").eq(n).value ) ;
		       //alert( document.getElementsByClassName("pr")[n].value);
		       var pr=document.getElementsByClassName("pr")[n].value;  // 단가
		       var baesong=document.getElementsByClassName("baesong")[n].value;
		       var price=parseInt(ui.value*pr)+parseInt(baesong); // 수량
		       price=comma(price);    
		       document.getElementsByClassName("prin")[n].innerText=price+"원";
		       
		       // ajax를 통해 cart테이블의 수량을 변경시켜준다..
		       var pcode=document.getElementsByClassName("pcode")[n].value;
		       var su=ui.value;
		       
		       var chk=new XMLHttpRequest();
		       chk.onload=function()
		       {
		    	   //alert(chk.responseText);
		    	   if(chk.responseText=="1")
		    		   alert("내부오류");
		       }
		       chk.open("get","cart_su?pcode="+pcode+"&su="+su);
		       chk.send();
		       
		       
	       }
	   });
   });
   
   function comma(num)
   {
	   return new Intl.NumberFormat().format(num);
   }
  </script>
  <style>
    section .su {
      width:30px;
      height:20px;
      outline:none;
    }
  </style>
    
</head>
<body>
   <section>
     <table width="900" align="center">
       <caption> <h3> 장바구니 목록 </h3> </caption>
       <tr>
         <td colspan="7" align="left"> 
           <input type="checkbox" onclick="maincheck(this)" id="up">전체선택  
           <span id="cdel" onclick="cartdel()">선택삭제</span>
         </td>
       </tr>
      <c:forEach items="${clist}" var="cvo">
        <input type="hidden" class="pr" value="${(cvo.price-(cvo.price*(cvo.halin/100)))}">
        <input type="hidden" class="pcode" value="${cvo.pcode}">
        <input type="hidden" class="baesong" value="${cvo.baesong}">
       <tr>
         <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${cvo.id}">
         <td> <img src="../resources/pro/${cvo.pimg}" width="100" height="70"></td>
         <td> ${cvo.title} </td>
         <td> <input type="text"   name="su" class="su" value="${cvo.su}" readonly> </td>
         <td class="prin"> <fmt:formatNumber value="${(cvo.price-(cvo.price*(cvo.halin/100)))*cvo.su + cvo.baesong}" pattern="#,###" type="number"/>원 </td>
         <td> ${cvo.writeday} </td>
         <td>
           <span style="margin-top:5px;" onclick="location='cartdel?id=${cvo.id}'"> 삭제 </span>
         </td>
       </tr>
      </c:forEach>
       <tr>
         <td colspan="7" align="left"> 
           <input type="checkbox" onclick="maincheck(this)" id="down">전체선택  
           <span id="cdel" onclick="cartdel()">선택삭제</span>
         </td>
       </tr>
       <tr>
         <td colspan="7" align="right">
         총상품가격 : <span id="chongprice"> 0원 </span>
         총할인가격 : <span id="halin"> 0원 </span>
         총배송비 : <span id="bprice"> 0원 </span>
            총결제금액 : <span id="cprice"> 0원 </span>
         </td>
       </tr>
       <tr>
         <td colspan="7" align="center">
          <form name="gform" method="post" action="../product/gumae">
            <input type="hidden" name="pcode">
            <input type="hidden" name="su">
            <input type="submit" value="구매하기" name="submit" disabled>
          </form>
         </td>
       </tr>
     </table>
   </section>
   <style>
     #chongprice,#halin,#bprice {
      font-size:16px;
      color:purple;
      font-weight:900;
    }
    #cprice {
      font-size:18px;
      color:purple;
      font-weight:900;
    }
   </style>
</body>
</html>