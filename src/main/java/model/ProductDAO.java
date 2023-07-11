package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import controller.dbconnection.DbConnection;

public class ProductDAO {
    private Connection con;

    public ProductDAO(Connection con) {
        this.con = con;
    }

    // method to get list of products from database
    public List<AdminProducts> getAllProducts() throws SQLException {
        List<AdminProducts> productList = new ArrayList<AdminProducts>();
        String sql = "SELECT product_id, product_name, product_desc, price, product_stock, p_image FROM product";
        try (Statement stm = con.createStatement();
             ResultSet rs = stm.executeQuery(sql)) {
            while (rs.next()) {
            	AdminProducts product = new AdminProducts();
            	product.setId(rs.getInt("product_id"));
            	product.setName(rs.getString("product_name"));
        		product.setDesc(rs.getString("product_desc"));
        		product.setPrice(rs.getInt("price"));
        		product.setStock(rs.getInt("product_stock"));
        		product.setImageUrlFromString(rs.getString("p_image"));
        		productList.add(product);
            }
        }
        return productList;
    }

    	//method to get product from database
		public AdminProducts getProductDatabase(int id)  throws SQLException, ClassNotFoundException {
			try {
				Connection conn = DbConnection.getConnection();
				PreparedStatement stm = null;
			    ResultSet rs = null;
			    AdminProducts productData = null;
			    
			    try {
			        stm = conn.prepareStatement("SELECT product_id,product_name,p_image, product_desc, price, product_stock FROM product WHERE product_id = ?");
			        stm.setInt(1, id);
			        rs = stm.executeQuery();

			        if (rs.next()) {
			            // Map the ResultSet to a ProductDAO object
			            productData = new AdminProducts();
			            productData.setId(rs.getInt("product_id"));
			            productData.setName(rs.getString("product_name"));
			            productData.setDesc(rs.getString("product_desc"));
			            productData.setPrice(rs.getInt("price"));
			            productData.setStock(rs.getInt("product_stock"));
			            productData.setImage(rs.getString("p_image"));
			        }
			    } finally {
			        // Close the ResultSet, PreparedStatement, and Connection objects
			        if (rs != null) {
			            rs.close();
			        }
			        if (stm != null) {
			            stm.close();
			        }
			        if (conn != null) {
			            conn.close();
			        }
			    }

			    return productData;
			    }
			finally {}
	}

		//method to update product
public boolean updateProduct(int productId, String productName, String productDesc, int price, int productStock) throws SQLException {
    boolean rowUpdated;
    String sql = "UPDATE product SET product_name = ?, product_desc = ?, price = ?, product_stock = ? WHERE product_id = ?";
    try (PreparedStatement stm = con.prepareStatement(sql)) {
        stm.setString(1, productName);
        stm.setString(2, productDesc);
        stm.setInt(3, price);
        stm.setInt(4, productStock);
        stm.setInt(5, productId);

        rowUpdated = stm.executeUpdate() > 0;
    }
    return rowUpdated;
}

    // method to delete a product from the database
    public boolean deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE product_id=?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected == 1;
        }
    }
    
    //method ot get product quantity from cart
    public int getProductQuantityFromCart(int pId, int cId) throws SQLException{
    	String sql = "SELECT * FROM cart WHERE product_id = ? AND user_id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, pId);
            stmt.setInt(2, cId);
           ResultSet rowsAffected = stmt.executeQuery();
            if(rowsAffected.next()) {
            	int qty = rowsAffected.getInt("quantity");
            	return qty;
            }else {
            	return (Integer) null;
            }
        }
    	
    }
    
    //method to add products
    public int updateAddProducts(int qty, int pId) throws SQLException{
    	String sql = "UPDATE product SET product_stock = product_stock + ? WHERE product_id = ?";
    	try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, qty);
            stmt.setInt(2, pId);
           int rowsAffected = stmt.executeUpdate();
           return rowsAffected;
        }
    }
    
    // method to update reduce procuts
    public int updateReduceProducts(int qty, int pId) throws SQLException{
    	String sql = "UPDATE product SET product_stock = product_stock - ? WHERE product_id = ?";
    	try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, qty);
            stmt.setInt(2, pId);
           int rowsAffected = stmt.executeUpdate();
           return rowsAffected;
        }
    }
    
    //method to update cart
    public int updateCart(int cId, int pId, int qty, int total) throws SQLException {
    	String sql = "UPDATE cart SET quantity = ?, total = ? WHERE user_id = ? AND product_id = ?";
    	try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, qty);
            stmt.setInt(2, total);
            stmt.setInt(3, cId);
            stmt.setInt(4, pId);
            int rowsAffected = stmt.executeUpdate();
           return rowsAffected;
        }
    	
    }
    
    //method to remove cart
    public int removeCart(int pId, int cId) throws SQLException {
    	String sql = "DELETE FROM cart WHERE product_id = ? AND user_id = ?";
    	try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, pId);
            stmt.setInt(2, cId);
            int rowsAffected = stmt.executeUpdate();
           return rowsAffected;
        }
    	
    	}

	public int addStock(int id, int qty) throws SQLException {
		String sql = "UPDATE product SET product_stock = product_stock + ? WHERE product_id= ?";
    	try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, qty);
            stmt.setInt(2, id);
            int rowsAffected = stmt.executeUpdate();
           return rowsAffected;
        }
    	
    	}
	
}

	
    


    
    