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
    public partial class client_deal : System.Web.UI.Page
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

            adp = new SqlDataAdapter("select dealId,placename,provider_name,timage,details,duration,price from deal,provider where provider_id=providerId", con);
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
                printmessage.Text = "No deal available ";
            }

        }

        protected void homebtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("client.aspx");
        }


        protected void add_to_cart_Click(object sender, EventArgs e)
        {
            int cd_id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            int x;
            cmd = new SqlCommand("select userId from users where username='" + Session["uname"] + "'", con);

            SqlDataReader dr2 = cmd.ExecuteReader();
            dr2.Read();
            x = dr2.GetInt32(0);
            con.Close();

            con.Open();
            decimal y;
            cmd = new SqlCommand("select price from deal where dealId=" + cd_id + "", con);
            SqlDataReader dr3 = cmd.ExecuteReader();
            dr3.Read();
            y = dr3.GetDecimal(0);
            con.Close();

            con.Open();
            cmd = new SqlCommand("insert into booking(userId,dealId,bookDate,payment) values(" + x + "," + cd_id + ",GETUTCDATE(),'" + y+ "')", con);
            cmd.ExecuteNonQuery();

            //            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('"+cd_id+"')</script>");
        }

    }
}