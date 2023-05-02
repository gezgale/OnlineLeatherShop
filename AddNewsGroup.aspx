<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="AddNewsGroup.aspx.cs" Inherits="AddNewsGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" style="border-right: #666666 1px solid;
        border-top: #666666 1px solid; border-left: #666666 1px solid; border-bottom: #666666 1px solid"
        width="160">
        <tr>
            <td align="center" bgcolor="#d3dadf" style="width: 609px; height: 18px">
                گروه های محصول ایجاد شده در وب سایت</td>
        </tr>
        <tr>
            <td style="padding-right: 4px; padding-left: 4px; vertical-align: top; width: 609px;
                height: 64px; text-align: justify"><fieldset id="Fieldset2" dir="rtl" style="width: 650px; padding-bottom: 20px;">
                    <legend dir="rtl">درج گروه محصول جدید</legend>
                    <table cellpadding="0" cellspacing="0" dir="rtl" style="width: 99%">
                        <tr>
                            <td>
                                شرح گروه:</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Width="265px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="نام و شرح گروه وارد نشده است" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="height: 24px">
                            </td>
                            <td style="height: 24px">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="درج" ValidationGroup="2"
                                    Width="69px" />&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click"
                                        Text="باز نشانی" ValidationGroup="2" Width="69px" />
                                <asp:Label ID="Label3" runat="server" ForeColor="#FF0000" Text="رکورد وارد شده تکراری است"
                                    Visible="False"></asp:Label></td>
                            <td style="height: 24px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                
            </td>
        </tr>
        <tr>
            <td style="padding-right: 4px; padding-left: 4px; vertical-align: top; width: 609px;
                height: 64px; text-align: center">
                <fieldset id="Fieldset1" dir="rtl" style="width: 650px">
                <legend dir="rtl">لیست گروه های محصول به همراه تعداد محصولات موجود در هر یکی از گروه ها</legend>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                    CellPadding="0" ForeColor="#333333" GridLines="None" PageSize="15" Width="98%" style="margin-top: 10px; margin-bottom: 10px" DataKeyNames="nwsID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField EditText="ویرایش" HeaderText="ویرایش" ShowEditButton="True" />
                        <asp:TemplateField HeaderText="کد گروه">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("nwsID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nwsGroup" HeaderText="نام  و شرح گروه" />
                        <asp:TemplateField HeaderText="تعداد محصولات">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("cntArts") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField DeleteText="حذف" HeaderText="حذف" ShowDeleteButton="True" />
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                </fieldset>
                &nbsp;<br />
            </td>
        </tr>
    </table>


</asp:Content>