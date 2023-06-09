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

public partial class AcceptNews : System.Web.UI.Page
{

    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     tblNews.NewsID, tblNews.NewsTitle, NewsGroups.NewgGroupDescription, Users.UserName, 
                      Users.Name + N'  ' + Users.Sname AS Expr1, tblNews.DateOfAdding, Users.EMail1 FROM tblNews INNER JOIN
                      NewsGroups ON tblNews.NewsGroupID = NewsGroups.NewsGroupID INNER JOIN
                      Users ON tblNews.UserName = Users.UserName WHERE     (tblNews.ShowPermiss = 0)");
        GridView1.DataSource = dt;
        GridView1.EmptyDataText = "هیچگونه ارسالی برای تائید موجود نمی باشد";
        GridView1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if (int.Parse(Session["UserTypeID"].ToString()) == 1)
            {
                grdFill();
            }
            else
            {
                Response.Redirect("Default.aspx?ID=NotHavePermission" + DateTime.Now.Ticks.ToString());
            }
        }
        else
        {
            Response.Redirect("Default.aspx?ID=NotHavePermission" + DateTime.Now.Ticks.ToString());
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FirstClass db = new FirstClass();
        String nwsEdtKey = GridView1.SelectedValue.ToString();

        db.cmd.Parameters.Add("@NewsID", SqlDbType.Int).Value = int.Parse(nwsEdtKey);
        db.cmd.Parameters.Add("@ShowPermiss", SqlDbType.Bit).Value = 1;

        db.exeCommand("sp_tblNews_Update3");
        grdFill();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdFill();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int nwsEdtKey = (int)GridView1.DataKeys[e.RowIndex].Value;
        FirstClass db = new FirstClass();
        db.cmd.Parameters.Add("@NewsID", SqlDbType.Int).Value = nwsEdtKey;

        db.exeCommand("sp_tblNews_DeleteRow");
        grdFill();
    }
}
