using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SessionTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void uxSetSession_Click(object sender, EventArgs e)
    {
        Session[uxSessionID.Text] = uxSessionValue.Text;
    }
    protected void uxGetSession_Click(object sender, EventArgs e)
    {
        uxSessionValue.Text = Session[uxSessionID.Text] as string;
    }
}