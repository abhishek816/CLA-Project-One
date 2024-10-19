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
    public partial class ProductDetails : System.Web.UI.Page
    {
        conclass cls = new conclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["pid"] != null)
                {
                    string sel = "select * from tab_product where p_id='" + Session["pid"] + "'";
                    SqlDataReader dr = cls.fun_exereader(sel);
                    while (dr.Read())
                    {
                        Image1.ImageUrl = dr["p_photo"].ToString();
                        Label1.Text = dr["p_name"].ToString();
                        Label3.Text = dr["p_details"].ToString();
                        Label4.Text = dr["p_price"].ToString();
                        Label5.Text = dr["p_stock"].ToString();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select max(cart_id) from cart_tab";
            string max_cart = cls.fun_exescalar(sel);
            int n_cart = 0;
            if (max_cart == "")
            {
                n_cart = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(max_cart);
                n_cart = newregid + 1;
            }

            int stock = 0;
            stock = stock_check();
            double tot_price = 0;
            tot_price = price_calc();
            int qty = Convert.ToInt32(DropDownList1.SelectedItem.Text);
            if (qty <= stock)
            {
                string cart_ins = "insert into cart_tab values(" + n_cart + "," + Session["pid"] + "," + Session["user_id"] + "," + qty + "," + tot_price + ")";
                int i = cls.fun_exenonquery(cart_ins);
                if (i == 1)
                {
                    Label6.Visible = true;
                    Label6.Text = "Added to cart.";
                }
            }
            else
            {
                Label6.Visible = true;
                Label6.Text = "Insufficient Stock.";
            }
        }
        public int stock_check()
        {
            string get_stock = "select p_stock from tab_product where p_id='" + Session["pid"] + "'";
            string stock = cls.fun_exescalar(get_stock);
            int stock_val = Convert.ToInt32(stock);
            return stock_val;
        }
        public double price_calc()
        {
            string get_price = "select p_price from tab_product where p_id='" + Session["pid"] + "'";
            string price = cls.fun_exescalar(get_price);
            double price_val = Convert.ToDouble(price);
            int qty = Convert.ToInt32(DropDownList1.SelectedItem.Text);
            double tprice = price_val * qty;
            return tprice;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}
