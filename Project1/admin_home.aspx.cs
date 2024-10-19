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
    public partial class admin_home : System.Web.UI.Page
    {
        conclass cls = new conclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind_grid();
                bind_dropdown();
                grid_bind();
            }
        }
        public void bind_dropdown()
        {
            string str = "select cat_id,cat_name from category_tab";
            DataSet ds = cls.fun_exeadapter(str);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "cat_name";
            DropDownList1.DataValueField = "cat_id";
            DropDownList1.DataBind();
        }
        public void bind_grid()
        {
            string sel = "select * from category_tab";
            DataSet ds = cls.fun_exeadapter(sel);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        public void grid_bind()
        {
            string sel1 = "select * from tab_product";
            DataSet ds = cls.fun_exeadapter(sel1);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "~/catimg/"+ FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(s));

            string ins="insert into category_tab values('"+TextBox1.Text+"','"+TextBox2.Text+"','"+s+"')";
            int i = cls.fun_exenonquery(ins);
            if (i == 1)
            {
                Label5.Text = "Category Addedd Succesfully!";
            }
            bind_grid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string del = "delete from category_tab where cat_id=" + getid + "";
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
            TextBox txtcatname = (TextBox)GridView1.Rows[i].Cells[2].Controls[0];
            TextBox txtcatdesc = (TextBox)GridView1.Rows[i].Cells[3].Controls[0]; 
            FileUpload catim = GridView1.Rows[i].FindControl("FileUpload2") as FileUpload;
            string strup = "";
            if(catim!=null&&catim.HasFile)
            {
                string folder = Server.MapPath("~/catimg/");
                string filePath = System.IO.Path.Combine(folder, catim.FileName);
                catim.SaveAs(filePath);
                string a = "~/catimg/" + catim.FileName;
                strup = "update category_tab set cat_name='" + txtcatname.Text + "' ,cat_desc='" + txtcatdesc.Text + "',cat_photo='" + a + "' where cat_id=" + getid + "";
            }
            else
            {
                strup = "update category_tab set cat_name='" + txtcatname.Text + "' ,cat_desc='" + txtcatdesc.Text + "' where cat_id=" + getid + "";
            }
            cls.fun_exenonquery(strup);
            GridView1.EditIndex = -1;
            bind_grid();
        }

        

        protected void Button2_Click(object sender, EventArgs e)
        {
            string b = "~/proimg/" + FileUpload3.FileName;
            FileUpload3.SaveAs(MapPath(b));

            string ins1 = "insert into tab_product values(" + DropDownList1.SelectedItem.Value + ",'" + TextBox3.Text + "','" + TextBox4.Text + "'," + TextBox5.Text + ",'" + b + "','available','" + TextBox6.Text + "')";
            int j = cls.fun_exenonquery(ins1);
            if (j == 1)
            {
                Label14.Text = "Product added succesfully!!";
            }
            bind_dropdown();
            grid_bind();

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int j = e.RowIndex;
            int getid1 = Convert.ToInt32(GridView2.DataKeys[j].Value);
            string del1 = "delete from tab_product where p_id=" + getid1 + "";
            cls.fun_exenonquery(del1);
            grid_bind();
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            grid_bind();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            grid_bind();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int j = e.RowIndex;
            int getid1 = Convert.ToInt32(GridView2.DataKeys[j].Value);
            TextBox txtpname = (TextBox)GridView2.Rows[j].Cells[2].Controls[0];
            TextBox txtpdetails = (TextBox)GridView2.Rows[j].Cells[3].Controls[0];
            TextBox txtprice = (TextBox)GridView2.Rows[j].Cells[4].Controls[0];
            FileUpload proim = (FileUpload)GridView2.Rows[j].FindControl("FileUpload4");
            TextBox txtpstock = (TextBox)GridView2.Rows[j].Cells[7].Controls[0];

            string strup;
            string b = string.Empty;

            if (proim != null && proim.HasFile)
            {
                string folder = Server.MapPath("~/proimg/");
                string filePath = System.IO.Path.Combine(folder, proim.FileName);
                proim.SaveAs(filePath);
                b= "~/proimg/" + proim.FileName;

                strup = "update tab_product set p_name='" + txtpname.Text + "', p_details='" + txtpdetails.Text + "', p_price=" + txtprice.Text + ", p_photo='" + b + "', p_stock=" + txtpstock.Text + " where p_id=" + getid1;
            }
            else
            {
                strup = "update tab_product set p_name='" + txtpname.Text + "', p_details='" + txtpdetails.Text + "', p_price=" + txtprice.Text + ", p_stock=" + txtpstock.Text + " where p_id=" + getid1;
            }

            cls.fun_exenonquery(strup);
            GridView2.EditIndex = -1;
            grid_bind(); 
        }
    }
}
