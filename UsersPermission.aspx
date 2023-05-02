<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="UsersPermission.aspx.cs" Inherits="UsersPermission" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" style="border-right: #666666 1px solid;
        border-top: #666666 1px solid; border-left: #666666 1px solid; border-bottom: #666666 1px solid"
        width="160">
        <tr>
            <td align="center" bgcolor="#d3dadf" style="height: 18px">
                <strong>
                تعیین سطح دسترسی کاربران</strong></td>
        </tr>
        <tr>
            <td style="padding-right: 4px; padding-left: 4px; vertical-align: top; height: 62px;
                text-align: center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="724px" DataKeyNames="UerID1" Font-Size="7pt" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CellPadding="1" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="کد">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("UerID1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام کاربری">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام و نام خانوادگی">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("NameSname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EmailOfUser" HeaderText="آدرس ایمیل" />
                        <asp:TemplateField HeaderText="نوع کاربر">
                            <ItemTemplate>
                                &nbsp;
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("UtypeDecri") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="120px" Font-Size="7pt">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="محصولات ارسالی">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("CNtOfSentNews") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="banBit" HeaderText="جریمه" />
                        <asp:CommandField HeaderText="حذف کاربر" ShowDeleteButton="True" />
                        <asp:CommandField HeaderText="ویرایش" ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
