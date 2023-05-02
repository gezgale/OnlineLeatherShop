using System;
using System.Data;
using System.Net;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class EditProfile : System.Web.UI.Page
{
    protected void textFill()
    {
                FirstClass db101 = new FirstClass();
                DataTable dt = new DataTable();

                dt = db101.dbOut(@"SELECT UerID, UserName, Password, Name, Sname, Phone, Fax, Mobile, EMail1, WebSite1, Shahrestan, Ostan, KeshVar, Address, RegDate1, 
                                RegTime1, UserIP1, UserTypeID, Notes, Banded FROM Users WHERE (UserName = N'" + Session["UserName"].ToString() + "')");

                TextBox1.Text = dt.Rows[0][1].ToString();
                TextBox3.Text = dt.Rows[0][2].ToString();
                TextBox3.TextMode = TextBoxMode.Password;
                TextBox3.Attributes.Add("Value", dt.Rows[0][2].ToString());
                TextBox4.Text = dt.Rows[0][3].ToString();
                TextBox5.Text = dt.Rows[0][4].ToString();
                TextBox6.Text = dt.Rows[0][5].ToString();
                TextBox7.Text = dt.Rows[0][6].ToString();
                TextBox8.Text = dt.Rows[0][7].ToString();
                TextBox10.Text = dt.Rows[0][8].ToString();
                TextBox11.Text = dt.Rows[0][9].ToString();
                TextBox12.Text = dt.Rows[0][10].ToString();
                TextBox13.Text = dt.Rows[0][11].ToString();
                TextBox14.Text = dt.Rows[0][12].ToString();
                TextBox15.Text = dt.Rows[0][13].ToString();
                TextBox2.Text = dt.Rows[0][18].ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if (!IsPostBack)
            {
                textFill();
            }
        }
        else
        {
            Response.Redirect("Default.aspx?ID=NotRegistered_or_Not_LogedIn" + DateTime.Now.Ticks.ToString());
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        
        FirstClass db2 = new FirstClass();

        DateTime dDate = DateTime.Now;
        string strDate = dDate.ToString("h:mm:ss tt");

        string text1 = Dns.GetHostName(), text2;
        text2 = Dns.GetHostByName(text1).AddressList[0].ToString();

        db2.cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = Session["UserName"].ToString();
        db2.cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
        db2.cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = TextBox4.Text.Trim();
        db2.cmd.Parameters.Add("@Sname", SqlDbType.NVarChar).Value = TextBox5.Text.Trim();
        db2.cmd.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = TextBox6.Text.Trim();
        db2.cmd.Parameters.Add("@Fax", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();
        db2.cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = TextBox8.Text.Trim();
        db2.cmd.Parameters.Add("@WebSite1", SqlDbType.NVarChar).Value = TextBox11.Text.Trim();
        db2.cmd.Parameters.Add("@Shahrestan", SqlDbType.NVarChar).Value = TextBox12.Text.Trim();
        db2.cmd.Parameters.Add("@Ostan", SqlDbType.NVarChar).Value = TextBox13.Text.Trim();
        db2.cmd.Parameters.Add("@KeshVar", SqlDbType.NVarChar).Value = TextBox14.Text.Trim();
        db2.cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBox15.Text.Trim();
        db2.cmd.Parameters.Add("@Notes", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();


        db2.exeCommand("sp_Users_Update");
        //Response.Redirect("Default.aspx?ID=UpdateIsOk&Reson=" + DateTime.Now.Ticks);
        textFill();
    }
}
