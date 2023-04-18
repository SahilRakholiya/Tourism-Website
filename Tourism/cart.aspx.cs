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
    public partial class cart : System.Web.UI.Page
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
                if (Session["uname"] != "admin@gmail.com")
                {
                    if (con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
                    {
                        con.Open();
                    }
                    fillgrid();
                }
                if (Session["uname"] == "admin@gmail.com")
                {

                    Response.Redirect("client.aspx");

                }

            }


        }

        public void fillgrid()
        {
            int x;
            cmd = new SqlCommand("select userId from users where username='" + Session["uname"] + "'", con);

            SqlDataReader dr2 = cmd.ExecuteReader();
            dr2.Read();
            x = dr2.GetInt32(0);
            con.Close();

            con.Open();

            adp = new SqlDataAdapter("select bookingId,u.username,bookDate,payment,payment_status from booking b,users u,deal d where b.userID="+x+" and payment_status="+0+" and b.userId=u.userId and d.dealId=b.dealId", con);
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
                printmessage.Text = "No data  ";
            }
        }

        protected void homebtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("client.aspx");
        }

        protected void pay_now_Click(object sender, EventArgs e)
        {
            int cb_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Session["cb_id"] = cb_id;
            Response.Redirect("client_payment.aspx");
        }
    }
}