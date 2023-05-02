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

public partial class AddNews : System.Web.UI.Page
{
    //protected void dropFill()
    //{
    //    FirstClass db = new FirstClass();
    //    DataTable dt = new DataTable();

    //    dt = db.dbOut("SELECT     TOP 100 PERCENT NewsGroupID, NewgGroupDescription FROM NewsGroups ORDER BY NewgGroupDescription");

    //    DropDownList1.DataSource = dt;

    //    DropDownList1.DataTextField = "NewgGroupDescription";
    //    DropDownList1.DataValueField = "NewsGroupID";

    //    DropDownList1.DataBind();
    //}

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
        if (Session["UserName"] == null)
        {
            Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        } 
        
        if (!IsPostBack)
        {
            FirstClass db = new FirstClass();
            DataTable dt = new DataTable();

            dt = db.dbOut("SELECT     TOP 100 PERCENT NewsGroupID, NewgGroupDescription FROM NewsGroups ORDER BY NewgGroupDescription");

            DropDownList1.DataSource = dt;

            DropDownList1.DataTextField = "NewgGroupDescription";
            DropDownList1.DataValueField = "NewsGroupID";

            DropDownList1.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
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

            FirstClass db = new FirstClass();

            db.cmd.Parameters.Add("@NewsTitle", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
            db.cmd.Parameters.Add("@NewsGroupID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
            db.cmd.Parameters.Add("@NewsPic", SqlDbType.NVarChar).Value = ("UploadedUserFiles") + "\\" + FileNme + ImgExtention;
            db.cmd.Parameters.Add("@newsBody", SqlDbType.NText).Value = TextBox2.Text.Trim();
            db.cmd.Parameters.Add("@DateOfAdding", SqlDbType.NVarChar).Value = db.dtShamsi();
            db.cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = Session["UserName"].ToString();
            db.cmd.Parameters.Add("@ArchivedBit", SqlDbType.Bit).Value = 0;

            if (int.Parse(Session["UserTypeID"].ToString()) == 3)
            {
                db.cmd.Parameters.Add("@ShowPermiss", SqlDbType.Bit).Value = 0;
            }
            else
            {
                db.cmd.Parameters.Add("@ShowPermiss", SqlDbType.Bit).Value = 1;
            }

            db.exeCommand("sp_tblNews_Insert");
            txtClear();

    }

    protected void txtClear()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        txtClear();
        
    }
}
