<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        plus._System.Configuration.Manager.Set(plus._System.Configuration.ConfigurationElement.BASE_URL, "http://localhost/asanwazifa/");
        plus._System.Configuration.Manager.Set(plus._System.Configuration.ConfigurationElement.SECURITY_PATH, "http://localhost/asanwazifa/security/");
        plus._System.Configuration.Manager.Set(plus._System.Configuration.ConfigurationElement.CONFSYS_DB, "confsys");
        
        
        Dictionary<string, string> Paths = new Dictionary<string, string>();
        Paths.Add("AccountActivation", "http://asanwazifa.com/page/templ/pub/accountactivation.html");
        Paths.Add("RegistrationMail", "info@asanwazifa.com");
        plus._System.Configuration.Manager.Set( plus._System.Configuration.ConfigurationElement.DEFAULT_PATHS, Paths );
        // Code that runs on application startup
        plus._System.Configuration.Manager.init( "AsanWazifa", plus._System.ApplicationType.MASTER);
        
        plus.Security.Authentication.init();

    }
    protected void Application_BeginRequest(object sender, EventArgs e)
    {
        // Security Check IP
        plus.Security.Authorization.AuthorizeContext();

    }
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs
        // Get the exception object.
        Exception exc = Server.GetLastError();

        // Handle HTTP errors
        if (exc.GetType() == typeof(HttpException))
        {
            // The Complete Error Handling Example generates
            // some errors using URLs with "NoCatch" in them;
            // ignore these here to simulate what would happen
            // if a global.asax handler were not implemented.
            if (exc.Message.Contains("NoCatch") || exc.Message.Contains("maxUrlLength"))
                return;

            if (exc.Message.Contains("/ads/"))
            {
                string msg = exc.Message;
                string type = "";
                string recordid = "0";
                msg = exc.Message.Substring(exc.Message.IndexOf("'") + 1);
                msg = msg.Replace("' does not exist.", "");
                msg = exc.Message.Substring(exc.Message.IndexOf("ads/") + 4);
                type = msg.Substring(0, msg.IndexOf("/"));
                msg = msg.Substring(type.Length + 1);
                recordid = msg.Substring(0, msg.IndexOf("/"));

                msg = "type=" + type + "&&recordid=" + recordid;
                Server.Transfer("~/page/portal/preview/default.aspx?" + msg);
                //Server.Transfer("~/page/portal/preview/?" + msg);
                return;
            }
            //Redirect HTTP errors to HttpError page
            Server.Transfer("~/error/custom/default.aspx");
        }

        // For other kinds of errors give the user some information
        // but stay on the default page
        Response.Write("<h2>Global Page Error</h2>\n");
        Response.Write(
            "<p>" + exc.Message + "</p>\n" + exc.StackTrace);
        Response.Write("Return to the <a href='Default.aspx'>" +
            "Default Page</a>\n");

        // Log the exception and notify system operators
        //ExceptionUtility.LogException(exc, "DefaultPage");
        //ExceptionUtility.NotifySystemOps(exc);

        // Clear the error from the server
        Server.ClearError();
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        plus.Security.Authentication.SignOut(Context);
    }
       
</script>
