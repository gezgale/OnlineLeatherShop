<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="EditVotes.aspx.cs" Inherits="EditVotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging"
        PageSize="25" ShowHeader="False" Style="margin: 10px" Width="500px" DataKeyNames="VoteID" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <PagerSettings FirstPageText="&lt;|اولین" LastPageText="آخرین|&gt;" NextPageText="بعدی&gt;&gt;"
            PreviousPageText="&lt;&lt;قبلی" Mode="NextPreviousFirstLast" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="کد">
                <ItemStyle Width="30px" />
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("VoteID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <fieldset id="Fieldset1" dir="rtl" style="text-align: justify">
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
            <asp:CommandField HeaderText="نمایش" SelectText="نمایش" ShowSelectButton="True">
                <ItemStyle Width="35px" />
            </asp:CommandField>
            <asp:CommandField HeaderText="حذف" ShowDeleteButton="True" DeleteText="حذف">
                <ItemStyle Width="35px" />
            </asp:CommandField>
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="InactiveCaption" ForeColor="White" HorizontalAlign="Center" BorderColor="Transparent" VerticalAlign="Middle" Width="5px" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/VoteNotFound.jpg" Style="margin: 30px"
        Visible="False" />

</asp:Content>
