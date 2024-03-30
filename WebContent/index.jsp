<%@page import="noodles.connection.DbCon" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>
<%@page import="noodles.dao.ProductDao" %>
<%@page import="noodles.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null)
    {
    	request.setAttribute("auth", auth);
    }
    
    ProductDao pd= new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();
    
    ProductDao spd= new ProductDao(DbCon.getConnection());
    List<Product> sproducts = pd.getSlides();
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list !=null)
    {
    	request.setAttribute("cart_list",cart_list);
    }
    
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<title>Gameniac</title>
<%@include file="includes/head.jsp" %>

<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}


/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition:  0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>

</head>
<body style=" background-color:#111;">

<%@include file="includes/navbar.jsp" %>

<div class="container">
	<div class="card-header my-4 bg-dark text-primary" ><b>All Games</b></div>
	
	
	//trial slide
				
				<div class="slideshow-container">
				<% int i=1;
		if(!sproducts.isEmpty())
		{ 
			for(Product sp:sproducts){ i++;%>
				

<div class="mySlides">
  <img src="images/<%=sp.getImage() %>" height="600" style="width:100%">
  <a class="btn btn-success" href=""><%=sp.getName() %></a>
</div>
<%}
		}
	%>


<a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a>

</div>

<div style="text-align:center">
<%
	for(int i1=1;i1<i;i1++){ %>
  <span class="dot" onclick="currentSlide(<%=i1%>)"></span> 
  <%} %>
</div>


<script>
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
				
				//trial
	
	
	<div class="row" >
	<%
		if(!products.isEmpty())
		{
			for(Product p:products){%>
				
			
			
				<div class="col-md-4 my-3" >
				<div class="card w-100 bg-dark" style="width: 18rem;" >
	  				<img class="card-img-top" height="300" width="400" src="images/<%= p.getImage() %>" alt="Card image cap">
	 				 <div class="card-body">	
	   					 <h5 class="card-title text-primary" ><%= p.getName() %></h5>
	   					 <h6 class="price text-info">Price: $<%= p.getPrice() %></h6>
	   					 <h6 class="category text-info">Category: <%= p.getCategory() %></h6>
	   					 <div class="mt-2 d-flex justify-content-between">
	   						 <a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-success">Add to Cart</a>
	   					 	 <a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Buy Now</a>
	                     </div>
	                 </div>
		         </div>
	         </div>
			<%}
		}
	%>
		
    </div>
</div>

<%@include file="includes/foot.jsp" %>
</body>
</html>