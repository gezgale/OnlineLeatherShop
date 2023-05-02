<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddVoteUC.ascx.cs" Inherits="AddVoteUC" %>
<fieldset id="Fieldset2" dir="rtl" style="width: 98%; text-align: justify;">
    <legend dir="rtl">لطفا نظر خود را در مورد این خبر درج فرمائید</legend>
    <table cellpadding="0" cellspacing="0" dir="rtl" style="margin-top: 20px; margin-bottom: 20px;"
        width="100%">
        <tr>
            <td>
                نام و نام خانوادگی:</td>
            <td style="text-align: right">
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="80"></asp:TextBox></td>
            <td style="width: 237px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="نام وارد نشده است"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                آدرس ایمیل:</td>
            <td style="text-align: right" dir="ltr">
                <asp:TextBox ID="TextBox2" runat="server" MaxLength="80"></asp:TextBox></td>
            <td style="width: 237px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="ایمیل وارد شده صحیح نیست" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                وب سایت:</td>
            <td dir="ltr" style="text-align: right">
                <asp:Label ID="Label3" runat="server" Font-Names="Tahoma" Font-Size="8pt" 
                    Text="Example:&gt;   http://www.YourSite.ir"></asp:Label>&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" MaxLength="150"></asp:TextBox></td>
            <td style="width: 237px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4"
                    ErrorMessage="آدرس وب سایت صحیح نیست" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                متن نظر:</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Height="76px" MaxLength="250" TextMode="MultiLine"
                    Width="286px"></asp:TextBox></td>
            <td style="width: 237px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="متن نظر وارد نشده است"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="درج نظر" Width="60px" />&nbsp;<asp:Button
                    ID="Button2" runat="server" OnClick="Button2_Click" Text="باز نشانی" Width="60px" /></td>
            <td style="width: 237px">
            </td>
        </tr>
        <tr>
            <td style="height: 19px">
            </td>
            <td style="height: 19px">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#FF0000" Text="نظر شما درج شد و پس از تائید نمایش داده خواهد شد" Visible="False"></asp:Label></td>
            <td style="width: 237px; height: 19px">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="95%" style="margin-top: 30px" ShowHeader="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="8">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <fieldset id="Fieldset1" dir="rtl" style="width: 98%; text-align: justify;">
                                    <table align="center" cellpadding="0" cellspacing="0" dir="rtl" lang="fa" width="80%">
                                        <tr>
                                            <td>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("voterWebSite") %>'
                                                    Text='<%# Eval("VoterNameSname") %>'></asp:HyperLink>
                                            </td>
                                            <td dir="ltr">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("DateOfVoting") %>'></asp:Label></td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                    <hr />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("VoteBody") %>'></asp:Label></fieldset>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings FirstPageText="  اولین  " LastPageText="  آخرین  " Mode="NextPreviousFirstLast"
                        NextPageText="   بعدی   " PreviousPageText="  قبلی  " />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="width: 237px">
            </td>
        </tr>
    </table>
    </fieldset>

