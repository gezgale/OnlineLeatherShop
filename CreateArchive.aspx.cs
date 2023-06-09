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

public partial class CreateArchive : System.Web.UI.Page
{

    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut("SELECT     TOP 100 PERCENT NewsID, NewsTitle, DateOfAdding, ArchivedBit FROM tblNews WHERE (ArchivedBit = 0) ORDER BY NewsID");

        GridView1.DataSource = dt;
        GridView1.EmptyDataText = "هیچگونه مطلبی برای ایجاد آرشیو موجود نمی باشد";
        GridView1.DataBind();

    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("Default.aspx?ID=NotHavePermission&NextID=" + DateTime.Now.Ticks.ToString());
        }
        else
        {
            if (int.Parse(Session["UserTypeID"].ToString()) == 3 || int.Parse(Session["UserTypeID"].ToString()) == 2)
            {
                Response.Redirect("Default.aspx?ID=NotHavePermission&NextID=" + DateTime.Now.Ticks.ToString());
            }
            else
            {
                if (!IsPostBack)
                {
                    grdFill();
                }
            }
        }
        

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FirstClass db = new FirstClass();
        String nwsEdtKey = GridView1.SelectedValue.ToString();

        db.cmd.Parameters.Add("@NewsID", SqlDbType.Int).Value = int.Parse(nwsEdtKey);
        db.cmd.Parameters.Add("@ArchivedBit", SqlDbType.Bit).Value = 1;
        db.cmd.Parameters.Add("@ArchivedDate", SqlDbType.NVarChar).Value = db.dtShamsi();

        db.exeCommand("sp_tblNews_Update4");
        grdFill();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdFill();
    }
}
