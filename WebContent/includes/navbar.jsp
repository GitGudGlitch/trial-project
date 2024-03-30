<%@page import="noodles.connection.DbCon" %>
<%@page import="noodles.dao.userDao" %>
<%@page import="noodles.model.*" %>
<%@page import="java.util.*" %>

<% userDao us = new userDao(DbCon.getConnection());
//	List <user> hName = us.userLogin//%>

<nav class="navbar navbar-expand-lg bg-success">
 <div>
    	<img src="images/LOGO1.png" height=40 width=100 style="border-radius:5px">
    </div>
  <div class="container-fluid">
    <a class="navbar-brand text-light" href="index.jsp" ><b>GAMENIAC</b></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
   
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link text-light" aria-current="page" href="index.jsp"><b>Home</b></a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link text-light" href="cart.jsp"><b>Cart</b><span class="badge badge-danger px-1">${ cart_list.size() }</span></a>
        </li>
        <% 
        if(auth !=null){%>
         		<li class="nav-item "><a class="nav-link text-light" href="orders.jsp"><b>user</b></a></li>
        	  <li class="nav-item "><a class="nav-link text-light" href="orders.jsp"><b>library</b></a></li>
              <li class="nav-item "><a class="nav-link text-light" href="log-out"><b>Logout</b></a></li>
        
        <% }else{%>
        	 <li class="nav-item"><a class="nav-link text-light" href="login.jsp"><b>Login</b></a></li>
        	 <li class="nav-item"><a class="nav-link text-light" href="register.jsp"><b>Register</b></a></li>
       <%}
        %>
              
                     
      </ul>
    </div>
  </div>
</nav>