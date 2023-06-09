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

public partial class viewNews : System.Web.UI.UserControl
{
    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT dbo.tblNews.NewsID AS nwsID, dbo.tblNews.NewsTitle AS nwsTitle, dbo.NewsGroups.NewgGroupDescription AS nwsGroup, 
                        dbo.Users.Name + N'  ' + dbo.Users.Sname AS Expr1, dbo.tblNews.DateOfAdding AS nwsDtadd, dbo.tblNews.NewsPic, dbo.tblNews.newsBody,  SUBSTRING(dbo.tblNews.newsBody, 1, 700) AS NewsPart, dbo.tblNews.ShowPermiss
                        FROM         dbo.tblNews INNER JOIN dbo.Users ON dbo.tblNews.UserName = dbo.Users.UserName INNER JOIN dbo.NewsGroups ON dbo.tblNews.NewsGroupID = dbo.NewsGroups.NewsGroupID WHERE     (dbo.tblNews.ArchivedBit = 0) AND (dbo.tblNews.ShowPermiss = 1)
                        ORDER BY dbo.tblNews.NewsID DESC");
        
        GridView1.DataSource = dt;
        GridView1.EmptyDataText = "هیچگونه نوشتاری درج نشده است. لطفا نوشته های خود را از بخش مدیریت وارد فرمائید.";
        GridView1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        grdFill();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdFill();
    }
}
