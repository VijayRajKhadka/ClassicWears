package controller.servelts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnection;
import model.AdminProducts;
import model.ProductDAO;
import resources.MyConstants;

/**
 * Servlet implementation class InsertProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/InsertProduct" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		try {
			con = DbConnection.getConnection();
			ProductDAO dao = new ProductDAO(con);
			List<AdminProducts> products = dao.getAllProducts();
			request.setAttribute("products", products);
			request.getRequestDispatcher("pages/admin/pages/editproducts.jsp").include(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
		
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//HttpServletRequest object to retrieve the form parameter values
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("pname");
		String desc = request.getParameter("desc");
		int price = Integer.parseInt(request.getParameter("price"));	
		int stock = Integer.parseInt(request.getParameter("stock"));
		String brand = request.getParameter("brand");
		String category = request.getParameter("shoes");
		Part imagePart = request.getPart("p_image");
		
		AdminProducts product = new AdminProducts();
		product.setName(name);
		product.setDesc(desc);
		product.setPrice(price);
		product.setStock(stock);
		product.setBrand(brand);
		product.setCategory(category);
		product.setImageUrlFromPart(imagePart);
		
		String savePath = MyConstants.PRODUCT_IMAGE_DIR_SAVE_PATH;
	    String fileName = product.getImageUrlFromPart();
	    if(!fileName.isEmpty() && fileName != null)
    		imagePart.write(savePath + fileName);
		
		Connection con = null;
        PreparedStatement stm = null;
        
        try {
            con = DbConnection.getConnection();
            String sql = MyConstants.PRODCUT_INSERT;
            stm = con.prepareStatement(sql);
            stm.setString(1, product.getName());
            stm.setString(2, product.getDesc());
            stm.setInt(3, product.getPrice());
            stm.setInt(4, product.getStock());
            stm.setString(5, product.getBrand());
            stm.setString(6, product.getImageUrlFromPart());
            stm.setString(7, product.getCategory());
            
           
             int rowsInserted = stm.executeUpdate();
            if (rowsInserted > 0) {
            	String contextPath = request.getContextPath();
                String requestURL = contextPath + "/pages/admin/pages/editproducts.jsp";
                response.sendRedirect(requestURL);
            } else {
                response.getWriter().println("Product creation failed");
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
