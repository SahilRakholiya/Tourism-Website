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
    public partial class payment : System.Web.UI.Page
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

        public void fillgrid()
        {
            adp = new SqlDataAdapter("select * from payment", con);
            ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                printmessage.Text = "";
            }
            else
            {
                printmessage.Text = "No Data Found ";
            }
        }

        protected void submitbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("navbar.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int payment_id = Convert.ToInt32(ds.Tables[0].Rows[e.RowIndex].ItemArray[0]);

            cmd = new SqlCommand("delete from payment where paymentId=" + payment_id + "", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("payment.aspx");

        }
    }
}