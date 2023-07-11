package controller.servelts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.dbconnection.DbConnection;
import model.PasswordEncryptionWithAes;
import resources.MyConstants;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/EditProfile" })
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//getting values from edit form
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("username");
		String add = request.getParameter("address");
		String o_pass = request.getParameter("old_pass");
		String n_pass= request.getParameter("new_pass");
		
		//Initialzing
		Connection con = null;
        PreparedStatement stm = null;
        PreparedStatement stm1 = null;
        
        try {
        	//creating connection
            con = DbConnection.getConnection();
            //query for getting passoword of user
            String query = MyConstants.USER_PASSWORD;
            stm = con.prepareStatement(query);
            stm.setString(1, String.valueOf(id));
            ResultSet rs = stm.executeQuery();
            //getting user item
            if (rs.next()) {
            	//getting password value
                String passwordDb = rs.getString("password");
                //decrypting password
                String decryptedPwd = PasswordEncryptionWithAes.decrypt(passwordDb, String.valueOf(id));
                //checking if entered password and database password matches.
                if (decryptedPwd != null && decryptedPwd.equals(o_pass)) {
                	
                	//query for updating user values
                    String update_query = MyConstants.UPDATE_USER;
                    stm1 = con.prepareStatement(update_query);
                    stm1.setString(1, name);
                    //encrypting password and setting into query
                    stm1.setString(2, PasswordEncryptionWithAes.encrypt(String.valueOf(id),n_pass));
                    stm1.setString(3, add);
                    stm1.setInt(4, id);
                    
                    //executing query
                    int rowsUpdated = stm1.executeUpdate();

                    //checking if inserted into database
                    if (rowsUpdated > 0) {
                    	String contextPath = request.getContextPath();
        			    String requestURL = contextPath + "/home.jsp";
        			    //redirecting to home jsp
        			    response.sendRedirect(requestURL);
                    } else {
                    	//setting attribute and redirecting to editprofile
                        request.setAttribute("UpdateFailed", "Profile Updation Failed !");
                        request.getRequestDispatcher("/pages/editprofile.jsp").forward(request, response);
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            response.getWriter().println("Failed due to: " + e.getMessage());
        } finally {
            try {
                if (stm != null) stm.close();
                if (stm1 != null) stm1.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
}