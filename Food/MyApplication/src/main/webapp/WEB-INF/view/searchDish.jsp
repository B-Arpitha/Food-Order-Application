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
  <a href="/user/userHomePage">Home</a><c:if test="${msg1!=null}">
<a href="/user/searchDish">Search For Dish</a>
<a href="/user/searchOrder">Search For Order</a>
<a href ="/user/viewCart">Cart</a>
<a href="../../../user/myOrder">My Order</a>
<a href="../../../../../../user/logout">Logout</a>
</c:if>
<c:if test="${msg1==null}">
<a href="../../../../../../login">Login</a>
</c:if>
<br>
</div>
<div class ="d">
<center>
 <form action="../../user/searchDishOpr" method="post">
      <input type="text" name="search_dish" required value="${search_dish}"
             onkeyup="this.setAttribute('value', this.value);" placeholder="Search for Dish....">
            <input  type="submit" name="searchDish" value="Search Dish">
 </form>
 </center>
 </div>
 <div class ="x">
   <c:if test="${SearchRes.isEmpty()}">
 	 <c:if test="${msg!=null}"><center>
 	${msg} <b>${search_key}</b></center></c:if>
 	</c:if>
 	<c:if test="${!SearchRes.isEmpty()}">
 	<center> Search Results for <b>${search_key}</center></b><br>
 	 <center>
 	<table>
		<tr>
			<th>dishName</th>
			<th>dish Image</th>
			<th>price</th>
			<th>ingredients</th> 
			<th>Add to Cart</th>
			
		</tr>
		<c:forEach var="Item" items="${SearchRes}">
			<tr>
				<td>${Item.dishName }</td>
				<td><img src="../Images/${Item.dish_img}" alt="noimg" border=3 height=100 width=100/></td>
				<td>${Item.price }</td>
				<td>${Item.ingredients }</td> 
				<td>
   				<Form action="../../user/addwithQuant/${Item.dishName}" method="post">
			   	<button>Add to Cart</button></Form>
   				</td>	
			</tr>
		</c:forEach>
	</table></center></c:if>
 	</div>
 </div>
</body>
</html>