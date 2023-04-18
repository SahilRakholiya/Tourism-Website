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
    public partial class client_payment : System.Web.UI.Page
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

        public void clear()
        {
            nametxt.Text = "";
            dnumbertxt.Text = "";
            cvvtxt.Text = "";
            validdatetxt.Text = "";
        }
        public void fillgrid()
        {

            decimal x;
            cmd = new SqlCommand("select payment from booking where bookingId=" + Session["cb_id"] + "", con);

            SqlDataReader dr2 = cmd.ExecuteReader();
            dr2.Read();
            x = dr2.GetDecimal(0);
            con.Close();

            con.Open();

            //adp = new SqlDataAdapter("select payment from payment where bookingId="+Session["cb_id"]+"", con);
            //ds = new DataSet();
            //adp.Fill(ds);
            paymenttxt.Text =Convert.ToString(x);


        }

        protected void clearbtn_Click(object sender, EventArgs e)
        {
            clear();

        }

        protected void homebtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("client.aspx");
        }

        protected void payButton_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("insert into payment(bookingId,name,payment,dnumber,cvv,valid_date) values('" + Session["cb_id"] + "','" + nametxt.Text + "','" +paymenttxt.Text + "'," +dnumbertxt.Text+","+cvvtxt.Text+",'"+validdatetxt.Text+"')", con);

            cmd.ExecuteNonQuery();
            fillgrid();
            clear();

            cmd = new SqlCommand("update booking set payment_status=" + 1 + "  where bookingId=" + Session["cb_id"] + " ", con);
            cmd.ExecuteNonQuery();
            Session["cb_id"] = "";

            Response.Redirect("client.aspx");
        }
    }
}