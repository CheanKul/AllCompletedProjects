using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataConnection;

public partial class BookAppointmentPage : System.Web.UI.Page
{
    ConnectionDAO c = new ConnectionDAO();
    SqlConnection con;
    int id;


    static Random random = new Random(1);
    static string timeslot = "-1";
    static Button[] Button = new Button[23];
    static SqlDataReader rd;


    /* Take Connnection */
    public BookAppointmentPage()
    {
        con = c.GetConnection();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!timeslot.Equals("-1"))
        {

            Button[Convert.ToInt32(timeslot)].CssClass = "button buttonSelected";
        }

        /* On Load Generate Appointment Id */
        if (!IsPostBack)
        {
            SqlCommand cmd1 = new SqlCommand("select max(appoid) from timeslot", con);
            con.Open();
            Label1.Text = (Convert.ToInt32(cmd1.ExecuteScalar()) + 1).ToString();
            con.Close();
        }

        if (!IsPostBack)
        {
            /* On Page Load 2nd Table Must Be Hidden */
            calender.Attributes["style"] = "display:none";
        }

        /* Select Specialist From Database */
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("select id,specialist from specialist_tab", con);
            con.Open();
            DropDownList1.DataSource = cmd.ExecuteReader();
            DropDownList1.DataTextField = "specialist";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            con.Close();
        }


        /* On Page Load Does Not Show Calender */
        if (!IsPostBack)
        {
            Calendar1.Visible = false;
        }

    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

        /* On Rendering Can Not Select Other Months Dates */
        if (e.Day.IsOtherMonth || e.Day.IsWeekend)
        {
            e.Day.IsSelectable = false;
            e.Cell.ToolTip = "UnAvailable";
        }
        e.Cell.ToolTip = "Available";

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        /* After Selecting Date Calender Will Be Closed */
        TextBox1.Text = Calendar1.SelectedDate.ToString("d");
        Calendar1.Visible = false;

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        /* On Image Click Show/Hide Calender */
        if (Calendar1.Visible == true)
        {
            Calendar1.Visible = false;
        }
        else
        {
            Calendar1.Visible = true;
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        /* On Selection Of 1st Dropdown List Initialize 2nd Dropdown List */
        id = Convert.ToInt32(DropDownList1.SelectedValue);
        SqlCommand cmd2 = new SqlCommand("select id,name from doctor where specialid='" + id + "'", con);
        con.Open();
        DropDownList2.DataSource = cmd2.ExecuteReader();
        DropDownList2.DataTextField = "name";
        DropDownList2.DataValueField = "id";
        DropDownList2.DataBind();
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        /* Creating Array Of Buttons */


        Button[0] = Button2;
        Button[1] = Button3;
        Button[2] = Button4;
        Button[3] = Button5;
        Button[4] = Button6;
        Button[5] = Button7;
        Button[6] = Button8;
        Button[7] = Button9;
        Button[8] = Button10;
        Button[9] = Button11;
        Button[10] = Button12;
        Button[11] = Button13;
        Button[12] = Button14;
        Button[13] = Button15;
        Button[14] = Button16;
        Button[15] = Button17;
        Button[16] = Button18;
        Button[17] = Button19;
        Button[18] = Button20;
        Button[19] = Button21;
        Button[20] = Button22;
        Button[21] = Button23;
        Button[22] = Button24;


        string date = Calendar1.SelectedDate.Date.ToString("d");
        SqlCommand cmd4 = new SqlCommand("select timeslotid from timeslot where date='" + date + "'", con);
        con.Open();
        rd = cmd4.ExecuteReader();

        while (rd.Read())
        {
            Button[Convert.ToInt32(rd[0])].CssClass = "button button3";
            Button[Convert.ToInt32(rd[0])].Enabled = false;
        }


        calender.Attributes["style"] = "display:block";
    }

    protected void Button25_Click1(object sender, EventArgs e)
    {
        int appoid, pid, did, timeslotid;
        string date, status;
        pid = Convert.ToInt32(Session["id"].ToString());
        did = Convert.ToInt32(DropDownList2.SelectedValue);
        appoid = Convert.ToInt32(Label1.Text);
        date = Calendar1.SelectedDate.Date.ToString("d");
        timeslotid = Convert.ToInt32(tmslot.Value)-1;
        status = "Scheduled";
        SqlCommand cmd3 = new SqlCommand("INSERT INTO Timeslot(pid, did, appoid, date, timeslotid, status) VALUES (" + pid + ", " + did + ", '" + appoid + "', '" + date + "', " + timeslotid + ", '" + status + "')", con);
        con.Open();
        int res = cmd3.ExecuteNonQuery();
        con.Close();
        if (res == 0)
        {
            Label2.Text = "Somethings Wrong...:-(";
        }
        else
        {
            Response.Redirect("~/BookingHistoryPatient.aspx");
        }

    }
}