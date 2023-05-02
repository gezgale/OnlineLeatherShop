<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="EditNews.aspx.cs" Inherits="EditNews" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="nicEdit.js"></script>
<script type="text/javascript">	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });</script>

    <table align="center" width="100%">
        <tr>
            <td style="text-align: right">
                تیتر محصول:</td>
            <td style="text-align: right">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td style="text-align: right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="تیتر محصول وارد نشده است">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr style="color: #555555">
            <td style="text-align: right">
                گروه محصول:</td>
            <td style="text-align: right">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="220px">
                </asp:DropDownList></td>
            <td style="text-align: right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1"
                    ErrorMessage="گروه انتخاب نشده است">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="text-align: right">
                عکس:</td>
            <td style="text-align: right">
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            <td style="text-align: right">
                </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Label1" runat="server" Text="توضیحات محصول:" Width="54px"></asp:Label></td>
            <td style="text-align: right">
                <asp:TextBox ID="TextBox2" runat="server" BackColor="White" Height="132px" TextMode="MultiLine"
                    Width="459px"></asp:TextBox></td>
            <td style="text-align: right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="توضحیات وارد نشده است">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: right">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ذخیره تغییرات"
                    Width="77px" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 57px">
            </td>
            <td style="height: 57px">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td style="height: 57px">
            </td>
        </tr>
    </table>
    &nbsp;


</asp:Content>