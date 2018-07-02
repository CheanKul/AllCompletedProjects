using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataConnection;

public partial class LogInPage : System.Web.UI.Page
{
    ConnectionDAO c;
    SqlConnection con;
    SqlCommand cmd;
    int id;
    public LogInPage()
    {
        c=new ConnectionDAO();
        con = c.GetConnection();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
            cmd = new SqlCommand("select id from patient where username='" + UserBox.Text + "' and password='" + PassBox.Text + "'", con);
            con.Open();
            id = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (id == 0)
            {
                errorMsg.Attributes["style"] = "display:inline block";
                Label1.Text = "Invalid Username Or Password...!";
                con.Close();
            }
            else
            {
                Session["id"] = id;
                Response.Redirect("~/PatientDetailsShow.aspx");
            }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("HomePage.aspx");
    }
}