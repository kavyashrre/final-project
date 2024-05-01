using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Text;
using System.Drawing;
using System.IO;
using RestSharp;
using Newtonsoft.Json;
using System.Net;
using System.Security.Cryptography;
using System.Text;

namespace Project
{
    public partial class Generate : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                string tsr = Request.QueryString["Template"];
                string trid = Request.QueryString["TrId"];


                lbcerno.Text += trid + " ";
                string q = "Select template from Templates where SrNo='" + tsr + "'";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string template = dt.Rows[0][0].ToString();
                    this.contentDiv.Style["background-image"] = Page.ResolveUrl("~/" + template);
                    this.contentDiv.Style["background-repeat"] = "no-repeat";
                    this.contentDiv.Style["background-size"] = "cover";
                }

                q = "Select  u.Name from Transaction_Certificates tr, Users u where tr.RegNo = u.RegNo and TrId='" + trid + "' ";
                da = new SqlDataAdapter(q, con);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lbname.Text = dt.Rows[0][0].ToString();
                    
                }

                setFont();

            }
        }

        protected void setFont()
        {
            var fonts = new InstalledFontCollection();

            foreach (FontFamily font in fonts.Families)
            {
                ddlFfamily.Items.Add(font.Name);
            }

            for (int i = 1; i < 60; i++)
            {
                ddlFsize.Items.Add(i.ToString());
            }
        }

        protected void lbtnfinish_Click(object sender, EventArgs e)
        {
            string trid = Request.QueryString["TrId"];
            string regno = Request.QueryString["Regno"];
            string date = hdfimage.Value.Replace(':', '_');
            string localFilePath = "C:\\Users\\shrav\\Downloads\\" + date + ".png";
            string tdate = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");

            try
            {
                string hash = "";
                var options = new RestClientOptions("http://localhost:5001")
                {
                    MaxTimeout = -1,
                };
                var client1 = new RestClient(options);
                var request1 = new RestRequest("/api/v0/add", Method.Post);
                request1.AlwaysMultipartFormData = true;
                request1.AddFile("", localFilePath);
                RestResponse response1 = client1.Post(request1);
                string res = response1.StatusCode.ToString();
                if (res == "OK")
                {
                    dynamic array = JsonConvert.DeserializeObject(response1.Content);
                    hash = array.Hash;
                }

                string digitalSign = encrypt(hash);

                FileInfo file = new FileInfo(localFilePath);
                string fname = file.Name;
                string fext = file.Extension;

                string filename = trid + "Cenrtificate" + fext;

                string From = localFilePath;
                string To = "ftp://Cloudstorage.hostoise.com/Webstorage/Certificates/" + filename;

                using (WebClient client = new WebClient())
                {
                    client.Credentials = new NetworkCredential("Cloudstorage", "f@633dr4A");
                    client.UploadFile(To, WebRequestMethods.Ftp.UploadFile, From);
                }

                

                string que = "Select Name,EmailId from [Users] where RegNo='" + regno + "'";
                SqlDataAdapter da = new SqlDataAdapter(que, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string name = dt.Rows[0][0].ToString();
                    string toemail = dt.Rows[0][1].ToString();

                    con.Open();
                    string q = "Update Transaction_Certificates set Path = '" + To + "', DigitalSign='" + digitalSign + "', Filename='" + filename + "', Datetime='" + tdate + "',EmailId='" + toemail + "' where TrId='" + trid + "'";
                    SqlCommand cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    con.Close();


                    string check = sendEmail.sendEmail_MailjetSMTP(toemail, name, localFilePath);
                    if (check.Equals("true"))
                    {
                        Session["Finish"] = "Done";
                        Response.Redirect("GenCertificate.aspx");
                    }
                    else
                    {
                        Session["Finish"] = "Not Done";
                        Response.Redirect("GenCertificate.aspx");
                    }
                }
                
               

            }
            catch (Exception exc)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Something went wrong while sending the certificate!!!');", true);

            }
        }


        public string encrypt(string encryptString)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return encryptString;
        }
    }
}