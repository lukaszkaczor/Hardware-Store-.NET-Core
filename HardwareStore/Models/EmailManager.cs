using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Models
{
    public class EmailManager
    {
        SmtpClient _client;
        NetworkCredential _login;
        MailMessage _message;

        public EmailManager()
        {
            _login = new NetworkCredential("kompex.sklep@gmail.com", "4aSgSwGHbcc2WPk");
            _client = new SmtpClient("smtp.gmail.com");
            _client.Port = Convert.ToInt32("587");
            _client.EnableSsl = true;
            _client.Credentials = _login;
            _message = new MailMessage(){From = new MailAddress("kompex.sklep@gmail.com", "Sklep kompex")};
            _message.BodyEncoding = Encoding.UTF8;
            _message.IsBodyHtml = true;
            _message.Priority = MailPriority.Normal;
        }


        public void SendEmail(string address, string subject, string messageBody)
        {
            _message.To.Add(new MailAddress(address));
            _message.Subject = subject;
            _message.Body = messageBody;

            _message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

            _client.Send(_message);
        }
    }
}
