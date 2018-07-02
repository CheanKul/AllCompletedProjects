using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;

public partial class SearchDoctor : System.Web.UI.Page
{
    SqlConnection con;
    ConnectionDAO c;
    String q1 = "SELECT d.name, d.address, s.specialist, d.mobile, d.email FROM Doctor as d,specialist_tab as s WHERE s.id=d.specialid   ";
    SqlDataReader rdr;

    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

        if (!IsPostBack)
        {
            SqlCommand cmd2 = new SqlCommand("SELECT DISTINCT specialist FROM specialist_tab", con);
            con.Open();
            SqlDataReader name = cmd2.ExecuteReader();

            DropDownList1.DataSource = name;
            DropDownList1.DataTextField = "specialist";
            DropDownList1.DataValueField = "specialist";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Select", "Select"));
            con.Close();

            SqlCommand cmd1 = new SqlCommand("SELECT DISTINCT address FROM Doctor", con);
            con.Open();
            SqlDataReader loc = cmd1.ExecuteReader();

            DropDownList2.DataSource = loc;
            DropDownList2.DataTextField = "address";
            DropDownList2.DataValueField = "address";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("Select", "Select"));
            con.Close();
            tab1.Attributes["style"] = "display:none";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (((DropDownList1.SelectedItem.Text.Equals("Select"))) && ((DropDownList2.SelectedItem.Text.Equals("Select"))) && (TextBox1.Text == ""))
        {
            tab1.Attributes["style"] = "display:none";
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "No Data Found";
        }
        else
        {
            
            tab1.Attributes["style"] = "display:block";
            if (!DropDownList1.SelectedItem.Value.Equals("Select"))
            {
                q1 = q1 + "and (s.specialist LIKE '%" + DropDownList1.SelectedItem.Text + "%')";
            }
            if (!DropDownList2.SelectedItem.Text.Equals("Select"))
            {
                q1 = q1 + "and (d.address LIKE '%" + DropDownList2.SelectedItem.Text + "%')";
            }
            if (TextBox1.Text != "")
            {
                q1 = q1 + "and (d.name LIKE '" + TextBox1.Text + "%')";
            }

          
            SqlCommand cmd = new SqlCommand(q1, con);
            con.Open();
            rdr = cmd.ExecuteReader();
        
            if (rdr.Read())
            {
                DataTable dt = new DataTable("Doctor Search");

                DataColumn Name = new DataColumn("Name");
                DataColumn Location = new DataColumn("Location");
                DataColumn Speciality = new DataColumn("Speciality");
                DataColumn Mobile = new DataColumn("Mobile");
                DataColumn Email = new DataColumn("Email");

                dt.Columns.Add(Name);
                dt.Columns.Add(Location);
                dt.Columns.Add(Speciality);
                dt.Columns.Add(Mobile);
                dt.Columns.Add(Email);

                DataRow row;
                do
                {
                    row = dt.NewRow();
                    row[Name] = rdr[0];
                    row[Location] = rdr[1];
                    row[Speciality] = rdr[2];
                    row[Mobile] = rdr[3];
                    row[Email] = rdr[4];
                    dt.Rows.Add(row);
                } while (rdr.Read());
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            else
            {
                tab1.Attributes["style"] = "display:none";
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "No Data Found";
            }
        }
        con.Close();
    }
}