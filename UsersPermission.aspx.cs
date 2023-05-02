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

public partial class UsersPermission : System.Web.UI.Page
{
    protected void grdFill()
    {
        
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT dbo.Users.UerID AS UerID1, dbo.Users.UserName AS UserName1, dbo.Users.Name + N'  ' + dbo.Users.Sname AS NameSname, 
                      dbo.Users.EMail1 AS EmailOfUser, COUNT(dbo.tblNews.NewsID) AS CNtOfSentNews, dbo.Users.Banded AS banBit, 
                      dbo.UserTypes.UserTypeDescript AS UtypeDecri FROM         dbo.Users INNER JOIN dbo.UserTypes ON dbo.Users.UserTypeID = dbo.UserTypes.UserTypeID LEFT OUTER JOIN
                      dbo.tblNews ON dbo.Users.UserName = dbo.tblNews.UserName GROUP BY dbo.Users.UerID, dbo.Users.UserName, dbo.Users.Name + N'  ' + dbo.Users.Sname, dbo.Users.EMail1, dbo.Users.Banded, 
                      dbo.UserTypes.UserTypeDescript HAVING      (dbo.Users.UserName <> N'admin') ORDER BY COUNT(dbo.tblNews.NewsID) DESC");

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void cmbFill()
    {

    }

    protected string getUsertype(int rowID)
    {
        string strUsertype = "";
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut("SELECT     UerID, UserTypeID FROM Users WHERE (UerID = '"+ rowID +"')");

        strUsertype = dt.Rows[0][1].ToString();
        return strUsertype;
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

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdFill();
        //cmbFill();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        FirstClass db = new FirstClass();
        
        int usrEdtKey = (int)GridView1.DataKeys[e.RowIndex].Value;

        db.cmd.Parameters.Add("@UerID", SqlDbType.Int).Value = usrEdtKey;

        db.exeCommand("sp_Users_DeleteRow");
        grdFill();
        //cmbFill();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        grdFill();
        //cmbFill();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        grdFill();
        cmbFill();
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT     TOP 100 PERCENT UserTypeID, UserTypeDescript FROM    UserTypes ORDER BY UserTypeID");

        DropDownList drop1 = new DropDownList();
        drop1 =  (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1");
        ((DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1")).DataSource = dt;
        ((DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1")).DataValueField = "UserTypeID";
        ((DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1")).DataTextField = "UserTypeDescript";
        ((DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1")).SelectedValue = getUsertype(int.Parse(((Label)GridView1.Rows[e.NewEditIndex].FindControl("Label3")).Text));
        ((DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1")).DataBind();
        
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        FirstClass db = new FirstClass();
        int blAllowshow = 0;

        DropDownList drop1 = new DropDownList();
        Label lbl = new Label();

        drop1 = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1"));
        lbl = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label3"));
        CheckBox sssw = (CheckBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0];
        string milPartner = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

        if (sssw.Checked)
        {
            blAllowshow = 1;
        }
        else
        {
            blAllowshow = 0;
        }

        db.cmd.Parameters.Add("@UerID", SqlDbType.Int).Value = int.Parse(lbl.Text.Trim());
        db.cmd.Parameters.Add("@UserTypeID", SqlDbType.Int).Value = int.Parse(drop1.SelectedValue.ToString());
        db.cmd.Parameters.Add("@Banded", SqlDbType.Bit).Value = blAllowshow;
        db.cmd.Parameters.Add("@EMail1", SqlDbType.NVarChar).Value = milPartner.Trim();

        db.exeCommand("sp_Users_Update2");

        GridView1.EditIndex = -1;
        grdFill();
    }

}
