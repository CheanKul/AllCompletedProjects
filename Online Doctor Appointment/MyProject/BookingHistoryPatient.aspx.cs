using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataConnection;
public partial class BookingHistoryPatient : System.Web.UI.Page
{
    SqlConnection con;
    ConnectionDAO c;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new ConnectionDAO();
        con = c.GetConnection();

        SqlCommand cmd = new SqlCommand("SELECT Timeslot.appoid, Timeslot.date, timeslot_tab.timeslot, Timeslot.status FROM Timeslot INNER JOIN timeslot_tab ON Timeslot.timeslotid = timeslot_tab.id WHERE (Timeslot.pid = " + Convert.ToInt32(Session["id"]) + ") ORDER BY Timeslot.date DESC, timeslot_tab.timeslot", con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            DataTable dt = new DataTable();

            DataColumn Appid = new DataColumn("Appointment Id");
            DataColumn Date = new DataColumn("Date");
            DataColumn Timeslot = new DataColumn("Time Slot");
            DataColumn Status = new DataColumn("Status");

            dt.Columns.Add(Appid);
            dt.Columns.Add(Date);
            dt.Columns.Add(Timeslot);
            dt.Columns.Add(Status);

            DataRow row;

            do
            {
                row = dt.NewRow();
                row[Appid] = rdr[0];
                row[Date] = rdr[1];
                row[Timeslot] = rdr[2];
                row[Status] = rdr[3];
                dt.Rows.Add(row);

            }while(rdr.Read());

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

    }
}