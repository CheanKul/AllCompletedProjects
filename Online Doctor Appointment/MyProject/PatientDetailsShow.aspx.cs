using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using DataConnection;


public partial class PatientDetailsShow : System.Web.UI.Page
{
    ConnectionDAO c;
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

        PatientDetails();


        if (!IsPostBack)
        {
            TableOfPrevApp();
        }

        tab2.Attributes["style"] = "display:none";

    }

    private void PatientDetails()
    {

        int id = Convert.ToInt32(Session["id"].ToString());
        SqlCommand cmd = new SqlCommand("select * from patient where id=" + id + "", con);
        SqlDataReader rdr;
        con.Open();
        rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            Label1.Text = rdr.GetString(1);
            Label2.Text = rdr.GetString(2);
            Label3.Text = rdr.GetString(3);
            Label4.Text = rdr.GetString(4);
            Label5.Text = rdr.GetString(5);
            Label6.Text = rdr.GetString(6);
        }
        con.Close();

    }

  
    public void TableOfPrevApp()
    {
        SqlCommand cmd = new SqlCommand("SELECT Timeslot.appoid, Doctor.name, Timeslot.piscription, Timeslot.dnote, Timeslot.date FROM Timeslot INNER JOIN Doctor ON Timeslot.did = Doctor.id WHERE (Timeslot.pid = " + Convert.ToInt32(Session["id"].ToString()) + ")", con);
        SqlDataReader rdr;
        con.Open();
        rdr = cmd.ExecuteReader();

        if (rdr.Read() == true)
        {

            DataTable dt = new DataTable("Patient Previous Appointments");

            DataColumn Id = new DataColumn("Appointment Id");
            DataColumn DocName = new DataColumn("Doctor Name");
            DataColumn Piscription = new DataColumn("Treatment");
            DataColumn DocNote = new DataColumn("Doctor Note ");
            DataColumn Date = new DataColumn("Appointment Date");
            

            dt.Columns.Add(Id);            
            dt.Columns.Add(DocName);
            dt.Columns.Add(Piscription);
            dt.Columns.Add(DocNote);
            dt.Columns.Add(Date);

            DataRow row;

            do
            {
                row = dt.NewRow();
                row[Id] = rdr[0];
                row[DocName] = rdr[1];                
                row[Piscription] = rdr[2];
                row[DocNote] = rdr[3];
                row[Date] = rdr[4];
            
                dt.Rows.Add(row);
            } while (rdr.Read());

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            tab3.Attributes["style"] = "display:none";
        }
        con.Close();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("update Patient set name='" + TextBox1.Text + "',address='" + TextBox2.Text + "',email='" + TextBox3.Text + "',phone='" + TextBox4.Text + "',mobile='" + TextBox5.Text + "',bloodgrp='" + TextBox6.Text + "' where id=" + Convert.ToInt32(Session["id"]) + "", con);
        con.Open();
        int res = cmd.ExecuteNonQuery();
        if (res == 0)
        {
            Response.Write("Fail To Update");
        }

        tab1.Attributes["style"] = "display:block";
        con.Close();
        PatientDetails();

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    
    protected void Button3_Click(object sender, EventArgs e)
    {

        tab1.Attributes["style"] = "display:none";

        int id = Convert.ToInt32(Session["id"].ToString());
        SqlCommand cmd = new SqlCommand("select * from patient where id=" + id + "", con);
        SqlDataReader rdr;
        con.Open();
        rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            TextBox1.Text = rdr.GetString(1);
            TextBox2.Text = rdr.GetString(2);
            TextBox3.Text = rdr.GetString(3);
            TextBox4.Text = rdr.GetString(4);
            TextBox5.Text = rdr.GetString(5);
            TextBox6.Text = rdr.GetString(6);
        }

        con.Close();

        tab2.Attributes["style"] = "display:block";
    }
}