<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.d {
  top: 50%;
  left: 50%;
  padding: 2.5rem;
}
.x {
  top:10rem;
  left: 50%;
  padding: 2.5rem;
}
.d input[type="text"]
{
  outline: none;
  width : 60%;
  padding: 0.625rem 1.25rem;
  cursor: pointer;
  border-radius: 0.312rem;
  font-size: 1rem;
  background-color: white;
  
}

.d input[type="submit"] {
  border: none;
  outline: none;
  color: white;
  background-color: black;
  padding: 0.625rem 1.25rem;
  cursor: pointer;
  border-radius: 0.312rem;
  font-size: 1rem;
}

.d input[type="submit"]:hover {
  background-color: #1cb1f5;
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
  table {
  max-width: 100%;
  align-content: center;
}

tr{
  background-color: #eee;
}

th {
  background-color: #555;
  color: #fff;
}
body{
  margin:0;
  padding: 0;
  background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(../../Images/bg.jpg) no-repeat;
  background-size: cover;
  color: black;
  font-family: sans-serif;
  
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
th,
td {
  text-align: left;
  padding: 0.5em 1em;
  width:"1000";
  
}
svg{
	color: black;
}
svg:hover {
  color: blue;
  font-weight: bold;
  }
</style>
</head>
<body>
<center><h1> Food Application</h1></center><br>
<div>
 <div class="topnav">
  <a href="/user/userHomePage">Home</a>
<a href="/user/searchDish">Search For Dish</a>
<a href="/user/searchOrder">Search For Order</a>
<a href ="/user/viewCart">Cart</a>
<a href="../../../user/myOrder">My Order</a>
<a href="../../../../../../user/logout">Logout</a>
<br>
</div>
<div class="bg">
	<center><br><br>
	<table>
		<tr>
			<th>Dish Name</th>
			<th> Dish Image </th>
			<th>Quantity</th>
			<th>Price</th>
		</tr>
		<tr>
			<td>${list.dishName}</td>
			<td><img src="${path}${list.dish_img}" alt="${list.dishName}" border=3 height=100 width=100/></td>
			<td>
				<form action="../../../user/addToCart/${list.dishName}" method="post">
			<div class="inputBox">
   			   <input type="number" name="quantity" required value="${quantity}"
             onkeyup="this.setAttribute('value', this.value);"placeholder=" Enter Quantity"  min="1" max="${list.availableQuantity}">
    <br><br>
   			<p style="color:blue;">Available Quantity = ${list.availableQuantity}</p>
	        </td>
			<td>${list.price}</td>
		</tr>
		<tr><td colspan="4"><center><input type="submit" name="quantity" value="Add To Cart"></center></td></tr>
   		</div>
 	</form>
	</table>
	</center>
	</div>
</div>
</body>
</html>