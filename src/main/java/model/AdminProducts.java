package model;

import java.io.File;

import javax.servlet.http.Part;

import resources.MyConstants;

public class AdminProducts {
	//defining variables
    private int id;
    private String name;
    private String desc;
    private int price;
    private int stock;
    private String image;
    private String brand;
    private String category;
    private String imageUrlFromPart;
    
    

    public AdminProducts() {
		// TODO Auto-generated constructor stub
	}
   
    //getter and setter method
	public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDesc() { return desc; }
    public void setDesc(String desc) { this.desc = desc; }
    
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
    
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    
    public String getImageUrlFromPart() {return imageUrlFromPart;}
	public void setImageUrlFromPart(Part part) {this.imageUrlFromPart = getImageUrl(part);}
	
	public String getImageUrlFromString() {return image;}
	public void setImageUrlFromString(String image) {this.image = image;}

	public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
	
    
    //getting image url
	private String getImageUrl(Part part) {
		String savePath = MyConstants.PRODUCT_IMAGE_DIR_SAVE_PATH;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if(imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart= "download.png";
		}
		return imageUrlFromPart;
	}
}
