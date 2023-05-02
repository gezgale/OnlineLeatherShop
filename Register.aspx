<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <strong><span style="font-size: 10pt">ثبت نام کاربر جدید</span></strong><br />
        <table style="font-size: 12pt; width: 642px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 320px; height: 14px; text-align: right">
                    <span style="font-size: 8pt"><strong>نام کاربری:</strong></span></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox1" runat="server" BackColor="#FFFFC0" MaxLength="50"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="7pt"
                        ForeColor="#CC0033" Text="نام کاربری تکراری است" Visible="False"></asp:Label><strong><span
                            style="font-size: 8pt"> </span></strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="ورود نام کاربری اجباری است" Font-Bold="True" Font-Names="Tahoma"
                        Font-Size="8pt"></asp:RequiredFieldValidator></td>
                <td style="width: 455px; color: #000000; height: 14px; text-align: right">
                    <span style="font-size: 8pt"><strong>&nbsp;</strong></span></td>
            </tr>
            <tr style="font-weight: bold; font-size: 8pt; font-family: Tahoma">
                <td style="width: 320px; height: 26px; text-align: right">
                    <span>کلمه عبور:</span></td>
                <td style="font-size: 12pt; width: 360px; font-family: Times New Roman; height: 26px;
                    text-align: right">
                    <asp:TextBox ID="TextBox3" runat="server" BackColor="#FFFFC0" MaxLength="50" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                        ErrorMessage="ورود کلمه عبور اجباری است" Font-Bold="True" Font-Names="Tahoma"
                        Font-Size="8pt"></asp:RequiredFieldValidator></td>
                <td style="width: 455px; color: #000000; height: 26px; text-align: right;">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        ForeColor="#FF0033" Text="نام کاربری تکراری است" Visible="False" Width="135px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 320px; height: 26px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">نام :</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px; height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">نام خانوادگی:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">تلفن:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; height: 26px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">فکس:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px; height: 26px">
                    <strong><span style="font-size: 8pt; font-family: Tahoma"></span></strong>
                </td>
            </tr>
            <tr>
                <td style="width: 320px; height: 21px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">تلفن همراه:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox8" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px; height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; height: 26px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">آدرس ایمیل:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox10" runat="server" BackColor="#FFFFC0" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox10"
                        ErrorMessage="ورود آدرس ایمیل اجباری است" Font-Bold="True" Font-Names="Tahoma"
                        Font-Size="8pt"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="7pt"
                        ForeColor="#CC0033" Text="آدرس ایمیل تکراری است" Visible="False" Width="131px"></asp:Label></td>
                <td style="width: 455px; height: 26px; text-align: right;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox10"
                        ErrorMessage="آدرس ایمیل معتبر نیست" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 320px; height: 26px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">وب سایت:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox11" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px; height: 26px; text-align: right;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox11"
                        ErrorMessage="آدرس وب سایت معتبر نمی باشد" Font-Bold="True" Font-Names="Tahoma"
                        Font-Size="8pt" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 320px; height: 26px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">شهرستان:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox12" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px; height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; height: 13px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">استان:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox13" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px; height: 13px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">کشور:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox14" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">آدرس:</span></strong></td>
                <td style="width: 360px; height: 26px; text-align: right">
                    <asp:TextBox ID="TextBox15" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 455px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; height: 37px; text-align: right;">
                    <strong><span style="font-size: 8pt; font-family: Tahoma">ملاحظات:</span></strong></td>
                <td style="width: 31px; height: 37px; text-align: right">
                    <asp:TextBox ID="TextBox2" runat="server" Height="96px" MaxLength="50" TextMode="MultiLine"
                        Width="325px"></asp:TextBox></td>
                <td style="width: 455px; height: 37px; text-align: center">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; height: 26px">
                </td>
                <td style="width: 326px; height: 26px; text-align: right">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ثبت نام" Width="77px" />&nbsp;<asp:Button
                        ID="Button2" runat="server" OnClick="Button2_Click" Text="بازنشانی" Width="77px" /></td>
                <td style="width: 455px; height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 320px; height: 27px;">
                </td>
                <td style="width: 31px; text-align: center; height: 27px;">
                </td>
                <td style="width: 455px; height: 27px;">
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center" Style="vertical-align: middle"
        Visible="False" Width="99%">
        <span style="font-size: 16pt; color: #990000"><strong style="vertical-align: middle"
            unselectable="on">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/registration.jpg" /><br />
            <span style="font-size: 12pt">ثبت نام شما با موفقیت انجام شد<br />
                <br />
                اکنون می توانید با نام کاربری و کلمه عبور وارد وب سایت شوید<br />
                <br />
            </span></strong></span>
    </asp:Panel>


</asp:Content>
