using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataConnection;
using System.Data.SqlClient;
public partial class UpdatePatientDetails : System.Web.UI.Page
{
    ConnectionDAO c = new ConnectionDAO();
    SqlConnection con;
    SqlCommand cmd;
    //int id = Convert.ToInt32(Session["id"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        con = c.GetConnection();
        if (!IsPostBack)
        {
            cmd = new SqlCommand("",con);
        }
    }
}