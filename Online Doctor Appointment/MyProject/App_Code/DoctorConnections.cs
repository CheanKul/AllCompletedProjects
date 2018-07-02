using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace DataConnection
{
    public class ConnectionDAO
    {
        public SqlConnection con;
        public SqlConnection GetConnection()
        {
            con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\MyProject\App_Data\OnlineDoc.mdf;Integrated Security=True;User Instance=True");
            return con;
        }
        public void CloseConnection()
        {
            con.Close();
        }
    }

    public class Patient : ConnectionDAO
    {
        ConnectionDAO conObj = new ConnectionDAO();
        SqlConnection connection = new SqlConnection();
        
        public Patient()
        {
            connection = conObj.GetConnection();
        }
        public String PatientLogin(string uname, string pass)
        {
            object name;
            try
            {
                SqlCommand cmd = new SqlCommand("select name from Patient where username='" + uname + "' and password='" + pass + "' ", connection);
                connection.Open();
                System.Console.Write(cmd.ExecuteScalar());
                name = cmd.ExecuteScalar();
                string name1 = name.ToString();
                return name1;
            }
            catch (Exception e)
            {
                e.GetBaseException();
            }
            return null;
        }
    }
}