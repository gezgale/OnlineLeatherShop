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

public partial class SelectToEditNews : System.Web.UI.Page
{
    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        if (int.Parse(Session["UserTypeID"].ToString()) == 1)
        {
            dt = db.dbOut("SELECT TOP 100 PERCENT NewsID, NewsTitle  FROM tblNews  WHERE (ShowPermiss = 1)  ORDER BY NewsID DESC");
        }
        else
        {
            dt = db.dbOut("SELECT     TOP 100 PERCENT NewsID, NewsTitle, UserName FROM    tblNews WHERE     (ShowPermiss = 1) AND (UserName = N'" + Session["UserName"].ToString() + "') ORDER BY NewsID DESC");
        }

        GridView1.DataSource = dt;
        GridView1.EmptyDataText = "هیچگونه مطلبی برای ویرایش وجود ندارد.";
        GridView1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        else
        {
            if (int.Parse(Session["UserTypeID"].ToString()) == 3)
            {
                Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
            }
            else
            {
                grdFill();
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        String nwsEdtKey = GridView1.SelectedValue.ToString();
        Response.Redirect("EditNews.aspx?NewsID=" + nwsEdtKey);
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
