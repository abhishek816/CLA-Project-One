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
    public partial class cart : System.Web.UI.Page
    {
        conclass cls=new conclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind_grid();
            }
            
        }
        public void bind_grid()
        {
            string sel = "select * from cart_tab join tab_product on cart_tab.p_id=tab_product.p_id";
            DataSet ds = cls.fun_exeadapter(sel);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string del = "delete from cart_tab where cart_id=" + getid + "";
            cls.fun_exenonquery(del);
            bind_grid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bind_grid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind_grid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            TextBox qtyupdate = (TextBox)GridView1.Rows[i].Cells[4].Controls[0];
            string newqty = qtyupdate.Text;
            string strup = "update cart_tab set p_qty=" + newqty + " where cart_id=" + getid + "";
            int n = cls.fun_exenonquery(strup);
            if (n == 1)
            {
                string nqnty = qtyupdate.Text;
                string op = "select p_id from cart_tab  where cart_id=" + getid + "";
                string proid = cls.fun_exescalar(op).ToString();

                string pri = "select p_price from tab_product where p_id=" + proid + "";
                double npri = Convert.ToDouble(cls.fun_exescalar(pri));

                int nqnty1 = Convert.ToInt32(nqnty);
                string mp = "update cart_tab set p_price=" + nqnty1 * npri + " where cart_id=" + getid + "";
                cls.fun_exenonquery(mp);
            }
            GridView1.EditIndex = -1;
            bind_grid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "select max(cart_id) from cart_tab";
            string ccid=cls.fun_exescalar(s);
            int ns = Convert.ToInt32(ccid);
            DateTime bdate = DateTime.Now;
            string dt = bdate.ToString("yyyy-MM-dd");

            int proqnty = 0;
            float gp = 0;
            string pname = "";
            List<(int pid2, string pname, int proqnty, float gp)> cartData = new List<(int, string, int, float)>();

            for (int i = 1; i <= ns; i++)
            {
                string sel = "select * from cart_tab join tab_product on cart_tab.p_id=tab_product.p_id where cart_id=" + i + " ";
                SqlDataReader dr = cls.fun_exereader(sel);
                while (dr.Read())
                {
                    string prqnty = dr["p_qty"].ToString();
                    string tprice = dr["p_price"].ToString();
                    string pid = dr["p_id"].ToString();
                    int pid2 = Convert.ToInt32(pid);
                    pname = dr["p_name"].ToString();
                    proqnty = Convert.ToInt32(prqnty);
                    gp = Convert.ToInt32(tprice);
                    cartData.Add((pid2, pname, proqnty, gp));
                }
            }
            foreach (var item in cartData)
            {
                string ins = "insert into order_tab values(" + Session["user_id"] + "," + item.pid2 + ",'" + item.pname + "'," + item.gp + "," + item.proqnty + ",'" + dt + "','available')";
                int a = cls.fun_exenonquery(ins);

                string del = "delete from cart_tab where p_id = " + item.pid2;
                int b = cls.fun_exenonquery(del);

                if (a == 1 && b == 1)
                {
                    Label1.Text = "Order Received and Cart empty!";
                }
            }
            bind_grid();
            Response.Redirect("order_view.aspx");
        }
        
    }
}