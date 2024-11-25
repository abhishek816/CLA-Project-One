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
    public partial class acnt_details : System.Web.UI.Page
    {
        conclass cls = new conclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["user_id"]);
            string sel = "select p_price from order_tab where user_id=" + id + "";
            SqlDataReader dr = cls.fun_exereader(sel);
            int tprice = 0;
            while (dr.Read())
            {
                int price = Convert.ToInt32(dr["p_price"]);
                tprice += price;
            }
            


            string ins = "insert into acnt_details values(" + id + "," + TextBox1.Text + ",'" + TextBox2.Text + "','" + TextBox3.Text + "'," + TextBox4.Text + ")";
            int i = cls.fun_exenonquery(ins);
            if (i == 1)
            {
               
                balance(id,tprice);
            }
            else
            {
                Label1.Text = "Error adding details";

            }

        }
        public void balance(int id,int tprice)
        {
            blncfetch.ServiceClient obj = new blncfetch.ServiceClient();
            string ifmin = obj.balancemin(id, tprice);

            if (ifmin == "Success")
            {
               
                string upd = "update order_tab set order_status='paid' where user_id=" + id;
                int status = cls.fun_exenonquery(upd);

                if (status >= 1)
                {
                    string message = "Order confirmed and payment processed!";
                    Response.Write("<script>alert('" + message + "');</script>");
                }
                else
                {
                    string message = "Failed to update order status!";
                    Response.Write("<script>alert('" + message + "');</script>");
                }
            }
            else if (ifmin == "Insufficient Balance")
            {
              
                string message = "Insufficient Balance!";
                Response.Write("<script>alert('" + message + "');</script>");
            }
            else if (ifmin == "User not found")
            {
                
                string message = "User not found!";
                Response.Write("<script>alert('" + message + "');</script>");
            }
            else
            {
                
                string message = "An error occurred while processing the balance.";
                Response.Write("<script>alert('" + message + "');</script>");
            }
        }
        
    }
}