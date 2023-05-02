using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ReadNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int Rec_M = int.Parse(Request.QueryString["NewsID"].ToString());
        }
        catch
        {
           Response.Redirect("Default.aspx?ID=?" + DateTime.Now.Ticks.ToString());
        }
        
    }
}
