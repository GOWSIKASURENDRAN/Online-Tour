package sevices;

import java.sql.*;
import java.util.*;

import com.mysql.jdbc.Statement;

import model.Customer;
import model.Package;
import utils.DBconnect;

public class packageService {

    // Method to register a package (already provided)
	public void regPackage(Package p)
	{
		try {
			String query = "INSERT INTO package (package_name, package_description, package_price, package_imageurl) VALUES ('"
				    + p.getPackage_name() + "', '"
				    + p.getPackage_description() + "', "
				    + p.getPackage_price() + ", '"
				    + p.getPackage_imageurl() + "')";

			//change (statement)
			Statement statement = (Statement) DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	// method to get data from database only one data
	public  Package getPackageone(Package p)
	{
		try {
			String query = "select * from package where package_name = '"+p.getPackage_name()+"' and package_description ='"+p.getPackage_description()+"' and package_price ='"+p.getPackage_price()+"' and Package_imageurl ='"+p.getPackage_imageurl()+"' ";
			Statement statement = (Statement) DBconnect.getConnection().createStatement();
			ResultSet rs =statement.executeQuery(query);
			
			if(rs.next())
			{
				p.setPackage_name(rs.getString("package_name"));
				p.setPackage_description(rs.getString("package_description"));
				p.setPackage_price(rs.getDouble("package_price"));
				p.setPackage_imageurl(rs.getString("package_imageurl"));
				return p;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//method show full data
	public ArrayList<Package> getAllPackage()
	{
		try {
			ArrayList<Package> listPackage = new ArrayList<>();
			String query = "select * from package";
			Statement statement = (Statement) DBconnect.getConnection().createStatement();
			ResultSet rs =statement.executeQuery(query);
			while(rs.next())
			{
				Package p = new Package();
				p.setId(rs.getInt("id"));
				p.setPackage_name(rs.getString("package_name"));
				p.setPackage_description(rs.getString("package_description"));
				p.setPackage_price(rs.getDouble("package_price"));
				p.setPackage_imageurl(rs.getString("package_imageurl"));
				listPackage.add(p);
			}
			return listPackage;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	//update package
    public void updatePackage(Package p) {
        try {
            String query = "UPDATE package SET package_name=?, package_description=?, package_price=?, package_imageurl=? WHERE id=?";
            PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
            stmt.setString(1, p.getPackage_name());
            stmt.setString(2, p.getPackage_description());
            stmt.setDouble(3, p.getPackage_price());
            stmt.setString(4, p.getPackage_imageurl());
            stmt.setInt(5, p.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //delete package
    public void deletePackage(int id) {
        try {
            String query = "DELETE FROM package WHERE id = ?";
            PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


	}


	
	
	

