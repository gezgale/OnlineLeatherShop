<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="AcceptNews.aspx.cs" Inherits="AcceptNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" style="border-right: #666666 1px solid;
        border-top: #666666 1px solid; border-left: #666666 1px solid; border-bottom: #666666 1px solid"
        width="160">
        <tr>
            <td align="center" bgcolor="#d3dadf" style="height: 18px">
                انتخاب محصول جهت تائید</td>
        </tr>
        <tr>
            <td style="padding-right: 4px; padding-left: 4px; vertical-align: top; height: 64px;
                text-align: center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="NewsID" Font-Size="7pt" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    PageSize="45" Width="790px">
                    <Columns>
                        <asp:TemplateField HeaderText="کد محصول">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("NewsID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="عنوان محصول ارسال شده (تیتر)">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NewsTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گروه محصول">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("NewgGroupDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام کاربری ارسال کننده">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام ارسال کننده">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ ارسال">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("DateOfAdding") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="آدرس ایمیل ارسال کننده">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("EMail1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="تائید نمایش" SelectText="تائید" ShowSelectButton="True" />
                        <asp:CommandField DeleteText="حذف" HeaderText="حذف محصول" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>


</asp:Content>