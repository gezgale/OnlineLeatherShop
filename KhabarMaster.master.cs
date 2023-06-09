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

public partial class KhabarMaster : System.Web.UI.MasterPage
{
    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        FirstClass db1 = new FirstClass();

        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT NewsGroupID, NewgGroupDescription FROM NewsGroups ORDER BY NewgGroupDescription");
        if (Session["UserName"] == null)
        {
            dt1 = db1.dbOut(@"SELECT  TOP 100 PERCENT linkID, MainLinkDescription, MainLinkLink, SortingID, AllowShowBita FROM MainLinks WHERE (AllowShowBita = 0) OR (AllowShowBita = 2) ORDER BY SortingID");
        }
        else
        {
            if (int.Parse(Session["UserTypeID"].ToString()) == 1)
            {
                dt1 = db1.dbOut(@"SELECT  TOP 100 PERCENT linkID, MainLinkDescription, MainLinkLink, SortingID, AllowShowBita  FROM  MainLinks WHERE     (AllowShowBita = 0) OR   (AllowShowBita = 1) OR  (AllowShowBita = 3) OR  (AllowShowBita = 4) ORDER BY SortingID");
            }
            else if (int.Parse(Session["UserTypeID"].ToString()) == 2)
            {
                dt1 = db1.dbOut(@"SELECT     TOP 100 PERCENT linkID, MainLinkDescription, MainLinkLink, SortingID, AllowShowBita FROM    MainLinks WHERE     (AllowShowBita = 0) OR  (AllowShowBita = 1) OR  (AllowShowBita = 4) ORDER BY SortingID");
            }
            else
            {
                dt1 = db1.dbOut(@"SELECT TOP 100 PERCENT linkID, MainLinkDescription, MainLinkLink, SortingID, AllowShowBita FROM    MainLinks WHERE     (AllowShowBita = 0) OR   (AllowShowBita = 1) ORDER BY SortingID");
            }
        }

        GridView2.DataSource = dt;
        GridView1.DataSource = dt1;
        GridView1.EmptyDataText = "هیچ لینکی تعریف نشده است.";
        GridView2.EmptyDataText = "هیچ عنوانی تعریف نشده است.";
        GridView2.DataBind();

        GridView1.DataBind();
        fillMysiteinfo();
        archiveAdd();
    }

    protected void archiveAdd()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut("SELECT     TOP 15 ArchivedDate FROM         tblNews WHERE     (ArchivedBit = 1) GROUP BY ArchivedDate HAVING      (ArchivedDate IS NOT NULL) ORDER BY ArchivedDate DESC");

        GridView3.DataSource = dt;
        GridView3.EmptyDataText = "هیچ آرشیوی تعریف نشده است.";
        GridView3.DataBind();
    }

    protected void fillMysiteinfo()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     DERIVEDTBL_3.VisitID AS BazdidHa, DERIVEDTBL.Expr1 AS khabariSiteUsers, DERIVEDTBL_1.Expr2 AS AddedNews, 
                        DERIVEDTBL_2.Expr1 AS HasGroupsIn FROM         (SELECT     COUNT(UserName) AS Expr1  FROM   Users
                        GROUP BY Banded HAVING      (Banded = 0)) DERIVEDTBL CROSS JOIN (SELECT     COUNT(NewsID) AS Expr2
                             FROM    tblNews) DERIVEDTBL_1 CROSS JOIN (SELECT     COUNT(NewsGroupID) AS Expr1 FROM NewsGroups) DERIVEDTBL_2 CROSS JOIN
                          (SELECT     VisitID     FROM  VisitCounts) DERIVEDTBL_3");

        Label2.Text = dt.Rows[0][0].ToString();
        Label3.Text = dt.Rows[0][1].ToString();
        Label4.Text = dt.Rows[0][2].ToString();
        Label5.Text = dt.Rows[0][3].ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //this.EnableViewState = false;
        grdFill();

        if (Session["UserName"] != null)
        {
            Label1.Visible = true;
            Panel1.Visible = false;
            Label1.Text = Session["NameSname"].ToString() + "،" + Session["UserTypeDescript"].ToString() + " خوش آمدید ";
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     Users.UerID, Users.UserName, Users.Password, Users.Name + N'  ' + Users.Sname AS NameSname, 
                        UserTypes.UserTypeDescript, Users.Banded, Users.UserTypeID FROM Users INNER JOIN UserTypes ON Users.UserTypeID = UserTypes.UserTypeID WHERE (Users.Banded = 0) AND (Users.UserName = N'" + TextBox1.Text.Trim() + "') AND (Users.Password = N'" + TextBox2.Text.Trim() + "')");

        if (dt.Rows.Count <= 0)
        {
            Label1.Visible = true;
            Label1.Text = "نام کاربری موجود نیست";
        }
        else
        {
            Label1.Visible = true;
            Panel1.Visible = false;
            Session.Add("UserName", dt.Rows[0][1].ToString());
            Session.Add("NameSname", dt.Rows[0][3].ToString());
            Session.Add("UserTypeDescript", dt.Rows[0][4].ToString());
            Session.Add("UserTypeID", dt.Rows[0][6].ToString());
            Label1.Text = Session["NameSname"].ToString() + "،" + Session["UserTypeDescript"].ToString() + " خوش آمدید ";
            Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
