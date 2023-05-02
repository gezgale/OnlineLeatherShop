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
using System.IO;

public partial class MoosigiUpLoad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if (int.Parse(Session["UserTypeID"].ToString()) == 1)
            {
                if (!IsPostBack)
                {
                    //grdFill();
                    string UpPath;
                    UpPath = Server.MapPath("UploadedUserFiles");
                    if (!IsPostBack)
                    {
                        cmbFill();
                    }
                    if (!Directory.Exists(UpPath))
                    {
                        Directory.CreateDirectory(UpPath);
                    }
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

    protected void cmbFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut("SELECT TOP 100 PERCENT NewsID, NewsTitle FROM tblNews ORDER BY NewsTitle DESC");
        DropDownList1.DataSource = dt;
        DropDownList1.DataTextField = "NewsTitle";
        DropDownList1.DataValueField = "NewsID";
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


    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileField.HasFile)
        {
            FileName.InnerHtml = FileField.PostedFile.FileName;
            FileContent.InnerHtml = FileField.PostedFile.ContentType;
            FileSize.InnerHtml = FileField.PostedFile.ContentLength.ToString();
            UploadDetails.Visible = true;

            string MyFileName = FileField.PostedFile.FileName;
            string c = GetNameForFile() + "_" + System.IO.Path.GetFileName(MyFileName);

            try
            {
                FileField.PostedFile.SaveAs(Server.MapPath("UploadedUserFiles\\") + c);
                //FileField.PostedFile.SaveAs("\\UploadedUserFiles\\" + c);
                dbIns("UploadedUserFiles\\" + c);
                Span1.InnerHtml = "File Uploaded Succeded.";
            }
            catch
            {
                Span1.InnerHtml = "File Uploaded Field";
                UploadDetails.Visible = false;
            }
        }
        else
        {
            Span1.InnerHtml = "File Uploaded Field";
            UploadDetails.Visible = false;
        }
         
    }

    protected void dbIns(string myMusicPath)
    {
        FirstClass db = new FirstClass();
        db.exeCommand1("INSERT INTO tblMusics (MusicArticleID, MusicDescription, KhanadehName, MusicPathFile) VALUES ('" + DropDownList1.SelectedValue + "', '" + TextBox1.Text.Trim() + "', '" + TextBox2.Text.Trim() + "', '" + myMusicPath + "' )");
    }
}
