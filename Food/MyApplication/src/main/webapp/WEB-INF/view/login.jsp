<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>
 <style>
body{
  margin:0;
  padding: 0;
  background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(https://images.squarespace-cdn.com/content/v1/51223e33e4b0b5151b74d581/1461074134506-FRHQYXO9D3I9FAFBMZOO/ke17ZwdGBToddI8pDm48kHWflsBVlXzikFqfj0JVAG0UqsxRUqqbr1mOJYKfIPR7bPjVvospn8apiEHRoKkKBhW0e1aWgdm6xdow3DZNd_kic-L2IOPH3Dwrhl-Ne3Z2ZfHLKp81hT4G3a5Glnm7rMSpWfQP_Wwpq8FdrTlODVsbq_pQtFqHzdGAdcBYPmVt/photogrpahy-food-bermuda-portrait-lifestyle-CHOP+FUSION-0888-2.jpg?format=2500w) no-repeat;
  background-size: cover;
  color: black;
  font-family: sans-serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

table{
position:absolute;
top:200px;
left:120px;
color:white;
font-size:20px;
}
td
{
}
.box {
  position:absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 25rem;
  padding: 2.5rem;
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.6);
  border-radius: 0.625rem;
}

h1,h2{
color:black;
}
button:hover {
  opacity: 0.8;
}
button {
  background-color: skyblue;
  color: Blue;
  padding: 12px 18px;
  margin: 2px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
input[type=text], input[type=password] {
  width: 100%;
  padding: 8px 16px;
  margin: 2px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}



.box h2 {
  margin: 0 0 1.875rem;
  padding: 0;
  color: #fff;
  text-align: center;
}

.box .inputBox {
  position: relative;
}

.box .inputBox input {
  width: 100%;
  padding: 0.625rem 0;
  font-size: 1rem;
  color: #fff;
  letter-spacing: 0.062rem;
  margin-bottom: 1.875rem;
  border: none;
  border-bottom: 0.065rem solid #fff;
  outline: none;
  background: transparent;
}

.box .inputBox label {
  position: absolute;
  top: 0;
  left: 0;
  padding: 0.625rem 0;
  font-size: 1rem;
  color: #fff;
  pointer-events: none;
  transition: 0.5s;
}

.box .inputBox input:focus ~ label,
.box .inputBox input:valid ~ label,
.box .inputBox input:not([value=""]) ~ label {
  top: -1.125rem;
  left: 0;
  color: #03a9f4;
  font-size: 0.75rem;
}

.box input[type="submit"] {
  border: none;
  outline: none;
  color: white;
  background-color: black;
  padding: 0.625rem 1.25rem;
  cursor: pointer;
  border-radius: 0.312rem;
  font-size: 1rem;
}

.box input[type="submit"]:hover {
  background-color: #1cb1f5;
}



.login-img img {
  height: 10%;
  width: 100%;
  background-size: cover;
 
}

.row {
  margin-right: 0px;
}
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
a{
  color: #ADF875;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: White;
  font-weight: bold;
  background-color: transparent;
}
a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}
</style>
</head>
<body>
     <div class="topnav">
  <a href="/welcomepage">Home</a>
  <a href="/user/userHomePage">View as a Guest</a>
</div>
<div class="row">
  
<div class="box">

  <h2>Login</h2>
  <form action="../../validateuser" method="post">
  <tr>
		<td colspan="2"><c:if test="${message!=null}">
			<font color="red">${message}</font><br><br>
		</c:if></td>
	</tr>
    <div class="inputBox">
      <input type="text" name="user_id"  onkeyup="this.setAttribute('value', this.value);" required value="${ user_table.user_id}">
      <label>User Id</label>
    </div>
    <div class="inputBox">
      <input type="password" name="password" required value="${user_table.password}"
             onkeyup="this.setAttribute('value', this.value);">
      <label>Password</label>
    </div>
   <center> <input type="submit" name="sign-in"  value="Sign In"></center>
 	</form>
 	<br><center><a href="/register"> New user?? Sign Up!!</a></center>
 	</div></div>

</body>
</html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>

table{
position:absolute;
top:200px;
left:120px;
color:white;
font-size:20px;
}
td
{
}
.box {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 25rem;
  padding: 2.5rem;
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.6);
  border-radius: 0.625rem;
}

h1,h2{
color:black;
}
button:hover {
  opacity: 0.8;
}
button {
  background-color: skyblue;
  color: Blue;
  padding: 12px 18px;
  margin: 2px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
input[type=text], input[type=password] {
  width: 100%;
  padding: 8px 16px;
  margin: 2px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
body {
  margin: 0;
  padding: 0;
  background-size: cover;
  font-family: sans-serif;
}

.box {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 25rem;
  padding: 2.5rem;
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.6);
  border-radius: 0.625rem;
}

.box h2 {
  margin: 0 0 1.875rem;
  padding: 0;
  color: #fff;
  text-align: center;
}

.box .inputBox {
  position: relative;
}

.box .inputBox input {
  width: 100%;
  padding: 0.625rem 0;
  font-size: 1rem;
  color: #fff;
  letter-spacing: 0.062rem;
  margin-bottom: 1.875rem;
  border: none;
  border-bottom: 0.065rem solid #fff;
  outline: none;
  background: transparent;
}

.box .inputBox label {
  position: absolute;
  top: 0;
  left: 0;
  padding: 0.625rem 0;
  font-size: 1rem;
  color: #fff;
  pointer-events: none;
  transition: 0.5s;
}

.box .inputBox input:focus ~ label,
.box .inputBox input:valid ~ label,
.box .inputBox input:not([value=""]) ~ label {
  top: -1.125rem;
  left: 0;
  color: #03a9f4;
  font-size: 0.75rem;
}

.box input[type="submit"] {
  border: none;
  outline: none;
  color: white;
  background-color: black;
  padding: 0.625rem 1.25rem;
  cursor: pointer;
  border-radius: 0.312rem;
  font-size: 1rem;
}

.box input[type="submit"]:hover {
  background-color: #1cb1f5;
}

</style>
</head>
<body>

<div class="box">
  <h2>Login</h2>
  <form action="validateuser" method="post" modelAttribute="user">
  <tr>
		<td colspan="2"><c:if test="${message!=null}">
			<font color="red">${message}</font><br><br>
		</c:if></td>
	</tr>
    <div class="inputBox">
      <input type="number" name="user_id"  onkeyup="this.setAttribute('value', this.value);" required value="${ user_table.user_id}">
      <label>User Id</label>
    </div>
    <div class="inputBox">
      <input type="password" name="password" required value="${ user_table.password}"
             onkeyup="this.setAttribute('value', this.value);">
      <label>Password</label>
    </div>
   <center> <input type="submit" name="sign-in" value="Sign In"></center>
 	</form></div>
<div>
  <center> <font color="black"><h1><a href="/register">New User?? Sign Up Now</a></h1></font></center></div>
  <div>
  <center><font color="black"><h1><a href="/user/userHomePage">View as Guest</a></h1></font></center></body>
  </div>

</html> -->
