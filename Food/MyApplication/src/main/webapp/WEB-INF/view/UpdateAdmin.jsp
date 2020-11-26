<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Update Admin page</title>

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
<style>
body, html {
  height: 100%;
  margin: 0;
    font-weight: 700;
}

.bg {
  /* The image used */
  background-image: url("https://s3.envato.com/files/268164584/P4160228.jpg");
opacity: 0.8;
  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

element.style {
}
[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
    cursor: pointer;
}
.btn-primary {
    color: #fff;
    background-color: black;
    border-color: black;
}
</style>
</head>

<body>


<div class="bg">
		<form action="/UpdateAdmin" class="needs-validation" method="POST" novalidate>

			<div class="form-field" align="center">
				<label for="fname" style="color:black">Dish Name  :</label> <input type="text"
					class="form-control" id="dishName" placeholder="Enter dishName"
					name="dishName" style="width: 400px;" required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback"></div>
			</div>
			<div class="form-field" align="center">
				<label for="lname"style="color:black">availableQuantity  :</label> <input type="number"
					class="form-control" id="availableQuantity" placeholder="Enter availableQuantity"
					name="availableQuantity" style="width: 400px;" required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback"></div>
			</div>
			<div class="form-field" align="center">
				<label for="lname" style="color:black">price  :</label> <input type="number"
					class="form-control" id="price" placeholder="Enter price"
					name="price" style="width: 400px;" required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback"></div>
			</div>
			<div class="form-field" align="center">
				<label for="lname" style="color:black">ingredients  :</label> <input type="text"
					class="form-control" id="ingredients" placeholder="Enter ingredients"
					name="ingredients" style="width: 400px;" required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback"></div>
			</div>
			
			<div class="btnDetails" style="margin-top:30px;text-align:center">
				<button type="submit" class="btn btn-primary">Update Item</button>
				<a href="/AdminInterfacePage" class="btn btn-primary"style="width:10%">Cancel</a>
			</div>

		</form>
	</div>

	
	
</body>


</html>