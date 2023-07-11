package controller.servelts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnection;
import model.PasswordEncryptionWithAes;
import model.User;
import resources.MyConstants;


@WebServlet(asyncSupported = true, urlPatterns = { "/UserRegister" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50)
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//getting form values from register page
		String  username = request.getParameter("user");
		String  password = request.getParameter("pass");
		Integer  id = Integer.parseInt(request.getParameter("id"));
		String  address = request.getParameter("address");
		Part imagePart = request.getPart("image");
		
		//making object of model
		User user = new User();
		//setting values into user model setter method
		user.setUsername(username);
		user.setPassword(password);
		user.setId(id);
		user.setAddress(address);
		user.setImageUrlFromPart(imagePart);
		
		//saving image path in tomcat server
	    String savePath = MyConstants.IMAGE_DIR_SAVE_PATH;
	    String fileName = user.getImageUrlFromPart();
	    if(!fileName.isEmpty() && fileName != null)
    		imagePart.write(savePath + fileName);
		
	    
	    //Initializing
	    Connection con = null;
        PreparedStatement stm = null;
        
	    try {
	    	
	    	//getting connection
	    	con = DbConnection.getConnection();
	    	
	    	//defining inserting query
            String insert_query = MyConstants.USER_INSERT;
            stm = con.prepareStatement(insert_query);
            
            //setting values into query
            stm.setString(1, user.getUsername());
            stm.setInt(2, user.getId());
            //encrypting password with id with AES ans setting into query
            stm.setString(3, PasswordEncryptionWithAes.encrypt(
            		String.valueOf(user.getId()), user.getPassword()));
			stm.setString(4, user.getImageUrlFromPart());
			stm.setString(5,user.getAddress());
            
			//executing query
            int rowsInserted = stm.executeUpdate();
            
            //checking if data inserted
            if (rowsInserted > 0) {
            	//setting register successfull message and redirecting to login jsp
            	request.setAttribute("RegisterDone", "Successfully Registerd !");
            	request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            	
            } else {
            	//forwaring into register jsp
            	request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
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


