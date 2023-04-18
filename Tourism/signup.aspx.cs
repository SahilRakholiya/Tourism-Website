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
    public partial class signup : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-29ATIV7;Initial Catalog=tourism;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
            {
                con.Open();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            adp = new SqlDataAdapter("select * from users where username ='" + unametxt.Text + "'", con);
            ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('UserName Already Exits please enter another username')</script>");
            }
            else
            {
                cmd = new SqlCommand("insert into users(username,password,contact) values('" + unametxt.Text + "','" + passwordtxt.Text + "'," + cnumbertxt.Text + ")", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("login.aspx");
            }
            
        }
    }
}