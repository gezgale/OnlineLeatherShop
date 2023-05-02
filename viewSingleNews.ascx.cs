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

public partial class viewSingleNews : System.Web.UI.UserControl
{

    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT tblNews.NewsID AS nwsID, tblNews.NewsTitle as nwsTitle, NewsGroups.NewgGroupDescription as nwsGroup,  Users.Name + N'  ' + Users.Sname AS Expr1, tblNews.DateOfAdding as nwsDtadd, tblNews.NewsPic, tblNews.newsBody as nwsBodyes
                       FROM  tblNews INNER JOIN Users ON tblNews.UserName = Users.UserName INNER JOIN NewsGroups ON tblNews.NewsGroupID = NewsGroups.NewsGroupID WHERE     (tblNews.NewsID = '"+ int.Parse(Request.QueryString["NewsID"].ToString()) +"') ORDER BY tblNews.NewsID DESC"); //NewsID

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        grdFill();
    }
}
