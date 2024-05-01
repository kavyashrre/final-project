using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using Aspose.Cells;

namespace Project
{
    public partial class Bulk_Certificate_Generation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (System.Web.HttpContext.Current.Session["Finish"] != null)
                {
                    string finish = Session["Finish"].ToString();
                    if (finish == "Done")
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Certificate Generated and has send to student successfully !!!');", true);
                        Session["Finish"] = "";
                    }
                    else if (finish == "Not Done")
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Something went wrong while sending the certificate!!!');", true);
                        Session["Finish"] = "";
                    }
                }
                GvBind();
            }
        }

        protected void GvBind()
        {
            string html = "";
            string qu = "Select * from Templates";
            SqlDataAdapter da = new SqlDataAdapter(qu, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int c = dt.Rows.Count;
            if (c > 0)
            {
                for (int i = 0; i < c; i++)
                {
                    html += "<div id='autoDiv' class='card col-lg-2 ml-3 mt-2' style='height:auto;border:ridge;margin: 1%;'><div class='card-body'><br><img class='img-responsive' style='width: 275px; height: 200px;' src='" + dt.Rows[i][1].ToString() + "' /><br /><asp:Label ID = 'Label9' Visible='false' Style='font-size: x-large;display:none' runat='server' Text=''>" + dt.Rows[i][0].ToString() + "</asp:Label><input type='radio' name='rdbtemplate' id='rdb1' value='rdb' onclick='template(" + dt.Rows[i][0].ToString() + ")' /></div></div>";
                }
                contentDiv.InnerHtml = html;
                mytemplateDiv.Visible = false;

            }
            else
            {
                contentDiv.Visible = false;
            }
        }

        protected void lbtnupload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;

                if (height < 1100 || height > 1150 || width < 1600 || width > 1650)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select Template whose Height*Width is 1100*1600 !!!');", true);
                }
                else if ((height >= 1100 && height < 1150) || (width >= 1600 && width < 1650))
                {
                    string html = "";
                    try
                    {
                        string file = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                        //Save images into Images folder
                        FileUpload1.SaveAs(Server.MapPath("~\\Templates\\" + file));
                        string path = Server.MapPath("~\\Templates\\" + file);
                        FileUpload1.SaveAs(path + file);

                        imgPhoto.ImageUrl = "Templates\\" + file;

                        con.Open();
                        string q = "Insert into Templates(Template) Values('" + imgPhoto.ImageUrl + "')";
                        SqlCommand cmd = new SqlCommand(q, con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Template Added Successfully!!!');", true);

                        string qu = "Select * from Templates order by SrNo desc";
                        SqlDataAdapter da = new SqlDataAdapter(qu, con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        int c = dt.Rows.Count;
                        if (c > 0)
                        {

                            html += "<div class='card col-lg-12 ml-3 mt-2' style='height:auto;border:ridge;margin: 1%;width:100%'><div class='card-body'><br><img class='img-responsive' style='width: 275px; height: 200px;' src='" + dt.Rows[0][1].ToString() + "' /><br /><asp:Label ID = 'Label9' Visible='false' Style='font-size: x-large;display:none' runat='server' Text=''>" + dt.Rows[0][0].ToString() + "</asp:Label><input type='radio' name='rdbtemplate' id='rdb1' value='rdb' onclick='template(" + dt.Rows[0][0].ToString() + ")' /></div></div>";

                            mytemplateDiv.InnerHtml = html;
                            contentDiv.Visible = false;
                            mytemplateDiv.Visible = true;

                        }

                    }
                    catch (Exception ep)
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Something went wrong upload again !!!');", true);
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select Profile Photo !!!');", true);
            }
        }

        protected void btnstartgen_Click(object sender, EventArgs e)
        {

            string template = hdf_Srno.Value;
            if (template == "")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select Template !!!');", true);
            }
            else
            {
                Response.Redirect("GenerateBulk.aspx?Template=" + template);
            }
        }

        protected void btnimportfile_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#importModal').modal({backdrop: 'static', keyboard: false},'show')", true);
        }

        protected void lbtnimport_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {

                string FileName = Path.GetFileName(FileUpload2.PostedFile.FileName);

                string Extension = Path.GetExtension(FileUpload2.PostedFile.FileName);

                if (Extension == ".xlsx" || Extension == ".xlsx")
                {
                    string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

                    string FilePath = Server.MapPath(FolderPath + FileName);

                    FileUpload2.SaveAs(FilePath);

                    Import_To_Grid(FilePath);


                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select Excel file !!!');", true);
                }


            }
        }

        private void Import_To_Grid(string FilePath)
        {

            FileStream fstream = new FileStream(FilePath, FileMode.Open);

            // Instantiate a Workbook object
            //Opening the Excel file through the file stream
            Workbook workbook = new Workbook(fstream);

            // Access the first worksheet in the Excel file
            Worksheet worksheet = workbook.Worksheets[0];

            int rowcount = worksheet.Cells.Rows.Count + 1;
            int colcount = worksheet.Cells.Columns.Count + 1;

            // Export the contents of 2 rows and 2 columns starting from 1st cell to DataTable
            DataTable dataTable = worksheet.Cells.ExportDataTable(0, 0, rowcount, colcount, true);

            Session["DT"] = dataTable;

            // Close the file stream to free all resources
            fstream.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('File Uploaded Successfully !!!');", true);

        }



    }
}
