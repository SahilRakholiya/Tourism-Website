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
    public partial class user_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-29ATIV7;Initial Catalog=tourism;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null || Session["uname"] == "")
            {
                Response.Redirect("login.aspx");
            }

            if (Session["uname"] != null || Session["uname"] != "")
            {
                if (Session["uname"] == "admin@gmail.com")
                {
                    if (con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
                    {
                        con.Open();
                    }
                    fillgrid();
                }
                if (Session["uname"] != "admin@gmail.com")
                {

                    Response.Redirect("client.aspx");
                    
                }

            }


        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int u_id = Convert.ToInt32(ds.Tables[0].Rows[e.RowIndex].ItemArray[0]);
            cmd = new SqlCommand("delete from users where userId="+u_id+" ",con);
            cmd.ExecuteNonQuery();
            fillgrid();
            Response.Redirect("user_details.aspx");     // mimp when one delete but data still display then this use
        }

        public void fillgrid()
        {
            adp = new SqlDataAdapter("select * from users", con);
            ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
            else
            {
                PrintMessage.Text = "No Data Found ";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("navbar.aspx");
        }
    }
}