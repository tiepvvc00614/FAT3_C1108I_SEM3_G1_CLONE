using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace eProject_SEM3_G1.Utilities.SendMail
{
    public class SendMail
    {
        public static bool SendMails(string sender, string receipents, string mailBody, string subject, string mailCC = null, string mailBcc = null, bool IsBodyHtml = false, string LnkSrc = null, string Attachment = null)
        {
            MailMessage email = new MailMessage();
            email.To.Add(receipents);
            email.Subject = subject;
            email.Body = mailBody;
            Attachment attach = new Attachment(Attachment);
            email.Attachments.Add(attach);

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("ggk8888@gmail.com", "2Uf2RE=j2h");
            smtp.EnableSsl = true;
            smtp.Send(email);
            return true;
        }
    }
}