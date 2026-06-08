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

        Response.Write(HttpUtility.ParseQueryString("q=test&ts=29381").Get("ts"));
    }
    protected void uxEncode_Click(object sender, EventArgs e)
    {
        uxEncoded.Text = Server.UrlEncode(uxDecoded.Text);
    }
    protected void uxDecode_Click(object sender, EventArgs e)
    {
        uxDecoded.Text = Server.UrlDecode(uxEncoded.Text);
    }
}