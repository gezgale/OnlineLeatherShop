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

public partial class EditVotes : System.Web.UI.Page
{

    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();
        Image1.Visible = false;

        if (int.Parse(Session["UserTypeID"].ToString()) == 1)
        {
            dt = db.dbOut(@"SELECT     TOP 100 PERCENT VoteID, newsID, VoterNameSname, VoteBody, DateOfVoting, voterWebSite, allowShowBit FROM tblVotes WHERE (allowShowBit = 0)");
        }
        else
        {
            dt = db.dbOut(@"SELECT  TOP 100 PERCENT tblVotes.VoteID, tblVotes.newsID, tblVotes.VoterNameSname, tblVotes.VoteBody, tblVotes.DateOfVoting, 
                            tblVotes.voterWebSite, tblVotes.allowShowBit, tblNews.UserName FROM  tblVotes INNER JOIN  tblNews ON tblVotes.newsID = tblNews.NewsID WHERE     (tblVotes.allowShowBit = 0) AND (tblNews.UserName = N'" + Session["UserName"].ToString() + "')");
        }
        if (dt.Rows.Count <= 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Image1.Visible = true;
        }
        else
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
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

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdFill();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int votDelKey = (int)GridView1.DataKeys[e.RowIndex].Value;
        FirstClass db = new FirstClass();

        db.cmd.Parameters.Add("@VoteID", SqlDbType.Int).Value = votDelKey;

        db.exeCommand("sp_tblVotes_DeleteRow");
        grdFill();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int votDelKey = int.Parse(GridView1.SelectedValue.ToString());
        FirstClass db = new FirstClass();

        db.cmd.Parameters.Add("@VoteID" , SqlDbType.Int).Value = votDelKey;
        db.cmd.Parameters.Add("@allowShowBit" , SqlDbType.Bit).Value = 1;

        db.exeCommand("sp_tblVotes_Update");
        grdFill();
    }
}
