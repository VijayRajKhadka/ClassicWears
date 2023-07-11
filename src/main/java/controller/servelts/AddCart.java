package controller.servelts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnection;
import model.AdminProducts;
import model.ProductDAO;
import resources.MyConstants;

/**
 * Servlet implementation class AddCart
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AddCart" })
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = DbConnection.getConnection();
			String action = request.getParameter("action");
			String id = request.getParameter("id");
			response.setContentType("text/html");
			ProductDAO dao = new ProductDAO(con);
			int ID = Integer.parseInt(id);
			if (action != null && !action.isEmpty()) {
				try {
					AdminProducts data = dao.getProductDatabase(ID);
					request.setAttribute("product", data);
					RequestDispatcher dispatcher = request.getRequestDispatcher("pages/addcart.jsp");
					dispatcher.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				} finally {
					if (con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
			}
			}
			} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
}
	
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id= Integer.parseInt(request.getParameter("id"));
		int qty= Integer.parseInt(request.getParameter("qty"));
		int userId= Integer.parseInt(request.getParameter("userId"));
		int rate= Integer.parseInt(request.getParameter("rating"));
		int price= Integer.parseInt(request.getParameter("price"));
		int stock= Integer.parseInt(request.getParameter("stock"));

		Connection con = null;
        PreparedStatement stm = null;
        PreparedStatement stm1 = null;
		
		try {
            con = DbConnection.getConnection();
            String sql = MyConstants.CART_INSERT;
            stm = con.prepareStatement(sql);
            int total= price*qty;
            
			String sql2="UPDATE product SET product_stock=? WHERE product_id = ?";
			stm1 = con.prepareStatement(sql2);
			
            if (qty<=stock) {
            stm.setInt(1, userId );
            stm.setInt(2, id);
            stm.setInt(3, qty);
            stm.setInt(4, price);
            stm.setInt(5, rate);
            stm.setInt(6, total);
            
            int updated_stock= stock-qty;
            stm1.setInt(1, updated_stock);
            stm1.setInt(2, id);
            stm1.executeUpdate();
            
            int rowsInserted = stm.executeUpdate();
            if (rowsInserted > 0) {
            	String contextPath = request.getContextPath();
                String requestURL = contextPath + "/home.jsp";
                response.sendRedirect(requestURL);
            } else {
                response.getWriter().println("Product creation failed");
            	}
            }
            else {
            	request.setAttribute("morethanstock","Quantity More than Stock (Re_Enter)");
				RequestDispatcher include = request.getRequestDispatcher("/home.jsp");
				include.include(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            response.getWriter().println("Failed due to: " + e.getMessage());
        } finally {
            try {
                if (stm != null) stm.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		
		doGet(request, response);
	}

}
