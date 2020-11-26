<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Dish List</title>
<style>
body, html {
  height: 100%;
  margin: 0;
    font-weight: 700;
}

.bg {
  /* The image used */
  background-image: url("https://us.123rf.com/450wm/somegirl/somegirl1905/somegirl190500067/124098149-authentic-indian-dishes-and-snacks.jpg?ver=6");
opacity: 0.8;
  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
   background-attachment: variable;
}

h1{
color:White;
text-align:center;

}

.fill-table {
 background-color: #D5D8DC;
}

.dishDisplay{
text-align:center;
}

.btn-primary {
    color: #fff;
    background-color: black;
    border-color: black;
}
a{
color:black;
text-decoration:none;
background-color:transparent;
}
</style>
</head>
<body style="background-color: lightgrey;">
<div class="bg">
	<h1>Menu details</h1>
	<table border="2" cellpadding="2" cellspacing="2" class="fill-table" align="center" border-style="border">
		<tr>
			<th class="dishDisplay">dishName</th>
			<th class="dishDisplay"> Dish image </th>
			<th class="dishDisplay">availableQuantity</th>
			<th class="dishDisplay">price</th>
			<th class="dishDisplay">ingredients</th>
			<th class="dishDisplay">dateOfUpdation</th>
			<th class="dishDisplay">Edit</th>
			<th class="dishDisplay"> Delete </th>
		</tr>
		<c:forEach var="Item" items="${Items}">
			<tr>
				<td class="dishDisplay">${Item.dishName}</td>
				<td class="dishDisplay"><img src="${path}${Item.dish_img}" alt="${Item.dishName}" border=3 height=100 width=100/></td>
				<td class="dishDisplay">${Item.availableQuantity}</td>
				<td class="dishDisplay">${Item.price}</td>
				<td class="dishDisplay">${Item.ingredients}</td>
				<td class="dishDisplay">${Item.dateOfUpdation}</td>
				<td class="dishDisplay"><a href="/edit/${Item.dishName}/${Item.availableQuantity}/${Item.price}/${Item.ingredients}"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
					  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg></a></td>
				<td class="dishDisplay"><a href="/delete/${Item.dishName}"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
					</svg>
				</a></td>
			</tr>
		</c:forEach>
	</table>
<a href="/AdminInterfacePage" class="btn btn-primary"style="width:10%">Back</a>
</div>
</body>
</html>