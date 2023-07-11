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
import javax.servlet.http.HttpSession;

import controller.dbconnection.DbConnection;
import model.ProductDAO;

/**
 * Servlet implementation class EditCart
 */
@WebServlet("/EditCart")
public class EditCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		
		String productIdString = request.getParameter("productId");
		String quantityString = request.getParameter("qty");
		String priceString = request.getParameter("productPrice");
		String userIdString = (String)session.getAttribute("ID");
		String prodStockString = request.getParameter("stock");
		
		int productId = Integer.valueOf(productIdString);
		int quantity = Integer.valueOf(quantityString);
		int price = Integer.valueOf(priceString);
		int userId = Integer.valueOf(userIdString);
		int prodStock = Integer.valueOf(prodStockString);
	
		
		int prevQty = 0;
		Connection conn = null;
		try {
			conn = DbConnection.getConnection();
			ProductDAO dao = new ProductDAO(conn);
			prevQty = dao.getProductQuantityFromCart(productId, userId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(prodStock >= quantity) {
			if(prevQty >= quantity) {
				int qtyDeduct = prevQty - quantity;
				try {
					conn = DbConnection.getConnection();
					ProductDAO dao = new ProductDAO(conn);
					int addProd = dao.updateAddProducts(qtyDeduct, productId);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
			}
		if(prevQty<quantity) {
			int qtyAdded = quantity - prevQty;
			try {
				conn = DbConnection.getConnection();
				ProductDAO dao = new ProductDAO(conn);
				int addProd = dao.updateReduceProducts(qtyAdded, productId);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
	
			
			
			int total = quantity * price;
			try {
				conn = DbConnection.getConnection();
				ProductDAO dao = new ProductDAO(conn);
				int result;
				try {
					result = dao.updateCart(userId, productId, quantity, total);
					if(result > 0) {
						response.sendRedirect(request.getContextPath()+"/pages/mycart.jsp");
					}else {
						RequestDispatcher include = request.getRequestDispatcher("/pages/mycart.jsp");
						include.include(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally{
				if(conn!=null){
					try{
						conn.close();
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
			
				else {
					RequestDispatcher include = request.getRequestDispatcher("/pages/mycart.jsp");
					include.include(request, response);
				}
			}
		}
			else {
				request.setAttribute("morethanstock","Quantity More than Stock (Re_Enter)");
				RequestDispatcher include = request.getRequestDispatcher("/pages/mycart.jsp");
				include.include(request, response);
			}
			
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pId = request.getParameter("productId");
		int qty= Integer.parseInt(request.getParameter("qty"));
		
		HttpSession session = request.getSession(false);
		String userIdString = (String)session.getAttribute("ID");
		Connection conn = null;
		
		try {
			conn = DbConnection.getConnection();
			ProductDAO dao = new ProductDAO(conn);
			int result = dao.removeCart(Integer.valueOf(pId), Integer.valueOf(userIdString));
			
			if(result > 0) {
				int result2 = dao.addStock(Integer.valueOf(pId),qty);
				response.sendRedirect(request.getContextPath()+"/pages/mycart.jsp");
			}else {
				RequestDispatcher include = request.getRequestDispatcher("/pages/mycart.jsp");
				include.include(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}

		
	}

}
}

