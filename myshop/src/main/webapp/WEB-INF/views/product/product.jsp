<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
      text-align:center;
   }
  
 </style>
 <script>
   function getjung(daecode)
   {
	   var chk=new XMLHttpRequest();
	   
	   chk.onload=function()
	   {
		   //alert(chk.responseText);
		   document.pro.jung.innerHTML=decodeURI(chk.responseText);
	   }
	   
	   chk.open("get","getjung?daecode="+daecode);
	   chk.send();
   }
   
   function getso(jung) // 중분류를 선택하면 해당되는 소분류를 가져오기
   {
	   var chk=new XMLHttpRequest();
	   var dae=document.pro.dae.value;
	   var daejung=dae+jung;
	   //alert(daejung);
	   chk.onload=function()
	   {  
		   //alert(chk.responseText);
		   document.pro.so.innerHTML=decodeURI(chk.responseText);
	   }
	   
	   chk.open("get","getso?daejung="+daejung);
	   chk.send(); 
   }
   
   function gencode()
   {
	   //대, 중, 소,+ 존재하는 가장 높은 코드값+1
	   var dae=document.pro.dae.value;
	   var jung=document.pro.jung.value;
	   var so=document.pro.so.value;
	   
	   // db에서 조회하여 같은 대중소 상품중에 가장 높은 수를 가져온다..
	    var chk=new XMLHttpRequest();
	    var pcode="p"+dae+jung+so;
	    chk.onload=function()
	    {
	    	//alert(chk.responseText);
	    	 var num=chk.responseText;
	    	
	    	if(num.length==1)
	    		num="00"+num;
	    	else if(num.length==2)
	    		 num="0"+num;
	    	
	    	document.pro.pcode.value=pcode+num;  
	    }
	    chk.open("get","getcode?pcode="+pcode);
	    chk.send();
	    
	
	   
   }
 </script>
</head>
<body>
   <section>
    <form name="pro" method="post" action="product_ok" enctype="multipart/form-data">
     <table width="800" align="center">
       <caption> <h3> 상 품 등 록 </h3> </caption>
       <tr>
         <td width="200"> 상품코드 </td>
         <td> 
           <input type="text" name="pcode" readonly> 
           <select name="dae" onchange="getjung(this.value)">
             <option> 대분류 </option>
            <c:forEach items="${dae}" var="dvo">
             <option value="${dvo.code}"> ${dvo.name} </option>
            </c:forEach>
           </select>
           <select name="jung" onchange="getso(this.value)">
             <option> 중분류 </option>
           </select>
           <select name="so" onchange="gencode()">
             <option> 소분류 </option>
           </select>
         </td>
       </tr>
       <tr>
         <td> 메인이미지 </td>
         <td> <input type="file" name="pimg"> </td>
       </tr>
       <tr>
         <td> 상세이미지 </td>
         <td> <input type="file" name="cimg"></td>
       </tr>
       <tr>
         <td> 상품명 </td>
         <td> <input type="text" name="title"> </td>
       </tr>
       <tr>
         <td> 상품가격 </td>
         <td> <input type="text" name="price"> </td>
       </tr>
       <tr>
         <td> 제조회사 </td>
         <td> <input type="text" name="made"> </td>
       </tr>
       <tr>
         <td> 할인율 </td>
         <td> <input type="text" name="halin"> </td>
       </tr>
       <tr>
         <td> 적립률 </td>
         <td> <input type="text" name="juk"> </td>
       </tr>
       <tr>
         <td> 상품수량 </td>
         <td> <input type="text" name="su"> </td>
       </tr>
       <tr>
         <td> 배송비 </td>
         <td> <input type="text" name="baesong" value="0"> </td>
       </tr>
       <tr>
         <td> 배송일 </td>
         <td> <input type="text" name="baeday"> </td>
       </tr>
       <tr>
         <td colspan="2"> <input type="submit" value="상품등록"> </td>
       </tr>
     </table>
    </form>
   </section>
</body>
</html>







