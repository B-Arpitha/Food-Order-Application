<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS --><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

.bg-image {
  /* The image used */
  background-image: url("https://i.pinimg.com/originals/76/89/c5/7689c5513084cd3ae199cec4f9b84af3.jpg");
  
  /* Add the blur effect */
  filter: blur(5px);
  -webkit-filter: blur(5px);
  
  /* Full height */
  height: 100%; 
  
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
 position: relative;
}

/* Position text in the middle of the page/image */
.bg-text {

  color: black;
  font-weight: bold;
  
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  text-align: center;
}

.btn-primary {
color:	#000000;
 font-weight: bold;
     border-color:black;
    background-color:Grey;
}

  

  
</style>
</head>
<body>

    <h1 style="text-align:center">Hi....!!!! Welcome to ABC Restaurant Admin Page</h1>
<div class="bg-image"></div>

    <div class="container">

<div class="bg-text">
<div class="position-absolute top-center"> 
            
		<a href="/updateAdminpage" class="btn btn-primary"style="margin-top:30px;width:30%">Update Dish</a>
            </div> 
	<div class="position-absolute mid-center"> 
            
			<a href="/updatedItemsDetails" class="btn btn-primary" style="margin-top:30px;width:30%">View Dish</a>
            </div> 
		<div class="position-absolute bottom-center"> 
            
			<a href="../../../../../../user/logout" class="btn btn-primary" style="margin-top:30px;width:30%">Logout</a>
            </div> 
  	</div>

</div>




 

</body>
</html>