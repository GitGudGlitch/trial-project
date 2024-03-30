package noodles.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noodles.connection.DbCon;
import noodles.dao.RegDao;
import noodles.model.reg;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/user-register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("register.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter())
		{
			String email =request.getParameter("reg-email");
			String password =request.getParameter("reg-password");
			String password1=request.getParameter("reg-password1");
			String name= request.getParameter("reg-name");
			
				try {
					reg regModel = new reg();
					regModel.setName(name);
					regModel.setEmail(email);
					regModel.setPassword(password);
					
					RegDao rdao = new RegDao(DbCon.getConnection()) ;
				
					boolean ruser = rdao.userReg(regModel);
					  
					response.sendRedirect("login.jsp");
			
				} catch (ClassNotFoundException | SQLException e) {
				
					e.printStackTrace();
				}
			
			
			
		}
	}

}
