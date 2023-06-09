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

public partial class MusicsPerNws : System.Web.UI.UserControl
{
    protected void grdFill()
    {
        if (Session["UserName"] == null)
        {
            Label4.Text = "لطفا برای مشاهده فایلهای ضمیمه مربوط به این ارسال با نام کاربری وارد سیستم شوید";
        }
        else
        {
            FirstClass db = new FirstClass();
            DataTable dt = new DataTable();

            dt = db.dbOut("SELECT     TOP 100 PERCENT MusicID, MusicArticleID, MusicDescription, KhanadehName, MusicPathFile FROM    tblMusics  WHERE     (MusicArticleID = '" + int.Parse(Request.QueryString["NewsID"].ToString()) + "')  ORDER BY MusicDescription");
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                Label4.Text = "تعداد فایلهای ضمیمه مربوط به این ارسال = " + dt.Rows.Count.ToString() + " مورد ";
            }
            else
            {
                Label4.Text = "هیچ عنوان فایل ضمیمه ای برای این ارسال یافت نشد";
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        grdFill();
    }
}
