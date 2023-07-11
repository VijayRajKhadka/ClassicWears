package controller.servelts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnection;
import model.AdminProducts;
import model.ProductDAO;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateProduct" })
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
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
		    	if (action.equals("edit")) {
		    	    try {
		    	        AdminProducts data = dao.getProductDatabase(ID);
		    	        request.setAttribute("product", data);
		    	        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/admin/pages/editform.jsp");
		    	        dispatcher.forward(request, response);
		    	    } catch (ClassNotFoundException e) {
		    	        e.printStackTrace();
		    	    } catch (SQLException e) {
		    	        e.printStackTrace();
		    	    }
		    	} else if (action.equals("del")) {
		    		dao.deleteProduct(ID);
		    	    response.sendRedirect("pages/admin/pages/editproducts.jsp");
		        }
		    }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			 Connection con = DbConnection.getConnection();
		        String id = request.getParameter("id");
		        String name = request.getParameter("name");
		        String desc = request.getParameter("description");
		        String price = request.getParameter("price");
		        String stock = request.getParameter("stock");

		        AdminProducts product = new AdminProducts();
		        int Price = Integer.parseInt(price);
		        int Stock = Integer.parseInt(stock);
		        int ID = Integer.parseInt(id);
		        product.setId(ID);
		        product.setName(name);
		        product.setDesc(desc);
		        product.setPrice(Price);
		        product.setStock(Stock);

		        ProductDAO dao = new ProductDAO(con);
		        dao.updateProduct(ID,name,desc,Price,Stock);
		        
		        response.sendRedirect(request.getContextPath() + "/pages/admin/pages/editproducts.jsp");
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
}
}
