using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class CancelBooking : System.Web.UI.Page
{
    SqlConnection con;
    ConnectionDAO c;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("DELETE FROM Timeslot WHERE (appoid = "+TextBox1.Text+") AND (pid = "+Session["id"]+")", con);
        con.Open();
        int res=cmd.ExecuteNonQuery();
        con.Close();
        if (res > 0)
        {
            Label1.Text = "Booking Is Canceled";
        }
        else
        {
            Label1.Text = "Booking Id Is Wrong";
        }
    }
}