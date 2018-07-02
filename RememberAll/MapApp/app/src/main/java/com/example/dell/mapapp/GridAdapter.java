package com.example.dell.mapapp;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.zip.Inflater;

public class GridAdapter extends BaseAdapter {

    public ArrayList<Location> list;
    Context context;
    View view;
    Location loc;
    LayoutInflater inflater;


    public GridAdapter(Context context) {
        this.context=context;
        list = new ArrayList<>();
        SQLHandler handler = new SQLHandler(context, null, null, 1);
        list = handler.printDatabaseValues();
    }

    @Override
    public int getCount() {
        return list.size();
    }

    @Override
    public Object getItem(int position) {
        return list.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        View gridView = convertView;

        if(convertView == null){
            inflater=(LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            gridView=inflater.inflate(R.layout.single_grid,null);
        }

        TextView text=(TextView)gridView.findViewById(R.id.textView2);

        loc=new Location();
        loc=list.get(position);

        text.setText(loc.getAddress());

        return gridView;

    }
}