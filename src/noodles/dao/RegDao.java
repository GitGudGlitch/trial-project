package noodles.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import noodles.model.*;



public class RegDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	
	public RegDao(Connection con) {
		   
		this.con = con;
	}
	
	public boolean userReg(reg model)
	{
		boolean result = false;
		try {
		
			query ="insert into users(email,password,name)values(?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1,model.getEmail());
			pst.setString(2,model.getPassword());
			pst.setString(3,model.getName());
			pst.executeUpdate();
			result = true;
			
		
			
	
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.print(e.getMessage());
			
		}
		return result;
		

	}
}
