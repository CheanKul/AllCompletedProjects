using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataConnection;

public partial class ShowDoctorDetails : System.Web.UI.Page
{
    ConnectionDAO c;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

        DoctorDetails();

        tab2.Attributes["style"] = "display:none";
    }

    private void DoctorDetails()
    {

        int id = Convert.ToInt32(Session["did"]);
        SqlCommand cmd = new SqlCommand("select Doctor.name, Doctor.address, Doctor.email, Doctor.mobile, specialist_tab.specialist from Doctor,specialist_tab where Doctor.specialid=specialist_tab.id and Doctor.id=" + id + "", con);
        SqlDataReader rdr;
        con.Open();
        rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            Label1.Text = rdr.GetString(0);
            Label2.Text = rdr.GetString(1);
            Label3.Text = rdr.GetString(2);
            Label4.Text = rdr.GetString(3);
            Label5.Text = rdr.GetString(4);
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        tab1.Attributes["style"] = "display:none";
        int id = Convert.ToInt32(Session["did"]);
        SqlCommand cmd = new SqlCommand("select * from Doctor where id=" + id + "", con);
        SqlCommand cmd2 = new SqlCommand("select specialist from specialist_tab", con);
        SqlDataReader rdr;
        con.Open();
        rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            TextBox1.Text = Label1.Text;
            TextBox2.Text = Label2.Text;
            TextBox3.Text = Label3.Text;
            TextBox4.Text = Label4.Text;
        }
        con.Close();
        con.Open();
        DropDownList1.DataSource = cmd2.ExecuteReader();
        DropDownList1.DataTextField = "specialist";
        DropDownList1.DataValueField = "specialist";
        //Response.Write(Label5.Text);
        //Response.Write(DropDownList1.Items.FindByText(Label5.Text));
        DropDownList1.SelectedIndex = DropDownList1.Items.IndexOf(DropDownList1.Items.FindByText(Label5.Text));
        DropDownList1.DataBind();
        con.Close();
        tab2.Attributes["style"] = "display:block";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {        
        SqlCommand cmd = new SqlCommand("update Doctor set specialid='" + ((DropDownList1.SelectedIndex)+1) + "',name='" + TextBox1.Text + "',address='" + TextBox2.Text + "', email='" + TextBox3.Text + "', mobile='" + TextBox4.Text + "' where id=" + Convert.ToInt32(Session["did"]) + "", con);
        con.Open();
        int res = cmd.ExecuteNonQuery();
        if (res == 0)
        {
            Response.Write("Fail To Update");
        }

        tab1.Attributes["style"] = "display:block";
        con.Close();
        DoctorDetails();
         
    }
}