<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewArchives.ascx.cs" Inherits="viewArchives" %>
&nbsp;&nbsp;
<table align="center" dir="rtl" lang="fa">
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="12pt"
                Text="تاریخ آرشیو:" style="direction: rtl"></asp:Label></td>
        <td dir="ltr">
<asp:Label ID="Label6" runat="server" CssClass="Label14pt" Text="Label"></asp:Label></td>
    </tr>
</table>
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    BackColor="Transparent" BorderColor="Black" BorderStyle="Solid" CellPadding="0"
    meta:resourcekey="GridView1Resource1" OnPageIndexChanging="GridView1_PageIndexChanging"
    PageSize="50" ShowHeader="False" Width="566px">
    <Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" style="right: 0px; top: 0px" width="100%">
                    <tr>
                        <td dir="rtl" style="background-image: url(images/ofogi101.jpg); height: 26px;
                            text-align: right; width: 708px;">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/CircleSmalBlu.jpg" />
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                Text='<%# "عنوان محصول: " + Eval("nwsTitle") %>'></asp:Label>
                            &nbsp; &nbsp; &nbsp;&nbsp;
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/CircleSmalBlu.jpg" />
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                Text='<%# "گروه: " + Eval("nwsGroup") %>'></asp:Label>
                            &nbsp; &nbsp; &nbsp;
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/images/CircleSmalBlu.jpg" />
                            <asp:Label
                                ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                Text='<%# "تاریخ درج: " + Eval("nwsDtadd") %>'></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt; font-family: Times New Roman">
                        <td dir="rtl" style="border-top-width: thin; padding-right: 5px;
                            padding-left: 5px; border-left-width: thin; border-left-color: black; border-bottom-width: thin;
                            border-bottom-color: black; padding-bottom: 5px; border-top-color: black; padding-top: 5px;
                            border-right-width: thin; border-right-color: black; width: 708px;">
                            <asp:Image ID="Image1" runat="server" Height="70px" ImageAlign="Top" ImageUrl='<%# Eval("NewsPic") %>'
                                Style="clear: none; border-right: black 1px solid; border-top: black 1px solid;
                                float: left; margin: 6px; border-left: black 1px solid; border-bottom: black 1px solid"
                                Width="70px" />
                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text='<%# Eval("NewsPart") %>'></asp:Label>
                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                                Font-Underline="False" ForeColor="#006699" NavigateUrl='<%# "ReadNews.aspx?NewsID=" + Eval("nwsID") %>'>مطالعه ادامه توضیحات محصول . . .</asp:HyperLink><br />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings FirstPageText="&lt;||اولین صفحه" LastPageText="آخرین صفحه||&gt;" Mode="NextPreviousFirstLast"
        NextPageText="صفحه بعدی&gt;&gt;" PreviousPageText="&lt;&lt;صفحه قبلی" />
</asp:GridView>
