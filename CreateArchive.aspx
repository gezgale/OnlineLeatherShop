<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="CreateArchive.aspx.cs" Inherits="CreateArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Visible="true" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" style="border-right: #666666 1px solid;
        border-top: #666666 1px solid; border-left: #666666 1px solid; border-bottom: #666666 1px solid"
        width="160">
        <tr>
            <td align="center" bgcolor="#d3dadf" style="height: 18px">
                ایجاد آرشیو از محصولات درج شده</td>
        </tr>
        <tr>
            <td style="padding-right: 4px; padding-left: 4px; vertical-align: top; height: 64px;
                text-align: center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="NewsID" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    PageSize="50" Width="600px">
                    <Columns>
                        <asp:TemplateField HeaderText="کد محصول">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("NewsID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گروه محصول درج شده در فروشگاه">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NewsTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ درج">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("DateOfAdding") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="درج در آرشیو" SelectText="آرشیو" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>



</asp:Content>