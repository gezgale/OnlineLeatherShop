using System;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;

/// <summary>
/// Summary description for FirstClass
/// </summary>
public class FirstClass
{
    SqlConnection con;
    public SqlCommand cmd;
    DataTable dt;
    SqlDataAdapter da;


    public FirstClass()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["KhabrNameh"].ConnectionString);
        cmd = new SqlCommand();
        dt = new DataTable();
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);

    }

    public DataTable dbOut(string sql)
    {
        cmd.CommandText = sql;
        con.Open();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SP_dbOut(string SP_Name)
    {
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = SP_Name;
        con.Open();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public void exeCommand(string spName)
    {
        con.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = spName;
        cmd.ExecuteNonQuery();
        con.Close();

    }

    public void exeCommand1(string strName)
    {
        try
        {
            cmd.CommandText = strName;
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch { }
        finally
        {
            con.Close();
        }

    }



    public SqlDataReader dtr101(string sql)
    {
        //cmd = new SqlCommand(sql, con);
        cmd.CommandText = sql;
        con.Open();
        SqlDataReader dtr = cmd.ExecuteReader();

        //dtr.GetString();
        return dtr;
    }

    public string dtShamsi()
    {
        string strMydate;
        PersianCalendar calFar1 = new PersianCalendar();
        strMydate = calFar1.GetYear(DateTime.Now).ToString() + "/" + calFar1.GetMonth(DateTime.Now).ToString("00") + "/" + calFar1.GetDayOfMonth(DateTime.Now).ToString("00");
        return strMydate;
    }

    public int recordDuplicate(string sql)
    {

        int i = 0;
        cmd.CommandText = sql;
        con.Open();
        da.Fill(dt);
        if (dt.Rows.Count <= 0)
        {
            i = 0;
        }
        else
        {
            i = 1;
        }
        con.Close();
        return i;
    }

    public void alarmMailFromSite(string MailFrom, string MailTo, string SubjectOfMail, string BodyOfMail)
    {
        try
        {
            MailMessage message = new MailMessage(MailFrom, MailTo, SubjectOfMail, BodyOfMail);
            message.IsBodyHtml = true;
            SmtpClient emailClient = new SmtpClient("mail.bitasoft.ir");
            System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential("a@bitasoft.ir", "gooliofIRAN*");
            message.ReplyTo = new MailAddress("NoReply_LostPassword@bitasoft.ir", "No Reply");
            //message.Bcc.Add(new MailAddress("najafzade@gmail.com", "Admin_Of_News.bitasoft.ir"));
            message.Priority = MailPriority.High;
            emailClient.UseDefaultCredentials = false;
            emailClient.Credentials = SMTPUserInfo;
            emailClient.Send(message);
        }
        catch (Exception ex)
        {
            // Label3.Text = ex.ToString();
        }
    }
}
