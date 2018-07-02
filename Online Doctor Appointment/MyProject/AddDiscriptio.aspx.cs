using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class AddDiscriptio : System.Web.UI.Page
{
    SqlConnection con;
    ConnectionDAO c;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();
        if (!IsPostBack)
        {
            tab2.Attributes["style"] = "display:none";
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select Patient.name from Patient,Timeslot where  Patient.id = Timeslot.pid and Timeslot.appoid=" + Convert.ToInt32(TextBox1.Text) + "", con);
        con.Open();

        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            Label1.Text = rdr[0].ToString();
        }

        con.Close();
        tab2.Attributes["style"] = "display:block";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("update Timeslot set piscription='" + TextBox2.Text + "', dnote='" + TextBox3.Text + "' where appoid=" + Convert.ToInt32(TextBox1.Text) + "", con);
        con.Open();
        int res = cmd.ExecuteNonQuery();
        if (res == 0)
        {
            Label2.ForeColor = System.Drawing.Color.Red;
            Label2.Text = "Update Cannot Done.....!";
        }
        else
        {
            Label2.ForeColor = System.Drawing.Color.GreenYellow;
            Label2.Text = "Update Successfull :-)";
        }
    }

}