package controller.servelts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnection;
import model.PasswordEncryptionWithAes;
import model.User;
import resources.MyConstants;


@WebServlet(asyncSupported = true, urlPatterns = { "/UserLogin" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50)
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//getting form data from login
		Integer id = Integer.parseInt(request.getParameter("id"));
		String  password = request.getParameter("pass");
		
		//seting admin user_id as 000
		int admin_id= 000;
		
		//checking for admin credential
		if(id.equals(admin_id)&&password.equals("admin"))
		{
			
			//session creating for admin
			HttpSession session = request.getSession();
			session.setAttribute("ID", String.valueOf(id));
			
			System.out.println(session.getAttribute("ID"));
			//cookie creating for admin
			Cookie cookieId = new Cookie("ID", String.valueOf(id));
			cookieId.setMaxAge(3000);
			response.addCookie(cookieId);
			
			//redirecting to product.jsp
			response.sendRedirect(request.getContextPath() + "/pages/admin/pages/product.jsp");
		}
		else
		{
			//initializing
			Connection con = null;
	        PreparedStatement stm = null;
	        
		    try {
		    	//getting connection
		    	con = DbConnection.getConnection();
		    	
		    	//query for selecting user from user_id
	            String insert_query = MyConstants.USER_SELECT;
	            stm = con.prepareStatement(insert_query);
	            stm.setInt(1,id);
	            
	            //storing rows in resultSet
	            ResultSet result = stm.executeQuery();
	            if(result.next()) {
	            	
	            	//getting rows value 
					int userID = result.getInt("user_id");
					String passwordDb  = result.getString("password");
					String username=result.getString("username");
					String image= result.getString("image");
					
					//decrypting users password
					String decryptedPwd = PasswordEncryptionWithAes.decrypt(passwordDb,String.valueOf(id));
					
						//checking if entered id and password matches database credential
						if(decryptedPwd!=null && userID==id && decryptedPwd.equals(password)) {
							
							//session creating for user
							HttpSession session = request.getSession();
							
							//setting session attributes
							session.setAttribute("ID", String.valueOf(id));
							session.setAttribute("username", username);
							session.setAttribute("image", image);
							
							//cookie creation for user
							Cookie cookieId = new Cookie("ID", String.valueOf(id));
							cookieId.setMaxAge(3000);
							response.addCookie(cookieId);
							//redirecting to home jsp
							request.getRequestDispatcher("/home.jsp").forward(request, response);
						}
	            	else {
	            		//setting and sending invalid msg to login
	            		request.setAttribute("error","Invalid Id or Password");
	            		request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
	            		}
	            }
	            else {
	            	//setting and sending not msg to login
	            	request.setAttribute("notfound","Entered Id is Not Registed");
	            	request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
	            }
	        } catch (SQLException | ClassNotFoundException  e) {
	            response.getWriter().println("Failed due to: " + e.getMessage());
	        } finally {
	            try {
	            	//closing statement and connection
	                if (stm != null) stm.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
		}
	    
}
}

