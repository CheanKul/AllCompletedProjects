using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class ViewPatient : System.Web.UI.Page
{
    SqlConnection con;
    ConnectionDAO c;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

        SqlCommand cmd = new SqlCommand("SELECT Patient.id, Patient.name, Timeslot.date, timeslot_tab.timeslot FROM Patient INNER JOIN Timeslot ON Patient.id = Timeslot.pid INNER JOIN timeslot_tab ON Timeslot.timeslotid = timeslot_tab.id WHERE (Timeslot.did = " + Session["did"] + ")", con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            GridView1.DataSource = rdr;
            GridView1.DataBind();
        }
        else
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "No Data Found...!";
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["Patientid"] = Convert.ToInt32(TextBox1.Text);
        Response.Redirect("~/ShowPatDetToDoc.aspx");
    }
}