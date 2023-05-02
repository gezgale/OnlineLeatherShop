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

public partial class viewArchives : System.Web.UI.UserControl
{

    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT tblNews.NewsID AS nwsID, tblNews.NewsTitle AS nwsTitle, NewsGroups.NewgGroupDescription AS nwsGroup, 
                      Users.Name + N'  ' + Users.Sname AS Expr1, tblNews.DateOfAdding AS nwsDtadd, tblNews.NewsPic, tblNews.newsBody, 
                      SUBSTRING(tblNews.newsBody, 1, 700) AS NewsPart, tblNews.ArchivedDate FROM         tblNews INNER JOIN Users ON tblNews.UserName = Users.UserName INNER JOIN
                      NewsGroups ON tblNews.NewsGroupID = NewsGroups.NewsGroupID WHERE (tblNews.ArchivedBit = 1) AND (tblNews.ArchivedDate = N'"+ Request.QueryString["ArchiveID"].ToString() +"') ORDER BY tblNews.NewsID DESC");

        GridView1.DataSource = dt;
        GridView1.DataBind();
        Label6.Text = dt.Rows[0][8].ToString();
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
