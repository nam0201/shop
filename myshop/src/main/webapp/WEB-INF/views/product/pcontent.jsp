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
      margin-top:50px;
      position:relative;
   }
   
    section #title {
      width:1000px;
      height:500px;
      margin:auto;
    }
    section #title > #left {
      width:500px;
      height:500px;
      float:left;
    }
    section #title > #right {
      width:500px;
      height:500px;
      float:right;
      position:relative;
    }
   
    section #content {
      width:1000px;
      height:600px;
      margin:auto;
      margin-top:40px;
    }
    section #hugi {
      width:1000px;
      margin:auto;
      margin-top:40px;
      margin-bottom:40px;
    }
   section #mun  {
      width:1000px;
      margin:auto;
      margin-bottom:40px;
    }  
    section #mun .inner {
      border-bottom:1px solid #cccccc;
      margin-top:15px;
      padding-bottom:15px;
    }
    section #mun .inner #aa {
      display:inline-block;
      width:40px;
      padding-bottom:2px;
      text-align:center;
      border:none;
      background:#888888;
      color:white;
    }
    section #mun .inner #bb {
       display:inline-block;
      width:40px;
      padding-bottom:2px;
      text-align:center;
      border:none;
      background:blue;
      color:white;
    }
    section #mun .inner #title2 {
      display:inline-block;
      width:790px;
      height:40px;
      font-weight:900;
    } 
    section #mun h2 span {
      width:80px;
      height:23px;
      border:1px solid purple;
      font-size:14px;
      font-weight:100;
      margin-left:40px;
      padding:3px;
    }
    
    section #etc {
      width:1000px; 
      margin:auto;
       text-align:center;
      margin-top:50px;
      margin-bottom:30px;
    }
    section #su {
      outline:none;
      width:40px;
      height:20px;
    }
    section #ptitle {
      font-size:20px;
      color:purple;
      font-weight:900;
    }
    section #hal {
      height:30px;
      color:grey;
    }
    section #pri {
      font-size:20px;
      color:purple;
      font-weight:900;
    }
    section #juk span {
      margin-top:10px;
      display:inline-block;
      width:134px;
      height:16px;
      border:1px solid purple;
      border-radius:8px;
      font-size:12px;
      text-align:center;
      padding:2px;
    }
    section #bae {
      margin-top:20px;
      font-size:14px;
    }
    section #date {
      margin-top:15px;
      font-size:14px;
    }
    section #made {
      margin-top:20px;
      font-size:14px;
    }
    section #suform {
      margin-top:20px;
    }
    section #btn {
      margin-top:20px;
    }
    section #btn span {
      display:inline-block;
      font-size:14px;
      width:90px;
      height:18px;
      border:1px solid purple;
      padding-top:4px;
      padding-bottom:4px;
      text-align:center;
      background:purple;
      color:white;
    }
    
    /* pcontent내 메뉴 */
    section #pmenu {
      width:1000px;
      height:40px;
      margin:auto;
      text-align:center;
    }
    section #pmenu #pul {
      padding-left:0px;
      background:yellow;
    }
    section #pmenu #pul #pli {
      float:left;
      width:246px;
      height:30px;
      border:1px solid #cccccc;
      border-top-width:3px;
      margin-left:0px;
      list-style-type:none;
      text-align:center;
      padding-top:10px;
      background:#FaFaFa;
      
    }
 </style>
 <script src="https://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
 <script>
   $(function()
   {
	   $("#su").spinner(
	   {
		   min:1,
		   max:10,
		   spin:function(e,ui) // spinner의 값을 바꿀때 실행되는 함수
	       {
			   //alert(ui.value);
			   //ui.value(상품선택수)*상품가격 => 전달..
			   var price=ui.value*${pvo.price-(pvo.price*(pvo.halin/100))};
			   price=comma(price);
			   document.getElementById("pri").innerText=price+"원";
	       }
	   });
   });
   function comma(num)
   {
	   return new Intl.NumberFormat().format(num);
   }
   function wish(my)
   {
	   var ck;
	  // alert(my.src.indexOf("w1.png")); //그림이 달라서 빨강하트 양의 정수, 회색하트 음의 정수  
	   if(my.src.indexOf("w1.png")== -1)
		{
		   //w2.png에서 클릭되었다. =>delete
		
		   ck=1;
		}  
	   else
		 {
		   //w1.png에서 클릭되었다. =>insert
		   ck=2;
		 }
	  
	   <c:if test="${userid!=null}">
	      <c:set var="chk" value="true"/>
	   </c:if>
	   <c:if test="${userid==null}">
	      <c:set var="chk" value="false"/>
	   </c:if>
	   
	   if(${chk})
	   {	   
	      var chk=new XMLHttpRequest();
	      chk.onload=function()
	      {
		      //alert(chk.responseText);
		      if(chk.responseText=="0")
		      {
		    	  if(ck==1)
		    	     my.src="../resources/img/w1.png";
		    	  else
		    		 my.src="../resources/img/w2.png";
		      }
		      else
		      {	  
		    	  alert("예상하지 않은 오류");
		      }
		  }
	      chk.open("get","wish_add?pcode=${pvo.pcode}&ck="+ck);
	      chk.send();
	   }
	   else
		{
		   location="../login/login";
		}    
   }
   
   function cart_add()
   {
	   // 수량은 form태그에서 읽어온다..
	   var su=document.pform.su.value;
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   //alert(chk.responseText);
		   if(chk.responseText=="0")
		   {
			  /*  if(confirm("장바구니로 이동하시겠습니까?"))
				{
				   location="cart_view";
				}    */
			  // id=cart_move요소를 보이게 하기
			  document.getElementById("cart_move").style.visibility="visible";
			  setTimeout(function()
			  {
				  document.getElementById("cart_move").style.visibility="hidden";
			  },3000);	  
			 	    
		   }
		   else
			{
			   alert("오류");
			}   
	   }
	   chk.open("get","cart_add?pcode=${pvo.pcode}&su="+su);
	   chk.send();
   }
   
   function gumae()
   {
	   document.pform.submit();
   }
 </script>
 <style>
   section #cart_move{
     position:absolute;
     left:20px;
     top:220px;
 
     width:180px;
     height:60px;
     font-size:12px;
     border:1px solid purple;
     text-align:center;
     background:white;
     visibility:hidden;
   }
   section #cart_move #btn2{
     display:inline-block;
     width:120px;
     height:20px;
     margin-top:10px;
     border:1px solid black;
   }
   section #layer {
       position:absolute;
       left:1100px;
       top:400px;
    }
 </style>
 <script>
   function movelayer()  // 브라우저가 스크롤 될 때 id="layer" 스크롤 된만큼 아래로 내려서 고정위치에 존재
   {
	   var top=document.documentElement.scrollTop; 
	   document.getElementById("layer").style.top=(top+400)+"px";
   }
   document.onscroll=movelayer;
   
   function moveTop()
   {
	   document.documentElement.scrollTop=0;
   }
 </script>
