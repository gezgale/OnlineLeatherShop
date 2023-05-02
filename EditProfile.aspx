<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 662px">
        <tr>
            <td style="width: 320px; height: 26px; text-align: right">
                <span style="font-size: 8pt; font-family: Tahoma"><strong>نام کاربری:</strong></span></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox1" runat="server" BackColor="#FFFFC0" Enabled="False"></asp:TextBox>&nbsp;
            </td>
            <td style="width: 455px; height: 26px; text-align: right">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 320px; text-align: right">
                <span style="font-size: 8pt; font-family: Tahoma"><strong>کلمه عبور:</strong></span></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox3" runat="server" BackColor="#FFFFC0" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="ورود کلمه عبور اجباری است" Font-Bold="True" Font-Names="Tahoma"
                    Font-Size="8pt"></asp:RequiredFieldValidator></td>
            <td style="width: 455px; color: #555555">
            </td>
        </tr>
        <tr style="color: #555555">
            <td dir="rtl" style="width: 320px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">نام :</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            <td style="width: 455px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">نام خانوادگی:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            <td style="width: 455px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; text-align: right">
                <span style="font-size: 8pt; font-family: Tahoma"><strong>تلفن:</strong></span></td>
            <td style="font-weight: bold; width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
            <td style="font-weight: bold; width: 455px">
            </td>
        </tr>
        <tr style="font-weight: bold">
            <td style="width: 320px; height: 28px; text-align: right">
                <span style="font-size: 8pt; font-family: Tahoma">فکس:</span></td>
            <td style="width: 360px; height: 28px; text-align: right">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
            <td style="width: 455px; height: 28px">
                <strong><span style="font-size: 8pt; font-family: Tahoma"></span></strong>
            </td>
        </tr>
        <tr>
            <td style="width: 320px; height: 21px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">تلفن همراه:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
            <td style="width: 455px; height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; height: 26px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">آدرس ایمیل:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox10" runat="server" BackColor="#FFFFC0" Enabled="False"></asp:TextBox><strong>
                </strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox10"
                    ErrorMessage="ورود آدرس ایمیل اجباری است" Font-Bold="True" Font-Names="Tahoma"
                    Font-Size="8pt"></asp:RequiredFieldValidator></td>
            <td style="width: 455px; height: 26px; text-align: right">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox10"
                    ErrorMessage="آدرس ایمیل معتبر نیست" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 320px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">وب سایت:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
            <td style="width: 455px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; height: 26px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">شهرستان:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
            <td style="width: 455px; height: 26px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; height: 13px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">استان:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
            <td style="width: 455px; height: 13px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">کشور:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
            <td style="width: 455px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">آدرس:</span></strong></td>
            <td style="width: 360px; height: 26px; text-align: right">
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
            <td style="width: 455px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; height: 37px; text-align: right">
                <strong><span style="font-size: 8pt; font-family: Tahoma">ملاحظات:</span></strong></td>
            <td style="width: 360px; height: 37px; text-align: right">
                <asp:TextBox ID="TextBox2" runat="server" Height="96px" TextMode="MultiLine" Width="325px"></asp:TextBox></td>
            <td style="width: 455px; height: 37px; text-align: center">
            </td>
        </tr>
        <tr>
            <td style="width: 320px; height: 26px">
            </td>
            <td style="width: 360px; height: 26px; text-align: center">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="بروزرسانی" /></td>
            <td style="width: 455px; height: 26px">
            </td>
        </tr>
        <tr>
            <td style="width: 320px">
            </td>
            <td style="width: 360px">
            </td>
            <td style="width: 455px">
            </td>
        </tr>
    </table>
    &nbsp;


</asp:Content>
