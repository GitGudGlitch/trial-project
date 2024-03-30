<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.*" %>
	<%@page import="noodles.model.*" %>
		   <%
    User auth = (User) request.getSession().getAttribute("auth");

    
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register page</title>
<%@include file="includes/head.jsp"%>
<%@include file="includes/navbar.jsp"%>
</head>
<body style="background-color:#111">


	<div class="container" >
		<div class="card w-50 mx-auto my-5" style="background-color:grey">
			<div class="card-header text-center bg-danger"><b>Register Form</b></div>
			<div class="card-body">
				<form action="user-register" method="post">
				
				<div class="form-group">
						<label>Name</label> <input type="text"
							class="form-control" name="reg-name" placeholder="Enter your name"
							required>
					</div>

					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="reg-email"
							placeholder="Enter your email" required>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="reg-password" placeholder="******"
							required>
					</div>
					<div class="form-group">
						<label>Confirm Password</label> <input type="password"
							class="form-control" name="reg-password1" placeholder="******"
							required>
					</div>
					
	
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Register</button>
					</div>


				</form>
			</div>
		</div>

	</div>
	<%@include file="includes/foot.jsp"%>
</body>
</html>