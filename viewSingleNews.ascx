<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewSingleNews.ascx.cs" Inherits="viewSingleNews" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="Transparent"
    BorderColor="Black" BorderStyle="Solid" CellPadding="0" meta:resourcekey="GridView1Resource1"
    PageSize="1" ShowHeader="False" Width="750px">
    <Columns>
        <asp:TemplateField meta:resourceKey="TemplateFieldResource1">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" style="right: 0px; top: 0px" width="100%">
                    <tr>
                        <td dir="rtl" style="background-image: url(images/ofogi101.jpg); height: 26px;
                            text-align: right">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/CircleSmalBlu.jpg" />
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="7pt"
                                Text='<%# "عنوان محصول: " + Eval("nwsTitle") %>'></asp:Label>
                            &nbsp; &nbsp; &nbsp;&nbsp;
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/CircleSmalBlu.jpg" />
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="7pt"
                                Text='<%# "گروه: " + Eval("nwsGroup") %>'></asp:Label>
                            &nbsp; &nbsp; &nbsp;
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/images/CircleSmalBlu.jpg" /><asp:Label
                                ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="7pt"
                                Text='<%# "تاریخ درج: " + Eval("nwsDtadd") %>'></asp:Label>
                            &nbsp; &nbsp;
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/images/CircleSmalBlu.jpg" /><asp:Label
                                ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="7pt"
                                Text='<%# "ارسال شده توسط: " + Eval("Expr1") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td dir="rtl" style="border-top-width: thin; padding-right: 5px;
                            padding-left: 5px; border-left-width: thin; border-left-color: black; border-bottom-width: thin;
                            border-bottom-color: black; padding-bottom: 5px; border-top-color: black; padding-top: 5px;
                            border-right-width: thin; border-right-color: black">
                            <asp:Image ID="Image1" runat="server" Height="200px" ImageAlign="Top" ImageUrl='<%# Eval("NewsPic") %>'
                                Style="clear: none; border-right: black 1px solid; border-top: black 1px solid;
                                float: left; margin: 6px; border-left: black 1px solid; border-bottom: black 1px solid"
                                Width="200px" />
                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text='<%# Eval("nwsBodyes") %>'></asp:Label>
                            <br />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
