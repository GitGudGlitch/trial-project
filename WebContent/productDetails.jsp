<%@page import="noodles.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="noodles.dao.ProductDao" %>
     <%
    User auth = (User) request.getSession().getAttribute("auth");
     
     ProductDao pd= new ProductDao(DbCon.getConnection());
     List<Product> products = pd.getAllProducts();
    %>
    
<!DOCTYPE html>
<html>
<head>
<title>Details</title>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<img src="images/<%=pd.getImage() %>" height="600" style="width:100%">

</body>
</html>