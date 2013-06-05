using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace eProject_SEM3_G1.Utilities.SendMail
{
    public class SendMail
    {
        public static bool SendMails(string sender, string receipents, string mailBody, string subject)
        {
            try
            {
                MailMessage email = new MailMessage();
                email.To.Add(receipents);
                email.From = new MailAddress(sender);
                email.Body = mailBody;
                email.Subject = subject;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("ggk0210@gmail.com", "02101990");
                smtp.EnableSsl = true;
                smtp.Send(email);

                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}