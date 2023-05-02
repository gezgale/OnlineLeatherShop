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

public partial class EditNews : System.Web.UI.Page
{
    protected void dropFill()
    {
        FirstClass db = new FirstClass();
        FirstClass db2 = new FirstClass();
        
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();

        dt = db.dbOut("SELECT     TOP 100 PERCENT NewsGroupID, NewgGroupDescription FROM NewsGroups ORDER BY NewgGroupDescription");
        dt2 = db2.dbOut("SELECT     NewsID, NewsGroupID, NewsTitle, newsBody FROM tblNews WHERE     (NewsID = '" + Request.QueryString["NewsID"].ToString() + "')"); 

        DropDownList1.DataSource = dt;

        DropDownList1.DataTextField = "NewgGroupDescription";
        DropDownList1.DataValueField = "NewsGroupID";
        DropDownList1.SelectedValue = dt2.Rows[0][1].ToString();
        TextBox1.Text = dt2.Rows[0][2].ToString();
        TextBox2.Text = dt2.Rows[0][3].ToString();
        DropDownList1.DataBind();
    }

    private string GetNameForFile()
    {
        FirstClass db = new FirstClass();
        string DateNow = db.dtShamsi();
        DateNow = DateNow.Replace("/", "");
        DateNow += DateTime.Now.Hour.ToString().Trim() + DateTime.Now.Minute.ToString().Trim() + DateTime.Now.Second.ToString().Trim();
        return DateNow.Trim();
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
                if (!IsPostBack)
                {
                    dropFill();
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        FirstClass db = new FirstClass();
        if (FileUpload1.HasFile)
        {
            string ImgExtention = "";
            string FileNme = "";
            if (FileUpload1.HasFile)
            {
                ImgExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
            }
            if (ImgExtention != "")
            {
                FileNme = GetNameForFile();
            }
            if (FileUpload1.HasFile)
            {
                string savePath = Server.MapPath("UploadedUserFiles") + "\\" + FileNme + ImgExtention;
                FileUpload1.SaveAs(savePath);
            }

            db.cmd.Parameters.Add("@NewsID", SqlDbType.Int).Value = int.Parse(Request.QueryString["NewsID"].ToString());
            db.cmd.Parameters.Add("@NewsTitle", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
            db.cmd.Parameters.Add("@NewsGroupID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
            db.cmd.Parameters.Add("@NewsPic", SqlDbType.NVarChar).Value = ("UploadedUserFiles") + "\\" + FileNme + ImgExtention;
            db.cmd.Parameters.Add("@newsBody", SqlDbType.NText).Value = TextBox2.Text.ToString();

            db.exeCommand("sp_tblNews_Update");
            Response.Redirect("SelectToEditNews.aspx?ID=Edited=OK");

        }
        else
        {
            db.cmd.Parameters.Add("@NewsID", SqlDbType.Int).Value = int.Parse(Request.QueryString["NewsID"].ToString());
            db.cmd.Parameters.Add("@NewsTitle", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
            db.cmd.Parameters.Add("@NewsGroupID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
            db.cmd.Parameters.Add("@newsBody", SqlDbType.NText).Value = TextBox2.Text.ToString();

            db.exeCommand("sp_tblNews_Update2");
            Response.Redirect("SelectToEditNews.aspx?ID=Edited=OK");
        }
    }
}