</head>
<body>
   <section>
      <div id="layer">  <!-- 최근 본 상품 -->
        <c:forEach items="${plist2}" var="pvo">
           <a href="pcontent?pcode=${pvo.pcode}"><img src="../resources/pro/${pvo.pimg}" width="50"></a> <p>
        </c:forEach>
        <span onclick="moveTop()">TOP</span>
       </div> 
      <div id="title">
        <div id="left" align="center"> <img src="../resources/pro/${pvo.pimg}" width="400"> </div>
        <div id="right">
        
         <div id="cart_move">
         <span> 상품이 장바구니에 담겼습니다.</span><br>
         <span id="btn2" onclick="location='../mypage/cartview'" style="cursor:pointer"> 장바구니로 가기</span>
          </div>
         <form name="pform" method="post" action="gumae">
         <input type="hidden" name="pcode" value="${pvo.pcode}">
           <div id="ptitle"> ${pvo.title}</div>
           <c:set var="ss" value="5"/>
           <div> 
             <c:forEach begin="1" end="${pvo.star}">
             <img src="../resources/img/star1.png" width="16">
             </c:forEach>
             <c:forEach begin="1" end="${5-pvo.star}">
             <img src="../resources/img/star2.png" width="16">
            </c:forEach>
           </div>
           <hr>
           <div id="hal"> ${pvo.halin}% <s><fmt:formatNumber value="${pvo.price}" type="number"/>원</s></div>
           <div id="pri"> <fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" pattern="#,###" type="number"/>원 </div>
           <div id="jung"><span>최대적립 <fmt:formatNumber value="${pvo.price*(pvo.juk/100)}" pattern="#,###" type="number"/>원  적립</span></div>
           <div id="bae"> 
             <c:if test="${pvo.baesong==0}">
                              무료배송
             </c:if>
             <c:if test="${pvo.baesong!=0}">배송비는 
               <fmt:formatNumber value="${pvo.baesong}" pattern="#,###" type="number"/>원
             </c:if>
           </div>
           <c:choose>
             <c:when test="${pvo.yoil==1}">
               <c:set var="yoil2" value="일"/>
             </c:when>
             <c:when test="${pvo.yoil==2}">
               <c:set var="yoil2" value="월"/>
             </c:when>
             <c:when test="${pvo.yoil==3}">
               <c:set var="yoil2" value="화"/>
             </c:when>
             <c:when test="${pvo.yoil==4}">
               <c:set var="yoil2" value="수"/>
             </c:when>
             <c:when test="${pvo.yoil==5}">
               <c:set var="yoil2" value="목"/>
             </c:when>
             <c:when test="${pvo.yoil==6}">
               <c:set var="yoil2" value="금"/>
             </c:when>
             <c:when test="${pvo.yoil==7}">
               <c:set var="yoil2" value="토"/>
             </c:when>
           </c:choose>
           <div id="date"> [${yoil2}] ${pvo.bday}배송예정</div>
           <div id="made"> 제조사 : ${pvo.made}</div>
           <div id="suform"> 
               <input type="text" name="su" id="su" value="1" readonly>
           </div>
           <div id="btn" style="clear:both;"> 
            <c:if test="${wcnt==0 || wcnt==null}">
           <img style="cursor:pointer" src="../resources/img/w1.png" width="32" valign="bottom" onclick="wish(this)">  
           </c:if>
           <c:if test="${wcnt!=0 && wcnt!=null}">
           <img style="cursor:pointer" src="../resources/img/w2.png" width="32" valign="bottom" onclick="wish(this)">
           </c:if>
           <span onclick="cart_add()" style="cursor:pointer">장바구니</span>
            <span onclick="gumae()"> 구매하기 </span>
            </div>
           </form>
        </div>
        
      </div>
      <div id="pmenu">
        <ul id="pul">
          <li id="pli"> 상품상태 </li>
          <li id="pli"> 상품후기 </li>
          <li id="pli"> 상품문의  </li>
          <li id="pli"> 배송/교환/반품안내</li>
        </ul>
      </div>
       <div id="content" align="center">
         <img src="../resources/pro/${pvo.cimg}" width="850" height="600">
      </div>
      <div id="hugi">
        <h2> 상품후기 </h2>
        <hr>
        <c:forEach items="${rlist}" var="rvo">
           <div> ${rvo.userid}</div>
           <div>  
            <c:forEach begin="1" end="${rvo.star}">
               <img src="../resources/img/star1.png" width="16">
            </c:forEach>
            <c:forEach begin="1" end="${5-rvo.star}">
               <img src="../resources/img/star2.png" width="16">
            </c:forEach>
            ${rvo.writeday}
           </div> <!-- 별점출력 div -->
           <div> ${pvo.title}</div>  
           <div> <b>${rvo.title}</b></div>
           <div> ${rvo.content}</div>
           <div style="margin-bottom:20px;border-bottom:1px solid #cccccc">&nbsp;</div>
       </c:forEach>
      </div>
    <div id="mun">
         <h2> 상품문의   <span onclick="munview()"> 문의하기 </span></h2>
         <hr>
        <c:forEach items="${qlist}" var="qvo">
         <div class="inner">
            <c:if test="${qvo.seq==0}">
              <span id="aa"> 질문 </span>
            </c:if>
            <c:if test="${qvo.seq==1}">
              <span id="bb">  답변 </span>
            </c:if>
            <span id="title2"> ${pvo.title} </span>
            <span id="writeday2"> ${qvo.writeday} </span> 
            <div id="content2"> ${qvo.content}</div> 
         </div>
        </c:forEach>
      </div>
      <div id="etc"> <img src="../resources/img/etc.png"> </div>
      
      <div id="munwrite">
        <form method="post" action="munwrite">
          <input type="hidden" name="pcode" value="${pvo.pcode}">
          <table width="400" align="center">
            <caption> <h3> 문의등록 </h3> </caption>
            <tr>
              <td> 상품명 </td>
              <td> ${pvo.title} </td>   
            </tr>
            <tr>
              <td> 문의내용 </td>
              <td> <textarea cols="30" rows="8" name="content"></textarea> </td>
            </tr>
            <tr>
              <td colspan="2" align="center"> <input type="submit" value="문의 저장하기">
            </tr>
          </table>
        </form>
      </div>
   </section>
   <script>
     function munview()
     {
    	 var w=document.documentElement.clientWidth;
    	 var h=document.documentElement.clientHeight;
    	 //alert(w+" "+h);
    	 w=w/2-250;
    	 h=h/2+document.documentElement.scrollTop-140;
    	 
    	 document.getElementById("munwrite").style.left=w+"px";
    	 document.getElementById("munwrite").style.top=h+"px";
    	 document.getElementById("munwrite").style.visibility="visible";
     }
     
   </script>
   <style>
     section  #munwrite {
        position:absolute;
        width:500px;
        height:280px;
        border:3px solid black;
        background:white;
        visibility:hidden;
     }
   </style>
</body>
</html>
