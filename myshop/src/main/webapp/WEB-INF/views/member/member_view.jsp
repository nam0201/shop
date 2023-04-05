 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   section table {
     border-spacing:0px;
   }
   section td  {
      font-size:13px;
      height:40px;
      border-top:1px solid purple;
      border-bottom:2px solid purple;
   }
   section th {
     font-size:14px;
      height:30px;
      border-top:2px solid purple;
   }
   section #edit {
      display:inline-block;
      width:200px;
      height:20px;
      font-size:14px;
      margin-top:15px;
      border:1px solid purple;
      background:purple;
      color:white;
      padding:4px;
      cursor:pointer;
   }
 </style>
</head>  
<body>
   <section>
     <table width="900" align="center">
       <caption> <h3> 회 원 정 보 </h3></caption>
       <tr>
         <th> 아이디 </th>
         <th> 이름 </th>
         <th> 우편번호 </th>
         <th> 주소 </th>
         <th> 전화번호 </th>
         <th> 이메일 </th>
         <th> 가입일 </th>
       </tr>
       <tr align="center">
         <td> ${mvo.userid} </td>
         <td> ${mvo.name} </td>
         <td> ${mvo.zip} </td>
         <td> ${mvo.juso} ${mvo.juso_etc} </td>
         <td> ${mvo.phone} </td>
         <td> ${mvo.email} </td>
         <td> ${mvo.writeday} </td>
       </tr>
     </table>
 
     <div align="center"> 
       <span id="edit" onclick="location='member_edit'"> 정보 변경 </span></div>
       <span id="edit" onclick="location='out'">탈퇴신청 </span>                
   </section>
</body>
</html>