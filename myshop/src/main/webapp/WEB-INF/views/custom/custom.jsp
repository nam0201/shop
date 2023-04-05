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
   section input[type=submit] {
      width:336px;
      height:39px;
      border:1px solid purple; 
      background:purple;
      border:1px solid purple; 
      color:white;
   }
   section input[type=text] {
      width:330px;
      height:35px;
      border:1px solid purple; 
   }
   section textarea {
      width:330px;
      height:100px;
      border:1px solid purple;
   }
   section div {
      margin-top:30px;
   }
  </style>
</head>
<body>
   <section>
    <form method="post" action="custom_ok">
      <h3> 고객의 소리 </h3>
      <div> <input type="text" name="title" placeholder="제목"> </div>
      <div> <textarea name="content" placeholder="내용"></textarea> </div>
      <div> <input type="submit" value="등록"> </div>
     </form>
   </section>
</body>
</html>





