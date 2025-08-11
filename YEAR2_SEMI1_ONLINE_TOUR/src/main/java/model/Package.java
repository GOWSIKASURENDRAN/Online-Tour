package model;

public class Package {
	private int id;
	private String package_name;
    private String package_description;
    private double package_price;
    private String package_imageurl;
    
    
	
	
    public Package() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



    public String getPackage_name() {
        return package_name;
    }

    public void setPackage_name(String package_name) {
        this.package_name = package_name;
    }

    public String getPackage_description() {
        return package_description;
    }

    public void setPackage_description(String package_description) {
        this.package_description = package_description;
    }

    public double getPackage_price() {
        return package_price;
    }

    public void setPackage_price(double package_price) {
        this.package_price = package_price;
    }

    public String getPackage_imageurl() {
        return package_imageurl;
    }

    public void setPackage_imageurl(String package_imageurl) {
        this.package_imageurl = package_imageurl;
    }
}
