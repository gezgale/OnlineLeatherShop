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

public partial class viewNewsGroups : System.Web.UI.UserControl
{
    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT tblNews.NewsID AS nwsID, tblNews.NewsTitle AS nwsTitle, NewsGroups.NewgGroupDescription AS nwsGroup, 
                      Users.Name + N'  ' + Users.Sname AS Expr1, tblNews.DateOfAdding AS nwsDtadd, tblNews.NewsPic, tblNews.newsBody, 
                      SUBSTRING(tblNews.newsBody, 1, 700) AS NewsPart FROM         tblNews INNER JOIN
                      Users ON tblNews.UserName = Users.UserName INNER JOIN NewsGroups ON tblNews.NewsGroupID = NewsGroups.NewsGroupID WHERE     (tblNews.NewsGroupID = '" + int.Parse(Request.QueryString["NewsGroupID"].ToString()) + "') AND (tblNews.ShowPermiss = 1) ORDER BY tblNews.NewsID DESC");

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
