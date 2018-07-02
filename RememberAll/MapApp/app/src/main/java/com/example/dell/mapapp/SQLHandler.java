package com.example.dell.mapapp;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import java.util.ArrayList;

public class SQLHandler extends SQLiteOpenHelper {
    final static String DATABASE_NAME = "LocationNotifier.db";
    final static String TABLE_NAME = "location";
    final static String _ID = "_id";
    final static String TITLE = "title";
    final static String LATITUDE = "latitude";
    final static String LONGITUDE = "longitude";
    final static String ADDRESS = "address";
    final static String MESSAGE = "message";
    final static String DoneFlag = "done_flag";
    final static String ACTIVITY_DATE = "date";
    static int srno = 1;


    public SQLHandler(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, DATABASE_NAME, factory, 2);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String query = "CREATE TABLE " + TABLE_NAME + " ( " + _ID + " INTEGER PRIMARY KEY AUTOINCREMENT , "
                + TITLE + " TEXT ,"
                + LATITUDE + " TEXT , "
                + LONGITUDE + " TEXT , "
                + ADDRESS + " TEXT , "
                + MESSAGE + " TEXT , "
                + DoneFlag + " TEXT , "
                + ACTIVITY_DATE + " DATE );";
        db.execSQL(query);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }


    public boolean addNewLocation(int id, Location location) {

        if (id == 0) {

            ContentValues values = new ContentValues();
            values.put(TITLE, location.getTitle());
            values.put(LATITUDE, location.getLatitude());
            values.put(LONGITUDE, location.getLongitude());
            values.put(ADDRESS, location.getAddress());
            values.put(MESSAGE, location.getMessage());
            values.put(ACTIVITY_DATE, location.getDate());
            values.put(DoneFlag,"0");
            SQLiteDatabase db = getWritableDatabase();
            long result = db.insert(TABLE_NAME, null, values);
            db.close();
            if (result > 0) {
                return true;
            } else {
                return false;
            }
        } else {
            String qry = "UPDATE " + TABLE_NAME + " SET " +
                    " title=        \' "      + location.getTitle()   + "\' ,   " +
                    " message=      \' "      + location.getMessage() + "\' ,   " +
                    " date=         \'"       + location.getDate()    + "\' ,   " +
                    " done_flag= '0' " +
                    " where _id =   \'"       + id                    + "\'     ;";

            SQLiteDatabase db = getWritableDatabase();
            db.execSQL(qry);
            db.close();
            return true;
        }
    }

    public void deleteLocation(MyLatLang loc) {
        SQLiteDatabase db = getWritableDatabase();
        db.execSQL("DELETE FROM " + TABLE_NAME + " WHERE latitide = \"" + loc.latitude + "\" and longitude = \"" + loc.longitude + "\";");
        db.close();
    }


    public void deleteById(int id) {
        SQLiteDatabase db = getWritableDatabase();
        Log.d("delete by id ===",""+id);
        db.execSQL("DELETE FROM " + TABLE_NAME + " WHERE _id= \'" + id + "\' ;");
        db.close();
    }


    public ArrayList<Location> printDatabaseValues() {
        ArrayList<Location> list = new ArrayList<>();
        Location location;
        SQLiteDatabase db = getWritableDatabase();
        String query = "SELECT * FROM " + TABLE_NAME + " where 1;";
        Cursor c = db.rawQuery(query, null);
        c.moveToFirst();
        while (!c.isAfterLast()) {
            location = new Location(c.getInt(c.getColumnIndex("_id")),
                    c.getString(c.getColumnIndex("title")),
                    c.getString(c.getColumnIndex("latitude")),
                    c.getString(c.getColumnIndex("longitude")),
                    c.getString(c.getColumnIndex("address")),
                    c.getString(c.getColumnIndex("message")),
                    c.getString(c.getColumnIndex("date")),
                    c.getString(c.getColumnIndex("done_flag")));
            c.moveToNext();
            list.add(location);
        }
        db.close();
        c.close();
        return list;
    }

    public ArrayList<Location> getDatabaseValues() {

        ArrayList<Location> list = new ArrayList<>();
        Location location;
        SQLiteDatabase db = getWritableDatabase();
        String query = "SELECT * FROM " + TABLE_NAME + " ORDER BY _id DESC;";
        Cursor c = db.rawQuery(query, null);
        c.moveToFirst();
        while (!c.isAfterLast()) {
            location = new Location(c.getInt(c.getColumnIndex("_id")),
                    c.getString(c.getColumnIndex("title")),
                    c.getString(c.getColumnIndex("latitude")),
                    c.getString(c.getColumnIndex("longitude")),
                    c.getString(c.getColumnIndex("address")),
                    c.getString(c.getColumnIndex("message")),
                    c.getString(c.getColumnIndex("date")),
                    c.getString(c.getColumnIndex("done_flag")));
            c.moveToNext();
            list.add(location);

        }
        db.close();
        c.close();
        return list;
    }


    public ArrayList<MyLatLang> getLatlng() {
        ArrayList<MyLatLang> list = new ArrayList<MyLatLang>();

        SQLiteDatabase db = getWritableDatabase();
        String query = "SELECT latitude,longitude FROM " + TABLE_NAME + " where done_flag = '0';";
        Cursor c = db.rawQuery(query, null);
        c.moveToFirst();
        Log.d("inside","sqlhandler getLatlng");
        int i =0;
        while (!c.isAfterLast()) {
            MyLatLang latLang = new MyLatLang();
            latLang.setLatitude(Double.parseDouble(c.getString(c.getColumnIndex("latitude"))));
            latLang.setLongitude(Double.parseDouble(c.getString(c.getColumnIndex("longitude"))));
            Log.d("latlang "+i,latLang.getLatitude()+" "+latLang.getLongitude());
            list.add(latLang);
            for(int j=0;j< list.size();j++)
            {
                Log.d("database values loop sql "+j+"\t",list.get(j).getLatitude()+"/"+list.get(j).getLongitude());
            }
            Log.d("database values loop sql123 "+i+"\t",list.get(i).getLatitude()+"/"+list.get(i).getLongitude());
            i++;
            c.moveToNext();
        }
        db.close();
        c.close();
        for(int j=0;j< list.size();j++)
        {
            Log.d("database values loop sql "+j+"\t",list.get(j).getLatitude()+"/"+list.get(j).getLongitude());
        }
        return list;

    }

    public String getTask(MyLatLang latLang) {
        ArrayList<String> list = new ArrayList<>();
        SQLiteDatabase db = getWritableDatabase();
        Log.d("","Latitude=="+latLang.getLatitude()+"  Longitude=="+latLang.getLongitude());
        String query = "SELECT message FROM " + TABLE_NAME + " where latitude = '" + latLang.getLatitude() + "' and longitude= '" + latLang.getLongitude() + "';";
        Cursor c = db.rawQuery(query, null);
        c.moveToFirst();

        String task = c.getString(c.getColumnIndex("message"));
        Log.d("task",task);
        return task;
    }

    public Location getRecord(int id)
    {
        SQLiteDatabase db = getWritableDatabase();
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE _id = "+id+" ;";
        Cursor c = db.rawQuery(query, null);
        c.moveToFirst();
        Location location = new Location(c.getInt(c.getColumnIndex("_id")),
                c.getString(c.getColumnIndex("title")),
                c.getString(c.getColumnIndex("latitude")),
                c.getString(c.getColumnIndex("longitude")),
                c.getString(c.getColumnIndex("address")),
                c.getString(c.getColumnIndex("message")),
                c.getString(c.getColumnIndex("date")),
                c.getString(c.getColumnIndex("done_flag")));

        return location;
    }

    public void setDoneFlag(int id)
    {
        SQLiteDatabase db = getWritableDatabase();
        String query = "UPDATE "+TABLE_NAME+" SET done_flag=1 WHERE _id= "+id+" ;" ;
        db.execSQL(query);
    }
}

