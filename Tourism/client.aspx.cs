using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tourism
{
    public partial class client : System.Web.UI.Page
    {
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
                    uname.Text = Convert.ToString(Session["uname"]);
                }
                if (Session["uname"] == "admin@gmail.com")
                {

                    Response.Redirect("navbar.aspx");
                }

            }


        }
    }
}