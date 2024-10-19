using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Project1
{
    public class conclass
    {
        SqlCommand com;
        SqlConnection con;
        public conclass()
        {
            con = new SqlConnection(@"server=LAPTOP-C64DN0LQ\SQLEXPRESS01;database=prodb;Integrated Security=True");
        }
        public int fun_exenonquery(string sqlquery)//insert,update,delete
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            com = new SqlCommand(sqlquery, con);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            return i;
        }
        public string fun_exescalar(string sqlquery)//scalar functions
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            com = new SqlCommand(sqlquery, con);
            con.Open();
            string s = com.ExecuteScalar().ToString();
            con.Close();
            return s;
        }
        public SqlDataReader fun_exereader(string sqlquery)//select
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            com = new SqlCommand(sqlquery, con);
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            return dr;
        }
        public DataSet fun_exeadapter(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            com = new SqlCommand(sqlquery, con);
            SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataTable fn_exedatatable(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}