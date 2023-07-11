package controller.servelts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.Statement;

import controller.dbconnection.DbConnection;
import resources.MyConstants;

/**
 * Servlet implementation class BuyProducts
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/BuyProducts" })
public class BuyProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyProducts() {
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
		
		//getting values from form of addcart.jsp
		int user_id = Integer.parseInt(request.getParameter("id"));
		
		//Initializing
		Connection con = null;
		PreparedStatement stm = null;
		PreparedStatement statement = null;
		PreparedStatement statement2 = null;
		PreparedStatement statement3 = null;
		
		try {
			//getting connection
			con = DbConnection.getConnection();
			
			//getting user cart details
			String sql = MyConstants.USER_CART;
			stm = con.prepareStatement(sql);
			stm.setInt(1, user_id);
			//storing in resultset
			ResultSet rs = stm.executeQuery();
			
			//insting query and statement for instering cart item to order
			String sql1 = MyConstants.INSERT_ORDER;
			statement = con.prepareStatement(sql1);
			
			//deleting items from cart that have been bought
			String sql2 = MyConstants.DELETE_FROM_CART;
			statement2 = con.prepareStatement(sql2);
			
			String sql3="UPDATE product SET product_stock=product_stock-? WHERE product_id = ?";
			statement3 = con.prepareStatement(sql3);
		
			
			//initializing
			int rowsInserted = 0;
			int rowsDeleted = 0;
			
			//extracting each row from rs
			while (rs.next()) {
			   
				//getting values from row
			    int u_id = rs.getInt("user_id");
			    int productid = rs.getInt("product_id");
			    int qty = rs.getInt("quantity");
			    int price = rs.getInt("price");
			    int rating = rs.getInt("rating");
			    
			    //inserting values into query
			    statement.setInt(1, u_id);
			    statement.setInt(2, productid);
			    statement.setInt(3, qty);
			    statement.setInt(4, price);
			    statement.setInt(5, rating);
			    
			    //executing query
			    if (qty>0) {
			    rowsInserted += statement.executeUpdate();
			    
			    //adding values to query 
			    statement2.setInt(1,user_id);
			    statement2.setInt(2, productid);

			    statement3.setInt(1, qty);
			    statement3.setInt(2,productid);
			
			    //executing query
			    rowsDeleted += statement2.executeUpdate();
			    
			    statement3.executeUpdate();
			
			
			//checking if data has been inserted or not
			if (rowsInserted > 0 && rowsDeleted >0) {
			    String contextPath = request.getContextPath();
			    String requestURL = contextPath + "/pages/mycart.jsp";
			    //redirecting to mycart
			    response.sendRedirect(requestURL);
			} else {
				String contextPath = request.getContextPath();
			    String requestURL = contextPath + "/pages/mycart.jsp";
			    //redirecting to mycart
			    response.sendRedirect(requestURL);
				}
			}else {
				String contextPath = request.getContextPath();
			    String requestURL = contextPath + "/pages/mycart.jsp";
			    //redirecting to mycart
			    response.sendRedirect(requestURL);
				}
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
