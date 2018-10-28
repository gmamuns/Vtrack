package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.RegistrationModel;


/**
 *
 * @author mamuns
 */

public class RegistrationDao {

    String driver = null;
    String url = null;
    String user = null;
    String password = null;
    Connection con = null;

    public RegistrationDao() {
    }
    
    
    
    public RegistrationDao(String driver, String url, String user, String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
    }

    private Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    }

    //ok
    public int save(RegistrationModel e) {
        int status = 0;
        try {
            con = getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO users (first_name, last_name, email, uname, pass, geolocation, apikey, regdate, status) VALUES (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, e.getFname());
            ps.setString(2, e.getLname());
            ps.setString(3, e.getEmail());
            ps.setString(4, e.getUname());
            ps.setString(5, e.getPass());
            ps.setString(6, e.getGeolocation());
            ps.setString(7, e.getApikey());

            //timestamp 
            java.util.Date date = new java.util.Date();
            java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
            ps.setTimestamp(8, timestamp);
            ps.setString(9, "0"); // default status false

            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    //running
    public List<RegistrationModel> getAllAfectedAreaData() {
        List<RegistrationModel> list = new ArrayList<RegistrationModel>();

        try {
            con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where status=1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RegistrationModel e = new RegistrationModel();
                e.setId(rs.getInt(1));
                e.setFname(rs.getString(2));
                e.setLname(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setUname(rs.getString(5));
                e.setPass(rs.getString(6));
                e.setGeolocation(rs.getString(7));
                e.setApikey(rs.getString(8));
                e.setRegdate(rs.getTimestamp(9));
                list.add(e);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //ok
    public Boolean editStatus(String status, String uname) {
        try {

            con = getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("update users set status=?"
                    + "where uname=?");
            //UPDATE users SET status=1 WHERE uname = 'ymamuns';

            preparedStatement.setString(1, status);
            preparedStatement.setString(2, uname);
            preparedStatement.executeUpdate();
            con.close();
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //ok
    public RegistrationModel getDataByUname(String uname) {
        con = getConnection();
        RegistrationModel e = new RegistrationModel();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from users where uname=?");
            preparedStatement.setString(1, uname);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                e.setId(rs.getInt(1));
                e.setFname(rs.getString(2));
                e.setLname(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setUname(rs.getString(5));
                e.setPass(rs.getString(6));
                e.setGeolocation(rs.getString(7));
                e.setApikey(rs.getString(8));
                e.setRegdate(rs.getTimestamp(9));
                e.setStatus(rs.getString(10));

            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return e;
    }

    // ok
    public int editByUname(RegistrationModel e) {
        try {

            con = getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("update users set first_name=?,last_name=?,email=?,pass=?,geolocation=?"
                    + "where uname=?");

            preparedStatement.setString(1, e.getFname());
            preparedStatement.setString(2, e.getLname());
            preparedStatement.setString(3, e.getEmail());
            preparedStatement.setString(4, e.getPass());
            preparedStatement.setString(5, e.getGeolocation());

            preparedStatement.setString(6, e.getUname());
            preparedStatement.executeUpdate();
            con.close();
            return 1;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        }
    }

    //ok
    public void deleteByAPI(String apikey) {
        try {
            con = getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("delete from users where apikey=?");

            preparedStatement.setString(1, apikey);
            preparedStatement.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    

}
