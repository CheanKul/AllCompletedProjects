using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataConnection;

public partial class RegisterPatient : System.Web.UI.Page
{
    SqlConnection con;
    ConnectionDAO c;
    bool duplicate = false;
    SqlCommand cmd1, cmd2;
    
    public RegisterPatient()
    {
        c = new ConnectionDAO();
        con = c.GetConnection();
    }
    
    protected void Button1_Click1(object sender, EventArgs e)
    {
        cmd2 = new SqlCommand();
        cmd2.CommandText = "select mobile,email from Patient";
        cmd2.Connection = con;
        con.Open();
        SqlDataReader rd = cmd2.ExecuteReader();
  
        while (rd.Read())
        {
            if (rd[0].Equals(PhoneBox.Text))
            {
                duplicate = true;
                break;
            }
            if (rd[1].Equals(EmailBox.Text))
            {
                duplicate = true;
                break;
            }
        }
        rd.Close();

        if (duplicate == false)
        {
            cmd1 = new SqlCommand("insert into Patient(name,address,email,phone,mobile,bloodgrp,username,password) values ('" + NameBox.Text + "','" + AddressBox.Text + "','" + EmailBox.Text + "','" + PhoneBox.Text + "','" + MobileBox.Text + "','" + BloodBox.Text + "','" + UserBox.Text + "','" + PassBox1.Text + "')", con);
            cmd1.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Form Submitted Successfully..";
            
        }
        else
        {
            Response.Redirect("~/LogInPage.aspx");
            con.Close();
            Label9.Text = "Error Occoured";
        }
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        NameBox.Text = " ";
        AddressBox.Text = " ";
        EmailBox.Text = " ";
        PhoneBox.Text = " ";
        MobileBox.Text = " ";
        BloodBox.Text = " ";
        UserBox.Text = " ";
        PassBox1.Text = " ";
        PassBox2.Text = " ";
       
    }
    
}