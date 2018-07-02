using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataConnection;

public partial class ShowPatDetToDoc : System.Web.UI.Page
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

        

    }

    private void PatientDetails()
    {

        
        SqlCommand cmd = new SqlCommand("select * from patient where id=" + Session["Patientid"] + "", con);
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
        SqlCommand cmd = new SqlCommand("SELECT Timeslot.appoid, Doctor.name, Timeslot.piscription, Timeslot.dnote, Timeslot.date FROM Timeslot INNER JOIN Doctor ON Timeslot.did = Doctor.id WHERE (Timeslot.pid = " + Session["Patientid"] + ")", con);
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

}