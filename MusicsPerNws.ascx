<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MusicsPerNws.ascx.cs" Inherits="MusicsPerNws" %>
<fieldset id="Fieldset2" dir="rtl" style="text-align: center; margin-top: 20px;">
    <center>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
            Text="Label" ForeColor="#FF0000"></asp:Label>&nbsp;</center>
    <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
    Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#333333" GridLines="None" Width="489px" >
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        <asp:TemplateField HeaderText="کد">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("MusicID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="نام فایل">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("MusicDescription") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="موضوع">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("KhanadehName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="لینک دانلود">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/" + Eval("MusicPathFile") %>' Text="لینک دانلود فایل های مربوط به محصول"></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
    </center>
</fieldset>