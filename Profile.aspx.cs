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
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setData();
            }
        }

        protected void setData()
        {
            string regno = Request.QueryString["RegNo"];
            string q = "Select * from Users where RegNo='" + regno + "' ";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lbregno.Text = dt.Rows[0][0].ToString();
                txtname.Text = dt.Rows[0][1].ToString();
                txtmobno.Text = dt.Rows[0][2].ToString();
                txtemail.Text = dt.Rows[0][3].ToString();
                txtaddress.Text = dt.Rows[0][4].ToString();
                imgPhoto.ImageUrl = dt.Rows[0][6].ToString();

                txtname.ReadOnly = true;
                txtmobno.ReadOnly = true;
                txtemail.ReadOnly = true;
                txtaddress.ReadOnly = true;
                lbtnupload.Enabled = false;
            }
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

        protected void btnedit_Click(object sender, EventArgs e)
        {
            txtname.ReadOnly = false;
            txtmobno.ReadOnly = false;
            txtemail.ReadOnly = false;
            txtaddress.ReadOnly = false;
            lbtnupload.Enabled = true;

            btnedit.Visible = false;
            btnupdate.Visible = true;


        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "Update Users set Name='" + txtname.Text + "',MobileNo='" + txtmobno.Text + "',EmailId='" + txtemail.Text + "',Address='" + txtaddress.Text + "',ProfileImg='" + imgPhoto.ImageUrl + "' where RegNo='" + lbregno.Text + "'";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Details Updated Successfully!!!')", true);

            txtname.ReadOnly = true;
            txtmobno.ReadOnly = true;
            txtemail.ReadOnly = true;
            txtaddress.ReadOnly = true;
            lbtnupload.Enabled = false;

            btnedit.Visible = true;
            btnupdate.Visible = false;
        }
    }
}