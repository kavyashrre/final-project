using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class VerifyCertificate : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Login"] = "Verify";
            if (!IsPostBack)
            {
                //GvBind();
            }
        }



        protected void lbtnupload_Click(object sender, EventArgs e)
        {
            string file = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            //Save images into Images folder
            FileUpload1.SaveAs(Server.MapPath("~\\Certificates\\" + file));
            string path = Server.MapPath("~\\Certificates\\" + file);
            FileUpload1.SaveAs(path + file);

            string localFilePath = path + file;

            try
            {
                string hash = "";
                var options = new RestClientOptions("http://localhost:5001")
                {
                    MaxTimeout = -1,
                };
                var client = new RestClient(options);
                var request1 = new RestRequest("/api/v0/add", Method.Post);
                request1.AlwaysMultipartFormData = true;
                request1.AddFile("", localFilePath);
                RestResponse response1 = client.Post(request1);
                string res = response1.StatusCode.ToString();
                if (res == "OK")
                {
                    dynamic array = JsonConvert.DeserializeObject(response1.Content);
                    hash = array.Hash;
                }

                string q = "Select Distinct DigitalSign from Transaction_Certificates";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int c = dt.Rows.Count;
                if (c > 0)
                {
                    for (int i = 0; i < c; i++)
                    {
                        string digitalsign = dt.Rows[i][0].ToString();
                        string ipfshash = Decrypt(digitalsign);
                        if (ipfshash == hash)
                        {
                            successDiv.Visible = true;
                            nsuccessDiv.Visible = false;
                            break;
                        }
                        else
                        {
                            nsuccessDiv.Visible = true;
                            successDiv.Visible = false;
                            continue;
                        }
                    }
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#myModal').modal({backdrop: 'static', keyboard: false},'show')", true);
            }
            catch (Exception exc)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Something went wrong while sending the certificate!!!');", true);

            }
        }

        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

        protected void ddlsearchby_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlsearchby.SelectedValue == "Certificate No")
            {
                tridDiv.Visible = true;
                fileDiv.Visible = false;
                successDiv.Visible = false;
                nsuccessDiv.Visible = false;
                trdetailsDiv.Visible = false;
            }
            else if (ddlsearchby.SelectedValue == "Certificate Upload")
            {
                tridDiv.Visible = false;
                fileDiv.Visible = true;
                successDiv.Visible = false;
                nsuccessDiv.Visible = false;
                trdetailsDiv.Visible = false;
            }
            else
            {
                tridDiv.Visible = false;
                fileDiv.Visible = false;
                successDiv.Visible = false;
                nsuccessDiv.Visible = false;
                trdetailsDiv.Visible = false;
            }
        }

        protected void lbtnverify_Click(object sender, EventArgs e)
        {
            string q = "Select u.RegNo, u.name,t.DigitalSign,t.Datetime,t.Path,t.Filename from Transaction_Certificates t, Users u where t.RegNo=u.RegNo and t.TrId='" + txttrid.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lbregno.Text = dt.Rows[0][0].ToString();
                lbname.Text = dt.Rows[0][1].ToString();
                string date = dt.Rows[0][3].ToString();
                DateTime d = Convert.ToDateTime(date);
                lbdate.Text = d.ToString("ddd, dd MMM yyy HH:mm:ss 'GMT' '(Indian Standard Time)'");

                trdetailsDiv.Visible = true;

                string ftpurl = dt.Rows[0][4].ToString();
                string filename = dt.Rows[0][5].ToString();


                if (File.Exists(Server.MapPath("~/Images/") + filename))
                {
                    //If File does not exists. Create it.
                    File.Delete(Server.MapPath("~/Images/") + filename);
                }

                try
                {
                    //Create FTP Request.
                    FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftpurl);
                    request.Method = WebRequestMethods.Ftp.DownloadFile;

                    //Enter FTP Server credentials.
                    request.Credentials = new NetworkCredential("Cloudstorage", "f@633dr4A");
                    request.UsePassive = true;
                    request.UseBinary = true;
                    request.EnableSsl = false;

                    //Fetch the Response and read it into a MemoryStream object.
                    FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                    using (Stream responseStream = response.GetResponseStream())
                    {
                        using (Stream fileStream = new FileStream(Server.MapPath("~/Images/") + filename, FileMode.CreateNew))
                        {
                            responseStream.CopyTo(fileStream);
                        }
                    }

                    img.Src = ("~/Images/" + filename);
                }
                catch (WebException ex)
                {
                    throw new Exception((ex.Response as FtpWebResponse).StatusDescription);
                }


            }

        }

    }
}