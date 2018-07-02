package com.example.dell.mapapp;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.app.TaskStackBuilder;
import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.IBinder;
import android.support.v7.app.NotificationCompat;
import android.util.Log;

import java.util.ArrayList;


public class GPS_Services extends Service {
    private static final String TAG = "GPSTEST";
    private LocationManager mLocationManager = null;
    private static final int LOCATION_INTERVAL = 1000;
    private static final float LOCATION_DISTANCE = 10f;
    SQLHandler sqlHandler;
    public ArrayList<MyLatLang> list;
    MyLatLang latLang = new MyLatLang();
    public static boolean isServiceRunning = false;

    private class LocationListener implements android.location.LocationListener {
        Location mLastLocation;
        SQLHandler sqlHandler;
        public ArrayList<MyLatLang> list = null;

        public LocationListener(String provider) {
            Log.e(TAG, "LocationListener " + provider);
            mLastLocation = new Location(provider);
        }

        @Override
        public void onLocationChanged(Location location) {
            Log.d("inside","on location changed");
            Log.e(TAG, "onLocationChanged: " + location);
            int i = 0;
            sqlHandler = new SQLHandler(getApplicationContext(), null, null, 1);
            list = sqlHandler.getLatlng();

            if (list != null) {
                Location loc = new Location("");
                for(int j=0;j< list.size();j++)
                {
                    Log.d("database values loop "+j+"\t",list.get(j).getLatitude()+"/"+list.get(j).getLongitude());
                }
                while (i < list.size()) {
                    Log.d("database values "+i+"\t",list.get(i).getLatitude()+"/"+list.get(i).getLongitude());
                    loc.setLatitude(list.get(i).getLatitude());
                    loc.setLongitude(list.get(i).getLongitude());
                    float dis = loc.distanceTo(location);
                    Log.d(TAG, "Distance =" + dis);
                    if (dis < 500) {
                        latLang.setLatitude(list.get(i).getLatitude());
                        latLang.setLongitude(list.get(i).getLongitude());
                        showNotification(latLang);
                    }
                    i++;
                }
            }
            mLastLocation.set(location);
        }

        @Override
        public void onProviderDisabled(String provider) {
            Log.e(TAG, "onProviderDisabled: " + provider);
        }

        @Override
        public void onProviderEnabled(String provider) {
            Log.e(TAG, "onProviderEnabled: " + provider);
        }

        @Override
        public void onStatusChanged(String provider, int status, Bundle extras) {
            Log.e(TAG, "onStatusChanged: " + provider);
        }
    }

    LocationListener[] mLocationListeners = new LocationListener[]{
            new LocationListener(LocationManager.GPS_PROVIDER),
            new LocationListener(LocationManager.NETWORK_PROVIDER)
    };

    @Override
    public IBinder onBind(Intent arg0) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.e(TAG, "onStartCommand");
        super.onStartCommand(intent, flags, startId);
        sqlHandler = new SQLHandler(getApplicationContext(), null, null, 1);
        list = sqlHandler.getLatlng();
        isServiceRunning = true;
        return START_STICKY;
    }

    @Override
    public void onCreate() {
        Log.e(TAG, "onCreate");
        initializeLocationManager();
        try {
            mLocationManager.requestLocationUpdates(
                    LocationManager.NETWORK_PROVIDER, LOCATION_INTERVAL, LOCATION_DISTANCE,
                    mLocationListeners[1]);
        } catch (java.lang.SecurityException ex) {
            Log.i(TAG, "fail to request location update, ignore", ex);
        } catch (IllegalArgumentException ex) {
            Log.d(TAG, "network provider does not exist, " + ex.getMessage());
        }
        try {
            mLocationManager.requestLocationUpdates(
                    LocationManager.GPS_PROVIDER, LOCATION_INTERVAL, LOCATION_DISTANCE,
                    mLocationListeners[0]);
        } catch (java.lang.SecurityException ex) {
            Log.i(TAG, "fail to request location update, ignore", ex);
        } catch (IllegalArgumentException ex) {
            Log.d(TAG, "gps provider does not exist " + ex.getMessage());
        }
    }

    @Override
    public void onDestroy() {
        Log.e(TAG, "onDestroy");
        super.onDestroy();
        if (mLocationManager != null) {
            for (int i = 0; i < mLocationListeners.length; i++) {
                try {
                    mLocationManager.removeUpdates(mLocationListeners[i]);
                } catch (Exception ex) {
                    Log.i(TAG, "fail to remove location listners, ignore", ex);
                }
            }
        }
    }

    private void initializeLocationManager() {
        Log.e(TAG, "initializeLocationManager");
        if (mLocationManager == null) {
            mLocationManager = (LocationManager) getApplicationContext().getSystemService(Context.LOCATION_SERVICE);
        }
    }


    public void showNotification(MyLatLang loc) {
        NotificationCompat.Builder builder = new NotificationCompat.Builder(GPS_Services.this);
        builder.setSmallIcon(R.drawable.logonew);
        builder.setContentTitle("You Reach At Your Destination...");
        builder.setContentText("Your task is to :- " + sqlHandler.getTask(loc));
        Intent intent = new Intent(this, StartActivity.class);
        TaskStackBuilder stackBuilder = TaskStackBuilder.create(this);
        stackBuilder.addParentStack(StartActivity.class);
        stackBuilder.addNextIntent(intent);
        PendingIntent pendingIntent = stackBuilder.getPendingIntent(0, PendingIntent.FLAG_UPDATE_CURRENT);
        builder.setContentIntent(pendingIntent);
        NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        nm.notify(0, builder.build());
        //dbHandler.deleteLocation(loc);
    }

}
