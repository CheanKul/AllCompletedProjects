package com.example.dell.mapapp;

import android.app.Activity;
import android.content.Intent;
import android.location.Address;
import android.location.Geocoder;
import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.maps.model.LatLng;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;


public class MainActivity extends Activity {
    LatLng latLng;
    Geocoder g;
    SQLHandler dbHandler;
    TextView text_address;
    EditText title, message, act_date;
    public Button saveButton;
    String address;
    Double latitude, longitude;
    public static String dt;
    int id = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        g = new Geocoder(getApplicationContext(), Locale.getDefault());
        title = (EditText) findViewById(R.id.title);
        message = (EditText) findViewById(R.id.message);
        act_date = (EditText) findViewById(R.id.act_date);
        text_address = (TextView) findViewById(R.id.address);
        saveButton = (Button) findViewById(R.id.saveButton);
        dbHandler = new SQLHandler(this, null, null, 2);
        dt = null;

        Bundle b1 = getIntent().getExtras();
        if (b1 != null) {
            Log.d("mesage", "In if b1");
            int record_id = b1.getInt("record_id");
            Log.d("record_id", record_id + "");
            if (record_id != 0) {
                Location location = dbHandler.getRecord(record_id);
                title.setText(location.getTitle());
                message.setText(location.getMessage());
                text_address.setText(location.getAddress());
                dt = location.getDate();
                act_date.setText(dt);

                latitude = Double.parseDouble(location.getLatitude());
                longitude = Double.parseDouble(location.getLongitude());
                id = location.get_id();
                Log.d("date", location.getDate());
            } else {
                Log.d("mesage", "In else b");
                Bundle b = getIntent().getBundleExtra("bundle");
                latLng = b.getParcelable("lat");
                try {
                    address = g.getFromLocation(latLng.latitude, latLng.longitude, 1).iterator().next().getAddressLine(0);
                    latitude = latLng.latitude;
                    longitude = latLng.longitude;
                    text_address.setText(address);

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        act_date.setShowSoftInputOnFocus(false);


        act_date.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, DatePickerActivity.class);
                startActivity(i);
            }
        });
        saveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String dt = act_date.getText().toString();
                String msg = message.getText().toString();
                String text_title = title.getText().toString();
                if (text_title.isEmpty() || msg.isEmpty()) {
                    Toast.makeText(getApplicationContext(), "Please fill the title and description...", Toast.LENGTH_LONG).show();
                } else {

                    Location location = new Location(id, text_title, latitude + "", longitude + "", address, msg, dt,"0");
                    boolean result = dbHandler.addNewLocation(id, location);
                    Toast.makeText(getApplicationContext(), "saveButtonClicked " + result, Toast.LENGTH_LONG).show();
                    printLocationList();

                    Intent intent_Service = new Intent(MainActivity.this, GPS_Services.class);
                    startService(intent_Service);

                    Intent i = new Intent(MainActivity.this, StartActivity.class);
                    startActivity(i);

                }

            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();

        Toast.makeText(getApplicationContext(), "date: " + dt, Toast.LENGTH_SHORT);
        act_date.setText(dt);
    }

    public void printLocationList() {
        int i = 0;

        ArrayList<Location> list = dbHandler.printDatabaseValues();
        while (i < list.size()) {
            Log.d("sql data ", list.get(i).getMessage());
            i++;
        }
    }
}