using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Project1
{
    public partial class order_view : System.Web.UI.Page
    {
        conclass cls = new conclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s = "select * from order_tab where user_id=" + Session["user_id"] + "";
                SqlDataReader dr = cls.fun_exereader(s);
                while (dr.Read())
                {
                    Label2.Text = dr["user_id"].ToString();
                    Label3.Text = dr["order_date"].ToString();
                }
                int tp = 0;int gp = 0;
                string s1 = "select sum(p_qty) as tqnty,sum(p_price) as tpr from order_tab where user_id=" + Session["user_id"] + "";
                SqlDataReader dr1 = cls.fun_exereader(s1);
                if (dr1.Read())
                {
                    string tqnty = dr1["tqnty"].ToString();

                    Label4.Text = tqnty;

                    string tpr = dr1["tpr"].ToString();
                    Label5.Text = tpr;
                    tp = Convert.ToInt32(tpr);

                   

                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int tp = 0; int gp = 0; string date = " ";
            string s1 = "select order_date, sum(p_price) as tpr from order_tab where user_id=" + Session["user_id"] + " group by order_date;";

            SqlDataReader dr1 = cls.fun_exereader(s1);
            if (dr1.Read())
            {
                date = dr1["order_date"].ToString();

                string tpr = dr1["tpr"].ToString();
                tp = Convert.ToInt32(tpr);
               
            }
            string ins = "insert into bill_tab values('" + date + "'," + Session["user_id"] + "," + tp + ")";
            int n = cls.fun_exenonquery(ins);
            if (n == 1)
            {
                Response.Redirect("account.aspx");
            }



        }
    }
}