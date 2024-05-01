using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Project
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Login"] = "Home";
        }

        protected void lbtnupload_Click(object sender, EventArgs e)
        {
            try
            {
                string file = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                //Save images into Images folder
                FileUpload1.SaveAs(Server.MapPath("~\\ProfilePhoto\\" + file));
                string path = Server.MapPath("~\\ProfilePhoto\\" + file);
                FileUpload1.SaveAs(path + file);

                imgPhoto.ImageUrl = "ProfilePhoto\\" + file;

            }
            catch (Exception ep)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select Profile Photo !!!');", true);
            }

        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "Insert into Users(Name,MobileNo,EmailId,Address,Password,ProfileImg) values('" + txtname.Text + "','" + txtmobno.Text + "','" + txtemail.Text + "','" + txtaddress.Text + "','" + txtpassword.Text + "','" + imgPhoto.ImageUrl + "')";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Registered Successfully!!!')", true);
            txtname.Text = "";
            txtmobno.Text = "";
            txtemail.Text = "";
            txtaddress.Text = "";
            txtpassword.Text = "";
            imgPhoto.ImageUrl = "Images\\Profile.jpg";
        }
    }
}