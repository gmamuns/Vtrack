package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.VtrackModel;
import model.WeatherModel;

public class VtrackDao {

    String driver = null;
    String url = null;
    String user = null;
    String password = null;
    Connection con = null;

    public VtrackDao(String driver, String url, String user, String password) {
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
    public int save(VtrackModel e) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO vtrack(vid, uname, lcode, lat, lon, regdate)  values (?,?,?,?,?,?)");
           
            ps.setString(1, e.getVid());
            
            ps.setString(2, e.getUname());
            ps.setString(3, e.getLcode());
            ps.setString(4, e.getLat());
            ps.setString(5, e.getLon());
            //timestamp 
            java.util.Date date = new java.util.Date();
            java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
            ps.setTimestamp(6, timestamp);

            status = ps.executeUpdate();

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    //ok
    public  List<VtrackModel> getAllData() {
        List<VtrackModel> list = new ArrayList<VtrackModel>();

        try {
            con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from vtrack ORDER BY regdate DESC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VtrackModel e = new VtrackModel();
                //`id`, `vid`, `uname`, `lcode`, `lat`, `lon`, `regdate`
                e.setVid(rs.getString(2));
                e.setUname(rs.getString(3));
                e.setLcode(rs.getString(4));
                e.setLat(rs.getString(5));
                e.setLon(rs.getString(6));
                e.setRegdate(rs.getTimestamp(7));
                list.add(e);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    

    //running
    public  List<VtrackModel> getAllDataByUname(String userid) {
        List<VtrackModel> list = new ArrayList<VtrackModel>();

        try {
            con = getConnection();
           // PreparedStatement ps = con.prepareStatement("select * from vtrack uname = "+userid+" ORDER BY regdate DESC");
           PreparedStatement ps = con.prepareStatement("SELECT * FROM `vtrack` where uname = '"+userid+"' ORDER BY regdate DESC" );
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VtrackModel e = new VtrackModel();
                //`id`, `vid`, `uname`, `lcode`, `lat`, `lon`, `regdate`
                e.setVid(rs.getString(2));
                e.setUname(rs.getString(3));
                e.setLcode(rs.getString(4));
                e.setLat(rs.getString(5));
                e.setLon(rs.getString(6));
                e.setRegdate(rs.getTimestamp(7));
                list.add(e);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    } 
}
