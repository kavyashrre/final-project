using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Project
{
    public class sendEmail
    {
        public static string sendEmail_MailjetSMTP(string email, string name, string path)
        {
            try
            {
                MailMessage mm = new MailMessage("mailtestingw@gmail.com", email);
                mm.Subject = "Certificate from Admin";

                mm.Body = "Dear " + name + ",\r\n\r\nWe are sharing your certificate here.\r\n\r\n Please check it." + "\r\n\r\nkindly download the image file attach with this mail.";


                //mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "in.mailjet.com";
                //smtpc.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = "c99aeca3c5b0ea572f4aa66fe248afcb";
                NetworkCred.Password = "c02c96b55045fed17b569ef0a0b67a9b";
                //smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 80;
                Attachment attachment;
                attachment = new Attachment(path);
                mm.Attachments.Add(attachment);
                smtp.Send(mm);

                return "true";
            }
            catch (Exception e)
            {
                string ans = e.Message;
                return ans;
            }
        }
    }
}