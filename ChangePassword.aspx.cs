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
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            lbregno.Text = Request.QueryString["RegNo"];
        }


        protected void btnchngpass_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "Update Users set Password='" + txtconfpass.Text + "' where RegNo='" + lbregno.Text + "' ";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Password Changed Successfully!!!')", true);
            txtnewpass.Text = "";
            txtconfpass.Text = "";
        }
    }
}