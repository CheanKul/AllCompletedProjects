using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class DoctorLogin : System.Web.UI.Page
{
    ConnectionDAO c;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select id from Doctor where username='"+UserBox.Text+"' and password='"+PassBox.Text+"'",con);
        con.Open();
        int did = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        if (did == 0)
        {
            errorMsg.Attributes["style"] = "display:inline block";
            Label1.Text = "Invalid Username Or Password...!";
        }
        else
        {
            Session["did"] = did;
            Response.Redirect("~/ShowDoctorDetails.aspx");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HomePage.aspx");
    }
}