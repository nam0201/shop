<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
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
   section table span{
     display:inline-block;
     width:90px;
     height:21px;
     border:1px solid purple;
     text-align:center;
     cursor:pointer;
   }
   section #sdel {
     width:70px;
   }
  </style>
  <script>
    function maincheck(my)
    {
    	//alert(my.checked);
    	var csub=document.getElementsByClassName("csub");
    	
    	var len=csub.length; // 상품의 갯수
    	if(my.checked) //true, false
    	{
    	    //체크되었다면 => 상품의 체크박스에 전부체크
    	    for(i=0;i<len;i++)
    	    {
    	    	csub[i].checked=true;
    	    }
    	    //전체선택 체크박스도 체크
    	    document.getElementById("up").checked=true;
    	    document.getElementById("down").checked=true;
    	}
    	else
    	{
    		// 체크가 안되었다면 => 상품의 체크박스에 전부 해지
    	    for(i=0;i<len;i++)
    	    {	
    		csub[i].checked=false;
    	    }
    	    //전체선택 체크박스도 체크
    	    document.getElementById("up").checked=false;
    	    document.getElementById("down").checked=false;
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
    }
    
    function wishdel()
    {
 	   var id="";
 	   var csub=document.getElementsByClassName("csub");
 	   var len=csub.length; 	   	   
 	      for(i=0;i<len;i++)
 	      {
 		      if(csub[i].checked)
 		   	      id=id+csub[i].value+",";
 	      }	   
 	   
 	      //alert(id);
 	   
 	      // 하나이상의 상품의 wish테이블의 id를  , 로 구분하여 전달
 	      if(id!="")
 	         location="wishdel?id="+id;
 	 }
    
  </script> 
</head>
<body>
  <section>
    <table width="900">
       <caption> <h3>찜목록 </h3></caption>
       <tr>
         <td colspan="6" align="left">
           <input type="checkbox" onclick="maincheck(this)" id="up">전체선택 <span id="sdel" onclick="wishdel()">선택삭제</span>
          </td>
       </tr>    
       <c:forEach items="${wlist}" var="wvo">
        <tr>
         <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${wvo.id}">
        <td> <img src="../resources/pro/${wvo.pimg}" width="100" height="70"> </td>
          <td> ${wvo.title} </td>
          <td> <fmt:formatNumber value="${wvo.price}" type="number"/>원 </td>
          <td> ${wvo.writeday} </td>
          <td>
           <span onclick="location='cart_add?pcode=${wvo.pcode}'"> 장바구니 담기 </span> <br>
           <span style="margin-top:5px;" onclick="location='wishdel?id=${wvo.id}'"> 삭제 </span>
          </td>
        </tr>
       
      </c:forEach>  
      <tr>
        <td colspan="6" align="left">
          <input type="checkbox" onclick="maincheck(this)" id="down">전체선택 <span id="sdel">선택삭제</span>
    </table>
 
</body>
</html>