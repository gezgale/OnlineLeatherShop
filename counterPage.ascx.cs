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

public partial class counterPage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut("SELECT     TOP 1 VisitID FROM  VisitCounts");

        db.cmd.Parameters.Add("@VisitID", SqlDbType.Float).Value = (float.Parse(dt.Rows[0][0].ToString()) + 1);

        db.exeCommand("sp_VisitCounts_Update");
    }
}
