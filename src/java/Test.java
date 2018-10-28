/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mamuns
 */
public class Test {
    public static void main(String[] args) {
        String lat = "77.77";
        String lon = "66.66";
        String hello = "AT+HTTPPARA=\"URL\",\"163.47.39.66:8080/Vtrack/vtrack/insert.jsp?vid=gsm-1234&uname=zia&lcode=1234&lat="+lat+"&lon="+lon+"\"";
        System.out.println(hello);
        Long longValue = 1483209000000L;
        String dateValue = longValue.toString();
        
        
    }
    
}
