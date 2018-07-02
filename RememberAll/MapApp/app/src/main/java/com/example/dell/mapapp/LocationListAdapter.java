package com.example.dell.mapapp;

import android.content.Context;
import android.graphics.Typeface;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Dell on 01-10-2017.
 */

public class LocationListAdapter extends ArrayAdapter<Location> {

    private ArrayList<Location> items;
    public static LayoutInflater inflater = null;
    public static int item_pos;
    int block[];
    Typeface boldFont,regularFont;


    Context context;

    class ViewHolder {
        ImageView icon;
        TextView title;
        TextView message;
        TextView address;
        TextView act_date;
        TextView id;
    }

    public LocationListAdapter(Context context, int ResourceId, ArrayList<Location> items) {

        super(context, ResourceId, items);
        this.items = items;
        this.context = context;
        inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        block = new int[10];
        block[0] = R.drawable.yellow_block;
        block[1] = R.drawable.blue_block;
        block[2] = R.drawable.purple_block;
        block[3] = R.drawable.orange_block;
        block[4] = R.drawable.red_block;
        block[5] = R.drawable.purple_light_block;
        block[6] = R.drawable.pink_block;
        block[7] = R.drawable.green_dark_block;
        block[8] = R.drawable.blue_light_block;
        block[9] = R.drawable.green_block;


    }

    @Nullable
    @Override
    public Location getItem(int position) {
        return items.get(position);
    }

    @Override
    public int getPosition(@Nullable Location item) {
        return super.getPosition(item);
    }

    @Override
    public int getCount() {
        // Log.d("getCount",items.size()+"");
        return items.size();
    }

    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder viewHolder;
        Location data = getItem(position);

        boldFont = Typeface.createFromAsset(context.getAssets(), "RALEWAY_BOLD.OTF");
        regularFont = Typeface.createFromAsset(context.getAssets(), "RALEWAY_REGULAR.OTF");

        if (convertView == null) {
            convertView = inflater.inflate(R.layout.layout_custom_list_view, null);
            viewHolder = new ViewHolder();
            viewHolder.id = (TextView) convertView.findViewById(R.id.record_id);
            viewHolder.icon = (ImageView) convertView.findViewById(R.id.icon);
            viewHolder.title = (TextView) convertView.findViewById(R.id.title);
            viewHolder.message = (TextView) convertView.findViewById(R.id.mesage);
            viewHolder.address = (TextView) convertView.findViewById(R.id.address);
            viewHolder.act_date = (TextView) convertView.findViewById(R.id.date);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        int pos = position % 9;
        viewHolder.icon.setImageResource(block[pos]);

        viewHolder.id.setText(""+data.get_id());
        Log.d("_id===",""+data.get_id());

        viewHolder.title.setTypeface(boldFont);
        viewHolder.message.setTypeface(regularFont);
        viewHolder.address.setTypeface(regularFont);
        viewHolder.act_date.setTypeface(regularFont);


        String title = data.getTitle().substring(0,1).toUpperCase() + data.getTitle().substring(1);
        viewHolder.title.setText(title);
        if(data.getMessage()==null){
            viewHolder.message.setText("-");
        }else {
            viewHolder.message.setText(data.getMessage());
        }
        viewHolder.address.setText(data.getAddress());
        viewHolder.act_date.setText(data.getDate());
        Log.d("position", position + "");
        if (position != LocationListAdapter.item_pos) {
            //viewHolder.message.setVisibility(View.GONE);
            viewHolder.address.setVisibility(View.GONE);
            viewHolder.act_date.setVisibility(View.GONE);
        }
        return convertView;
    }
}
