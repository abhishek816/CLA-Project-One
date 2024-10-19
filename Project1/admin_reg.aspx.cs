using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1
{
    public partial class admin_reg : System.Web.UI.Page
    {
        conclass cls = new conclass();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select max(reg_id) from login_tab";
            string maxregid = cls.fun_exescalar(sel);
            int reg_id = 0;
            if (maxregid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                reg_id = newregid + 1;
            }
            string ins = "insert into admin_reg values(" + reg_id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "',"+TextBox3.Text+")";
            int i = cls.fun_exenonquery(ins);
            if (i == 1)
            {
                string login = "insert into login_tab values(" + reg_id + ",'" + TextBox4.Text + "','" + TextBox5.Text + "','admin')";
                int j = cls.fun_exenonquery(login);
                if (j == 1)
                {
                    Label1.Visible = true;
                    Label6.Text = "Registered Succesfully!!";
                }

            }

        }
    }
}