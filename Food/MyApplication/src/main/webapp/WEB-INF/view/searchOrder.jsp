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
  background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(../Images/bg.jpg) no-repeat;
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
</style>
</head>
<body><center><h1> Food Application</h1></center><br>
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
<div class ="d">
<center>
  <form action="../../user/searchOrderOpr" method="post">
<div class="inputBox">
      <input type="text" name="search_order" required value="${search_Order}"
             onkeyup="this.setAttribute('value', this.value);"placeholder="Search for Order....">
    
   		<input type="submit" name="searchOrder" value="Search Order">
   		</div>
 	</form>
 	</center>
 	 </div>
 	 </div>
<div class ="x">
   <c:if test="${SearchRes.isEmpty()}">
 	 <c:if test="${msg!=null}"><center>
 	${msg} <b>${search_key}</b></center></c:if>
 	</c:if>
 	
 	<c:if test="${!SearchRes.isEmpty()}"><center>
 	 Search Results for <b>${search_key}</center></br>
 	<center>
 	<table>
		<tr>
		<th> Order_Id</th>
			<th>dishName</th>
			<th>dish Image</th>
			<th>Quantity</th>
			<th>price</th>
			<th>Billing Details</th>
			<th>Date of Order</th>
			<th> Mode of Payment</th>
		</tr>
		<c:forEach var="Item" items="${SearchRes}">
			<tr>
			<td> ORD${Item.order_id}</td>
				<td>${Item.dish_name }</td>
				<td><img src="../Images/${Item.dish_img}" alt="noimg" border=3 height=100 width=100/></td>
				<td>${Item.quantity }</td>
				<td>${Item.price }</td>
				<td><b>${Item.user_name}<br></b>
				${Item.email}<br>${Item.ph_number}<br>${Item.address}<br>
				</td>
				<td>${Item.date_of_order}</td>
				<td>${Item.mode_of_payment}</td>
			</tr>
		</c:forEach>
	</table></center></c:if>
 	
 </div>
</body>
</html>