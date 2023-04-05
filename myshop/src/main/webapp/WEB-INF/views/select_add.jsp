<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script>
   function add()
   {
	   // javascript에서 select태그의 option를 추가할때  => length, text, value
	   document.pkc.food.options.length=5;   // option태그의 숫자
	   document.pkc.food.options[1].text="짜장면";
	   document.pkc.food.options[1].value="119";
	   document.pkc.food.options[2].text="짬뽕";
	   document.pkc.food.options[2].value="120";
	   document.pkc.food.options[3].text="탕수육";
	   document.pkc.food.options[3].value="121";
	   document.pkc.food.options[4].text="팔보채";
	   document.pkc.food.options[4].value="122";
   }
   function add2()
   {
	   var str="<option value='11'> 볶음밥 </option>";
	   str=str+"<option value='12'> 잡채밥 </option>";
	   str=str+"<option value='13'> 짜장밥 </option>";
	   str=str+"<option value='14'> 짬뽕밥 </option>";
	   
	   document.pkc.food.innerHTML=document.pkc.food.innerHTML+str;
   }
   function chg()
   {
	   alert();
   }
 </script>
</head>
<body> <!-- views/select_add.jsp -->
  <!-- 
     select 태그에 option태그를 자바스크립트에서 추가
   -->
   <input type="button" onclick="add()" value="option추가">
   <input type="button" onclick="add2()" value="option추가2">
   <form name="pkc">
     <select name="food" onchange="chg()">
      <option> 선택 </option></select>
   </form>
</body>
</html>







