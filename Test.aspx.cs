using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string VisitorsIPAddr = string.Empty;
            if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            }
            else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
            {
                VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
            }
            uxUserIP.Text = VisitorsIPAddr;
        }
    }
    protected void Encrypt(object sender, EventArgs e)
    {
        //uxOutput.Text = Convert.ToString( plus._System.Configuration.Manager.Get(plus._System.Configuration.ConfigurationElement.SYSTEM_LANGUAGE));

        plus.Security.Cryptography.EncryptionResult result = plus.Security.Cryptography.Encryption.Encrypt(uxInput.Text.Trim());

        string output = System.Text.Encoding.UTF8.GetString(result.Key);
        output += ":=>:" + System.Text.Encoding.UTF8.GetString(result.Key);
        output += ":=>:" + System.Text.Encoding.UTF8.GetString(result.IV);

        uxEncrypted.Text = output;
    }


    protected void Decrypt(object sender, EventArgs e)
    {
        //uxOutput.Text = Convert.ToString( plus._System.Configuration.Manager.Get(plus._System.Configuration.ConfigurationElement.SYSTEM_LANGUAGE));
        string[] elements = uxInput.Text.Split(new string[] { ":=>:" }, StringSplitOptions.None);

        byte[] values = System.Text.Encoding.UTF8.GetBytes(elements[0]); //byte[] toBytes = Encoding.ASCII.GetBytes(somestring);
        byte[] Key = System.Text.Encoding.UTF8.GetBytes(elements[1]); //byte[] toBytes = Encoding.ASCII.GetBytes(somestring);
        byte[] IV = System.Text.Encoding.UTF8.GetBytes(elements[2]); //byte[] toBytes = Encoding.ASCII.GetBytes(somestring);

        uxDecrypted.Text = plus.Security.Cryptography.Encryption.Decrypt(values, Key, IV);
        

    }
}