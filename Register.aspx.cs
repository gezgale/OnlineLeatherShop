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
using System.Net;
using System.Globalization; 

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void txtCelar()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        TextBox14.Text = "";
        TextBox15.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label4.Visible = false;
        Label5.Visible = false;

        FirstClass db1 = new FirstClass();
        FirstClass db2 = new FirstClass();
        FirstClass db3 = new FirstClass();

        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();

        dt1 = db1.dbOut(@"SELECT UserName FROM Users WHERE (UserName = N'" + TextBox1.Text + "')");
        dt3 = db3.dbOut(@"SELECT TOP 100 PERCENT EMail1 FROM Users WHERE (EMail1 = N'" + TextBox10.Text + "') ORDER BY EMail1 ");
        if (dt1.Rows.Count <= 0 && dt3.Rows.Count <= 0)
        {
            DateTime dDate = DateTime.Now;
            string strDate = dDate.ToString("h:mm:ss tt");

            string text1 = Dns.GetHostName(), text2;
            text2 = Dns.GetHostByName(text1).AddressList[0].ToString();

            db2.cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
            db2.cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
            db2.cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = TextBox4.Text.Trim();
            db2.cmd.Parameters.Add("@Sname", SqlDbType.NVarChar).Value = TextBox5.Text.Trim();
            db2.cmd.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = TextBox6.Text.Trim();
            db2.cmd.Parameters.Add("@Fax", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();
            db2.cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = TextBox8.Text.Trim();
            //db2.cmd.Parameters.Add("@PicOfUser", SqlDbType.NVarChar).Value = TextBox9.Text.Trim();
            db2.cmd.Parameters.Add("@EMail1", SqlDbType.NVarChar).Value = TextBox10.Text.Trim();
            db2.cmd.Parameters.Add("@WebSite1", SqlDbType.NVarChar).Value = TextBox11.Text.Trim();
            db2.cmd.Parameters.Add("@Shahrestan", SqlDbType.NVarChar).Value = TextBox12.Text.Trim();
            db2.cmd.Parameters.Add("@Ostan", SqlDbType.NVarChar).Value = TextBox13.Text.Trim();
            db2.cmd.Parameters.Add("@KeshVar", SqlDbType.NVarChar).Value = TextBox14.Text.Trim();
            db2.cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBox15.Text.Trim();
            db2.cmd.Parameters.Add("@Notes", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();
            db2.cmd.Parameters.Add("@Banded", SqlDbType.Bit).Value = 0;
            db2.cmd.Parameters.Add("@UserIP1", SqlDbType.NVarChar).Value = text2;
            db2.cmd.Parameters.Add("@RegDate1", SqlDbType.DateTime).Value = DateTime.Now.Date.ToShortDateString();
            db2.cmd.Parameters.Add("@RegTime1", SqlDbType.DateTime).Value = strDate;
            db2.cmd.Parameters.Add("@UserTypeID", SqlDbType.Int).Value = 3;
            db2.exeCommand("sp_Users_Insert");
            //Response.Redirect("Default.aspx?St=RegOk&ID=" + DateTime.Now.Ticks);
            Panel1.Visible = false;
            Panel2.Visible = true;

        }
        else
        {
            if (dt1.Rows.Count > 0)
            {
                Label4.Visible = true;
                TextBox1.Text = "";
            }
            else if (dt3.Rows.Count > 0)
            {
                Label5.Visible = true;
                TextBox10.Text = "";
            }
        }
        dt1.Clear();
        dt3.Clear();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtCelar();
    }
}
