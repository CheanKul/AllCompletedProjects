package com.example.dell.mapapp;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.view.menu.ExpandedMenuView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.AdapterViewAnimator;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.jar.Manifest;

public class StartActivity extends AppCompatActivity {

    ListView listView;
    TextView textView;
    LocationListAdapter adapter;
    SQLHandler dbHandler;
    Activity activity;
    ArrayList<Location> dataList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_start);
        runtime_permission();

            Intent intent_Service=new Intent(StartActivity.this,GPS_Services.class);
            startService(intent_Service);
        dbHandler = new SQLHandler(this, null, null, 2);
        listView = (ListView) findViewById(R.id.listview);
        dataList = dbHandler.getDatabaseValues();
        adapter = new LocationListAdapter(getApplicationContext(), R.layout.layout_custom_list_view, dataList);
        listView.setAdapter(adapter);
        adapter.notifyDataSetChanged();
        activity = this;

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                LocationListAdapter.item_pos = position;
                LocationListAdapter.ViewHolder viewHolder = (LocationListAdapter.ViewHolder) view.getTag();
                if (viewHolder.address.getVisibility() == View.GONE) {
                   // viewHolder.message.setVisibility(View.VISIBLE);
                    viewHolder.address.setVisibility(View.VISIBLE);
                    viewHolder.act_date.setVisibility(View.VISIBLE);
                } else {
                    //viewHolder.message.setVisibility(View.GONE);
                    viewHolder.address.setVisibility(View.GONE);
                    viewHolder.act_date.setVisibility(View.GONE);
                }
                adapter.notifyDataSetChanged();
            }
        });

        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {

                final int pos = position;
                final View view1 = view;
                LayoutInflater inflater = getLayoutInflater();
                //View view=inflater.inflate(R.layout.layout_custom_dialog1, null);
                AlertDialog.Builder builder = new AlertDialog.Builder(StartActivity.this);
                // builder.setIcon(R.drawable.act_bar);
                //   builder.setCustomTitle(view);
                builder.setTitle("Choose Action ");
                builder.setMessage("Click Edit to change details.");
                //   builder.setIcon(R.drawable.act_bar);
                builder.setNeutralButton("Edit", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        Intent intent =new Intent(activity,MainActivity.class);
                        Bundle data=new Bundle();
                        data.putInt("record_id", dataList.get(pos).get_id());
                        intent.putExtras(data);
                        startActivity(intent);

                       /* Snackbar.make(view1, "Replace with your own action", Snackbar.LENGTH_LONG)
                                .setAction("Action", null).show();*/

                    }
                }).setNegativeButton("Remove", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int arg1) {

                        try {
                            int record_id = dataList.get(pos).get_id();
                            dbHandler.deleteById(record_id);
                            dataList.remove(pos);
                            adapter.notifyDataSetChanged();
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                        dialog.cancel();

                    }
                }).setPositiveButton("Done", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        int record_id = dataList.get(pos).get_id();
                        dbHandler.setDoneFlag(record_id);
                        adapter.notifyDataSetChanged();
                        dialog.cancel();
                    }

                });

                AlertDialog alert = builder.create();
                alert.show();

                return true;
            }
        });

        if (adapter != null) {
            adapter.notifyDataSetChanged();
        }


        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
//                        .setAction("Action", null).show();

                Intent i = new Intent(StartActivity.this, MapsActivity.class);
                startActivity(i);
            }
        });
    }

    public boolean runtime_permission() {
        if (Build.VERSION.SDK_INT >= 23 && ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED
                && ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{android.Manifest.permission.ACCESS_FINE_LOCATION, android.Manifest.permission.ACCESS_COARSE_LOCATION}, 100);
            return true;
        }
        return false;
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (adapter != null) {
            adapter.notifyDataSetChanged();
        }
    }

    @Override
    public void onBackPressed() {
        activity.finish();
    }

}
