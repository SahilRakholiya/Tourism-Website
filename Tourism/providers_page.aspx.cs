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
    public partial class providers_page : System.Web.UI.Page
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

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (maleRadioButton.Checked || femaleRadioButton.Checked)
            {
                args.IsValid = true;
                Session["count"] = 1;
                if(maleRadioButton.Checked)
                {
                    ViewState["gender"] = "male";
                }
                else if(femaleRadioButton.Checked)
                {
                    ViewState["gender"] = "female";
                }
            }
            else
            {
                args.IsValid = false;
                Session["count"] = 2;
            
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (cnumberTextBox.Text.Length == 10)
            {
                args.IsValid = true;
                Session["count"] = 1;

            }
            else
            {
                args.IsValid = false;
                Session["count"] = 2;

            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["count"]) == 1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Your form has been submitted')</script>");

                if (Convert.ToString(ViewState["command_name"]) == "update")
                {
                    cmd = new SqlCommand("update provider set provider_name='"+pnameTextBox.Text+"' ,contact_no='"+cnumberTextBox.Text+"',email='"+emailTextBox.Text+"',gender='"+ Convert.ToString(ViewState["gender"]) + "' where provider_id="+ViewState["p_id"]+" ", con);
                    cmd.ExecuteNonQuery();
                    fillgrid();
                    ViewState["command_name"] = "";
                    clear();
                }
                else
                {
                    cmd = new SqlCommand("insert into provider(provider_name,contact_no,email,gender) values('" + pnameTextBox.Text + "'," + cnumberTextBox.Text + ",'" + emailTextBox.Text + "','" + Convert.ToString(ViewState["gender"]) + "')", con);
                    //                insert into tblproduct(product_name, category, price, description) values('" + nametxt.Text + "', '" + catdrop.SelectedItem.Text + "', " + Convert.ToInt32(pricetxt.Text) + ", '" + dectxt.Text + "')
                    ViewState["gender"] = "";
                    cmd.ExecuteNonQuery();
                    fillgrid();
                    clear();
                }

            }
        }

        public void clear()
        {
            pnameTextBox.Text = "";
            cnumberTextBox.Text = "";
            emailTextBox.Text = "";
            if(maleRadioButton.Checked)
            {
                maleRadioButton.Checked = false;
            }
            else if(femaleRadioButton.Checked)
            {
                femaleRadioButton.Checked = false;
            }
        }

        public void fillgrid()
        {
            adp = new SqlDataAdapter("select * from provider", con);
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
            int p_id = Convert.ToInt32(ds.Tables[0].Rows[e.RowIndex].ItemArray[0]);

            cmd = new SqlCommand("delete from provider where provider_id="+p_id+"", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("providers_page.aspx");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string s;
            int p_id = Convert.ToInt32(ds.Tables[0].Rows[e.RowIndex].ItemArray[0]);

            DataRow row = ds.Tables[0].Rows[e.RowIndex];
            pnameTextBox.Text = row.ItemArray[1].ToString();
            cnumberTextBox.Text = row.ItemArray[2].ToString();
            emailTextBox.Text = row.ItemArray[3].ToString();
            s = row.ItemArray[4].ToString();

            if(s=="male")
            {
                maleRadioButton.Checked=true ;
            }
            else if(s=="female")
            {
                femaleRadioButton.Checked = true;
            }
            ViewState["command_name"] = "update";

            ViewState["p_id"] = p_id;
        }

        protected void clearbtn_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void homebtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("navbar.aspx");
        }
    }
}