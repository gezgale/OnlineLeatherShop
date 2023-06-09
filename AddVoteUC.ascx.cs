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

public partial class AddVoteUC : System.Web.UI.UserControl
{
    protected void voteAdd()
    {
        try
        {
            Label4.Visible = false;
            string text1 = Dns.GetHostName(), text2;
            text2 = Dns.GetHostByName(text1).AddressList[0].ToString();

            FirstClass db = new FirstClass();
            db.cmd.Parameters.Add("@newsID", SqlDbType.Int).Value = int.Parse(Request.QueryString["NewsID"].ToString());
            db.cmd.Parameters.Add("@SenderIP", SqlDbType.NVarChar).Value = text2;
            db.cmd.Parameters.Add("@VoterNameSname", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
            db.cmd.Parameters.Add("@VoterEmail", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();
            db.cmd.Parameters.Add("@VoteBody", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
            db.cmd.Parameters.Add("@voterWebSite", SqlDbType.NVarChar).Value = TextBox4.Text.Trim();
            db.cmd.Parameters.Add("@DateOfVoting", SqlDbType.NVarChar).Value = db.dtShamsi();

            if (Session["UserName"] != null)
            {
                if (int.Parse(Session["UserTypeID"].ToString()) == 1)
                {
                    db.cmd.Parameters.Add("@allowShowBit", SqlDbType.Bit).Value = 1;
                }
                else
                {
                    db.cmd.Parameters.Add("@allowShowBit", SqlDbType.Bit).Value = 0;
                }
            }
            else
            {
                db.cmd.Parameters.Add("@allowShowBit", SqlDbType.Bit).Value = 0;
            }

            db.exeCommand("sp_tblVotes_Insert");
            texClear();
            grdFill();
            Label4.Visible = true;
            Label4.Text = "نظر شما درج شد و پس از تائید نمایش داده خواهد شد";
        }
        catch
        {
            Label4.Visible = true;
            Label4.Text = "شما قبلا یک بار نظر داده اید";
        }
    }

    protected void grdFill()
    {
        FirstClass db = new FirstClass();
        DataTable dt = new DataTable();

        dt = db.dbOut(@"SELECT TOP 100 PERCENT VoteID, newsID, VoterNameSname, VoteBody, DateOfVoting, voterWebSite, allowShowBit FROM tblVotes WHERE (allowShowBit = 1) AND (newsID = '" + int.Parse(Request.QueryString["NewsID"].ToString()) + "')"); 

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    
    protected void texClear()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        grdFill();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        texClear();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        voteAdd();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdFill();
    }
}
