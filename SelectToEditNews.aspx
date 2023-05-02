<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="SelectToEditNews.aspx.cs" Inherits="SelectToEditNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" style="border-right: #666666 1px solid;
        border-top: #666666 1px solid; border-left: #666666 1px solid; border-bottom: #666666 1px solid"
        width="160">
        <tr>
            <td align="center" bgcolor="#d3dadf" style="text-align: center">
                ویرایش محصولات منتشر شده</td>
        </tr>
        <tr>
            <td dir="rtl" style="padding-right: 4px; padding-left: 4px; vertical-align: top;
                height: 64px; text-align: center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="0" DataKeyNames="NewsID" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="40" Width="600px" OnRowDeleting="GridView1_RowDeleting">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="کد محصول">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("NewsID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="موضوع محصول درج شده در وب سایت">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NewsTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText=" ویرایش" SelectText="ویرایش" ShowSelectButton="True" />
                        <asp:CommandField DeleteText="حذف" HeaderText="حذف محصول" ShowDeleteButton="True" />
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                &nbsp;&nbsp;</td>
        </tr>
    </table>

</asp:Content>