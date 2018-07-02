package com.example.dell.mapapp;

import java.util.Date;

public class Location {

    private int _id;
    private String title;
    private String latitude;
    private String longitude;
    private String address;
    private String message;
    private String date;
    private String done_flag;

    public Location() {

    }

    public Location(int _id, String title, String latitude, String longitude, String address, String message, String date, String done_flag) {
        this._id = _id;
        this.title = title;
        this.latitude = latitude;
        this.longitude = longitude;
        this.address = address;
        this.message = message;
        this.date = date;
        this.done_flag = done_flag;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setDone_flag(String done_flag) {
        this.done_flag = done_flag;
    }



    public int get_id() {
        return this._id;
    }

    public String getTitle() {
        return this.title;
    }

    public String getLatitude() {
        return this.latitude;
    }

    public String getLongitude() {
        return this.longitude;
    }

    public String getAddress() {
        return this.address;
    }

    public String getMessage() {
        return this.message;
    }

    public String getDate() {
        return this.date;
    }

    public String getDone_flag() {
        return done_flag;
    }
}
