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
    public partial class ProductView : System.Web.UI.Page
    {
        conclass cls = new conclass();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["cid"] != null)
                {
                    string psel = "select * from tab_product where cat_id='" + Session["cid"] + "'";
                    DataSet ds = cls.fun_exeadapter(psel);
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton clickbut = (ImageButton)sender;
            string proid = clickbut.CommandArgument;
            if (!string.IsNullOrEmpty(proid) && int.TryParse(proid, out int productid))
            {
                Session["pid"] = productid;
                Response.Redirect("ProductDetails.aspx");
            }
        }
    }
}