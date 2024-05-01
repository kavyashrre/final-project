using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Main : System.Web.UI.MasterPage
    {
        string regno;
        protected void Page_Load(object sender, EventArgs e)
        {
            regno = Request.QueryString["RegNo"];
            if (System.Web.HttpContext.Current.Session["Login"] != null)
            {
                string login = Session["Login"].ToString();
                if (login == "Admin")
                {
                    PAdmin.Visible = true;
                    PStudent.Visible = false;
                    PDefault.Visible = false;
                    PLogin.Visible = false;

                    this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/Backg.jpg");
                    this.bodytag.Style["background-repeat"] = "no-repeat";
                    this.bodytag.Style["background-size"] = "cover";
                }
                else if (login == "Student")
                {
                    PAdmin.Visible = false;
                    PStudent.Visible = true;
                    PDefault.Visible = false;
                    PLogin.Visible = false;

                    this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/Backg.jpg");
                    this.bodytag.Style["background-repeat"] = "no-repeat";
                    this.bodytag.Style["background-size"] = "cover";
                }
                else if (login == "Verify")
                {
                    PAdmin.Visible = false;
                    PStudent.Visible = false;
                    PDefault.Visible = false;
                    PLogin.Visible = true;

                    this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/Backg.jpg");
                    this.bodytag.Style["background-repeat"] = "no-repeat";
                    this.bodytag.Style["background-size"] = "cover";
                }
                else if (login == "Home")
                {
                    PAdmin.Visible = false;
                    PStudent.Visible = false;
                    PDefault.Visible = true;
                    PLogin.Visible = false;

                    this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/Backg.jpg");
                    this.bodytag.Style["background-repeat"] = "no-repeat";
                    this.bodytag.Style["background-size"] = "cover";

                }
                else if (login == "Login")
                {
                    PAdmin.Visible = false;
                    PStudent.Visible = false;
                    PDefault.Visible = false;
                    PLogin.Visible = true;

                    this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/Backg.jpg");
                    this.bodytag.Style["background-repeat"] = "no-repeat";
                    this.bodytag.Style["background-size"] = "cover";

                }
            }
        }

        //Faculty module
        protected void profile(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx?RegNo=" + regno);
        }

        //protected void VerifyCertf(object sender, EventArgs e)
        //{
        //    Response.Redirect("VerifyCertificate.aspx?RegNo=" + regno);
        //}

        protected void ChangePass(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx?RegNo=" + regno);
        }

        protected void CerViewDown(object sender, EventArgs e)
        {
            Response.Redirect("Cert_View_Download.aspx?RegNo=" + regno);
        }

    }
}