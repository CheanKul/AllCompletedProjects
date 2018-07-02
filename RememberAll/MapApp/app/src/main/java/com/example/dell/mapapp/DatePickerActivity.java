package com.example.dell.mapapp;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.format.DateUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.Toast;

import java.util.Calendar;
import java.util.Date;

public class DatePickerActivity extends Activity {

    DatePicker datePicker;
    Button doneButton;
    Activity date_activity;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_date_picker);
        datePicker = (DatePicker) findViewById(R.id.datePicker);
        doneButton = (Button) findViewById(R.id.doneButton);
        date_activity = this;
/*
        DisplayMetrics dm=new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getRealMetrics(dm);
*/

        Calendar cal = Calendar.getInstance();
        datePicker.setMinDate(cal.getTime().getTime());

        cal.add(Calendar.MONTH, 12);
        Date newDt = cal.getTime();
        datePicker.setMaxDate(cal.getTime().getTime());

        doneButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Intent i=new Intent(DatePickerActivity.this,MainActivity.class);
                String day = "" + datePicker.getDayOfMonth();
                String month = "" +( datePicker.getMonth()+1);
                String year = "" + datePicker.getYear();
                String text_date = day + "/" + month + "/" + year;
                MainActivity.dt = text_date;
                // i.putExtra("date",Date);
                //Toast.makeText(getApplicationContext(), day + "/" + month + "/" + year, Toast.LENGTH_LONG);
                date_activity.finish();
                //startActivity(i);
            }
        });
    }

}
