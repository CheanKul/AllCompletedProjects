using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class AdminLogin : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select id from admin where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'", con);
        con.Open();
        int res = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        if (res == 0)
        {
            Response.Redirect("~/AddDoctor.aspx");
        }
        else
        {
            Label1.Text = "Wrong Username Or Password .... :-(";
        }
    }
}