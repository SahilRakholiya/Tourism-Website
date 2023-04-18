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

    public partial class palace : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-29ATIV7;Initial Catalog=tourism;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();

        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null || Session["uname"]=="")
            {
                Response.Redirect("login.aspx");
            }

            if (Session["uname"] != null || Session["uname"] != "")
            {
               if(Session["uname"] == "admin@gmail.com")
                {
                    if (con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
                    {
                        con.Open();
                    }
                    fillgrid();
                }
                if(Session["uname"] != "admin@gmail.com") 
                {

                    Response.Redirect("client.aspx");
          
                }

            }
           //if(Session["uname"] == null || Session["uname"] == "")
        }



        protected void submitbtn_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(ViewState["command_name"]) == "update")
            {
                int x;

                cmd = new SqlCommand("select provider_id from provider where provider_name='" + providerNametxt.Text + "'", con);

                SqlDataReader dr2 = cmd.ExecuteReader();
                dr2.Read();
                x = dr2.GetInt32(0);
                con.Close();

                con.Open();
                cmd = new SqlCommand("update deal set placename='" + placeNametxt.Text + "' ,providerId='" + x + "',timage='" +FileUpload1.PostedFile.FileName + "',details='" + detailstxt.Text + "',duration='"+durationtxt.Text+"',price='"+pricetxt.Text+"' where dealId=" + ViewState["d_id"] + " ", con);
                cmd.ExecuteNonQuery();
                fillgrid();
                ViewState["command_name"] = "";
                clear();
            }
            else
            {
                int t;

                cmd = new SqlCommand("select provider_id from provider where provider_name='" + providerNametxt.Text + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                t = dr.GetInt32(0);
                con.Close();

                con.Open();

                if (FileUpload1.PostedFile != null)
                {
                    string path = Server.MapPath("~/photo/");
                    FileUpload1.SaveAs(path + FileUpload1.PostedFile.FileName);
                }

                cmd = new SqlCommand("insert into deal(placename,providerId,timage,details,duration,price) values('" + placeNametxt.Text + "'," + t + ",'" + FileUpload1.PostedFile.FileName + "','" + detailstxt.Text + "','" + durationtxt.Text + "'," + pricetxt.Text + ")", con);
                cmd.ExecuteNonQuery();
                fillgrid();
                clear();


            }
        }


        public void fillgrid()
        {
            adp = new SqlDataAdapter("select * from deal", con);
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int d_id = Convert.ToInt32(ds.Tables[0].Rows[e.RowIndex].ItemArray[0]);

            cmd = new SqlCommand("delete from deal where dealId=" + d_id + "", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("deal.aspx");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int d_id = Convert.ToInt32(ds.Tables[0].Rows[e.RowIndex].ItemArray[0]);
            DataRow row = ds.Tables[0].Rows[e.RowIndex];

            //con.Open();
            String t;
            cmd = new SqlCommand("select provider_name from provider where provider_id='" + row.ItemArray[2] + "'", con);

            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            t = dr.GetString(0);
            con.Close();

            placeNametxt.Text= row.ItemArray[1].ToString();
            providerNametxt.Text= t ;
            //FileUpload1.ToString= row.ItemArray[1].ToString();
            detailstxt.Text= row.ItemArray[4].ToString();
            durationtxt.Text= row.ItemArray[5].ToString();
            pricetxt.Text= row.ItemArray[6].ToString();

            ViewState["command_name"] = "update";

            ViewState["d_id"] = d_id;
        }

        protected void clearbtn_Click(object sender, EventArgs e)
        {
            clear();
        }

        public void clear()
        {
            placeNametxt.Text = "";
            providerNametxt.Text = "";
            detailstxt.Text = "";
            durationtxt.Text = "";
            pricetxt.Text = "";

        }

        protected void homebtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("navbar.aspx");

        }
    }
}