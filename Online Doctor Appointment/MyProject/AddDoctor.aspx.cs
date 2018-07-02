using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class AddDoctor : System.Web.UI.Page
{
    SqlConnection con;
    ConnectionDAO c;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

        if (!IsPostBack)
        {
            SqlCommand cmd1 = new SqlCommand("select MAX(id) from doctor", con);
            con.Open();
            Label1.Text = ((int)cmd1.ExecuteScalar() + 1).ToString();
            con.Close();

            SqlCommand cmd = new SqlCommand("select specialist from specialist_tab",con);
            con.Open();
            DropDownList1.DataSource = cmd.ExecuteReader();
            DropDownList1.DataTextField = "specialist";
            DropDownList1.DataValueField = "specialist";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Select", "Select"));
            con.Close();
 
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            SqlCommand cmd = new SqlCommand("insert into specialist_tab values('" + TextBox5.Text + "')", con);
            con.Open();
            int res = cmd.ExecuteNonQuery();
            con.Close();
            if (res == 0)
            {
                Label2.Text = "Fail To Insert Speciality...:-(";
            }
            else
            {
                SqlCommand cmd1 = new SqlCommand("select id from specialist_tab where specialist='" + TextBox5.Text + "'", con);
                con.Open();
                int specialid = Convert.ToInt32(cmd1.ExecuteScalar());
                con.Close();

                SqlCommand cmd2 = new SqlCommand("insert into doctor values(" + Convert.ToInt32(Label1.Text) + "," + specialid + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "','" + TextBox3.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')", con);
                con.Open();
                int result = cmd2.ExecuteNonQuery();
                con.Close();

                if (result == 0)
                {
                    Label2.Text = "Insertion Of Doctor Failed";
                }
                else
                {
                    Label2.ForeColor = System.Drawing.Color.Black;
                    Label2.Text = "Insertion Successfull....:-)";
                }
            }
        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into doctor values(" + Convert.ToInt32(Label1.Text) + "," + DropDownList1.SelectedIndex + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "','" + TextBox3.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')", con);
            con.Open();
            int res=cmd.ExecuteNonQuery();
            con.Close();
            if (res == 0)
            {
                Label2.Text = "Insert UnSuccessfull.....:-(";
            }
            else
            {
                Label2.Text="Insert Successfull.....:-)";
            }
        }
    }
}