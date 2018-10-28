
package model;

import java.sql.Timestamp;


public class WeatherModel {
    private String uname,sensorID,humidity,tempCelsius,tempFahrenheit;
    private String maxHumidity,minHumidity,maxCelsious,minCelsious;
    Timestamp regdate;

    public String getMaxHumidity() {
        return maxHumidity;
    }

    public void setMaxHumidity(String maxHumidity) {
        this.maxHumidity = maxHumidity;
    }

    public String getMinHumidity() {
        return minHumidity;
    }

    public void setMinHumidity(String minHumidity) {
        this.minHumidity = minHumidity;
    }

    public String getMaxCelsious() {
        return maxCelsious;
    }

    public void setMaxCelsious(String maxCelsious) {
        this.maxCelsious = maxCelsious;
    }

    public String getMinCelsious() {
        return minCelsious;
    }

    public void setMinCelsious(String minCelsious) {
        this.minCelsious = minCelsious;
    }


    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    
    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }
    
    

    public String getSensorID() {
        return sensorID;
    }

    public void setSensorID(String sensorID) {
        this.sensorID = sensorID;
    }
    

    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }

    public String getTempCelsius() {
        return tempCelsius;
    }

    public void setTempCelsius(String tempCelsius) {
        this.tempCelsius = tempCelsius;
    }

    public String getTempFahrenheit() {
        return tempFahrenheit;
    }

    public void setTempFahrenheit(String tempFahrenheit) {
        this.tempFahrenheit = tempFahrenheit;
    }
    
    
    
}
