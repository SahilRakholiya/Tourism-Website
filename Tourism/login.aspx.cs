using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

namespace tourism
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-29ATIV7;Initial Catalog=tourism;Integrated Security=True");
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
            {
                con.Open();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(unametxt.Text=="admin@gmail.com" )
            {
                if(passwordtxt.Text == "admin")
                {
                    Session["uname"] = "admin@gmail.com";
                    Response.Redirect("navbar.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Username not match')</script>");
                }
            }
            else
            {
                adp = new SqlDataAdapter("select * from users where username ='" + unametxt.Text + "' ", con);
                ds = new DataSet();
                adp.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    adp = new SqlDataAdapter("select * from users where username ='" + unametxt.Text + "' and password='" + passwordtxt.Text + "'", con);
                    ds = new DataSet();
                    adp.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Session["uname"] = unametxt.Text;
                        Session["password"] = passwordtxt.Text;
                        Response.Redirect("client.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Please Enter the correct password')</script>");

                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Username not match')</script>");

                }

            }
        }
    }
}