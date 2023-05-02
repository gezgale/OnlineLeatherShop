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

public partial class AddNewsGroup : System.Web.UI.Page
{
    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT NewsGroups.NewsGroupID AS nwsID, NewsGroups.NewgGroupDescription AS nwsGroup, 
                        COUNT(tblNews.NewsGroupID) AS cntArts FROM   NewsGroups LEFT OUTER JOIN tblNews ON NewsGroups.NewsGroupID = tblNews.NewsGroupID
                        GROUP BY NewsGroups.NewsGroupID, NewsGroups.NewgGroupDescription ORDER BY NewsGroups.NewsGroupID DESC");

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void dbFill()
    {
        FirstClass db = new FirstClass();
        db.cmd.Parameters.Add("@NewgGroupDescription", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();

        db.exeCommand("sp_NewsGroups_Insert");

        grdFill();
        TextBox1.Text = "";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if (int.Parse(Session["UserTypeID"].ToString()) == 1)
            {
                if (!IsPostBack)
                {
                    grdFill();
                }
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

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label3.Visible = false;
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut("SELECT     TOP 1 NewgGroupDescription FROM  NewsGroups WHERE     (NewgGroupDescription = N'"+ TextBox1.Text.Trim() +"')");
        if (dt.Rows.Count <= 0)
        {
            dbFill();
        }
        else
        {
            Label3.Visible = true;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdFill();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        FirstClass db = new FirstClass();
        int usrDelKey = (int)GridView1.DataKeys[e.RowIndex].Value;
        db.cmd.Parameters.Add("@NewsGroupID", SqlDbType.Int).Value = usrDelKey;
        db.exeCommand("sp_NewsGroups_DeleteRow");
        grdFill();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        grdFill();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        grdFill();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        FirstClass db = new FirstClass();
        Label lbl = new Label();
        string txtNewsGroup = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        lbl = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1"));

        db.cmd.Parameters.Add("@NewsGroupID", SqlDbType.Int).Value = int.Parse(lbl.Text.Trim());
        db.cmd.Parameters.Add("@NewgGroupDescription", SqlDbType.NVarChar).Value = txtNewsGroup;

        db.exeCommand("sp_NewsGroups_Update");
        GridView1.EditIndex = -1;
        grdFill();
    }
}
