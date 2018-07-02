using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class ForgotPasswordPatient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String email = TextBox1.Text;
        ConnectionDAO c=new ConnectionDAO();
        SqlConnection con = c.GetConnection();
        SqlDataReader rd;
        SqlCommand cmd = new SqlCommand("select username,password from patient where email='"+email+"'",con);
        con.Open();
        rd = cmd.ExecuteReader();
        //con.Close();
        
        if (rd.NextResult())
        {
            Label1.Text = rd.GetString(1);
            Label2.Text = rd.GetString(2);
            Label3.Text = "Username :-";
            Label4.Text = "Password :-";
        }
        else
        {
            Label3.ForeColor = System.Drawing.Color.Red;
            Label3.Text = "Wrong Email Id...!";

        }
    }
}