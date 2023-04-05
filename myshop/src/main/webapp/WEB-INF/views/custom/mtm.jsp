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
    section input[type=text] {
      width:330px;
      height:35px;
      border:1px solid purple; 
   }
 
   section textarea{
     width::330px;
     height:100px;
     border:1px solid purple;
   }
   section div{
      margin-top:30px;
   }
  </style> 
</head>
<body>
  <section>
     <h3>1:1 상담하기</h3> 
     <form method="post" action="mtm_ok">
     <div> <input type="text" name="title" placeholder="상담 제목"></div>
     <div> <textarea name="content"></textarea></div>
     <div> <input type="submit" value="질문 등록"></div>
    </form>
  </section>
</body>
</html>