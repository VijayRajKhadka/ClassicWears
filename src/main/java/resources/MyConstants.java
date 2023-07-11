package resources;

import java.io.File;

public class MyConstants {
	
	//database requirement configuration
	public static final String DRIVERNAME="com.mysql.jdbc.Driver";
	public static final String DB_URL="jdbc:mysql://localhost:3306/classicwears";
	public static final String DB_USER_NAME="root";
	public static final String DB_USER_PASSWORD="";
	
	public static final String IMAGE_DIR = "xampp\\tomcat\\webapps\\images\\";
	public static final String IMAGE_DIR_SAVE_PATH = "C:" + File.separator + IMAGE_DIR;
	
	public static final String PRODUCT_IMAGE_DIR = "xampp\\tomcat\\webapps\\images\\product\\";
	public static final String PRODUCT_IMAGE_DIR_SAVE_PATH = "C:" + File.separator + PRODUCT_IMAGE_DIR;
	public static final String PRODUCT_IMAGE_URL = "http://localhost:8080/images/product/";
	
	public static final String CART_INSERT="INSERT INTO cart (user_id, product_id,quantity, price, rating,total) VALUES (?, ?,?, ?, ?, ?)";
	
	public static final String USER_CART = "Select * from cart where user_id=?";
	public static final String INSERT_ORDER= "INSERT INTO orders (user_id, product_id, quantity, price, rating) VALUES (?, ?, ?, ?, ?)";
	public static final String DELETE_FROM_CART="DELETE FROM cart where user_id=? and product_id=?";
	
	public static final String USER_PASSWORD="SELECT password FROM user WHERE user_id=?";
	public static final String UPDATE_USER= "UPDATE user SET username=?, password=?, address=? WHERE user_id=?";

	public static final String PRODCUT_INSERT= "INSERT INTO product (product_name, product_desc, price, product_stock, product_brand,p_image, product_category) VALUES (?, ?, ?, ?, ?, ?,?)";
	public static final String USER_SELECT= "Select * from user where user_id=?";
	public static final String USER_INSERT= "INSERT INTO user (username,user_id,password,image,address) VALUES (?,?, ?, ?, ?)";
	
	public static final String ORDER_SELECT= "SELECT order_id, user_id, product_id, quantity, price, rating FROM orders";
	public static final String USER_DETAILS="SELECT user_id, username, address, image FROM user";
	
	public static final String PRODUCTS="SELECT product_id, product_name, product_desc, price, product_stock,product_brand,p_image, product_category FROM product";
	
}
