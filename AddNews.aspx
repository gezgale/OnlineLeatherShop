<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="AddNews" ValidateRequest="false" %>

<%@ Register Src="logedInChecker.ascx" TagName="logedInChecker" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
<script type="text/javascript" src="nicEdit.js"></script>
<script type="text/javascript">	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });</script>


    <table align="center" width="100%">
        <tr>
            <td style="text-align: right; height: 26px;">
                تیتر مقاله:</td>
            <td style="text-align: right; height: 26px;">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td style="text-align: right; height: 26px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="تیتر خبر وارد نشده است">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr style="color: #555555">
            <td style="text-align: right">
                گروه مقاله:</td>
            <td style="text-align: right">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="306px">
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1"
                    ErrorMessage="عکس انتخاب نشده است">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Label1" runat="server" Text="متن خبر:" Width="54px"></asp:Label></td>
            <td style="text-align: right">
                <asp:TextBox ID="TextBox2" runat="server" BackColor="White" Height="132px" TextMode="MultiLine"
                    Width="459px"></asp:TextBox></td>
            <td style="text-align: right">
                </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: right">
                </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="درج" Width="71px" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="بازنشانی" Width="71px" OnClick="Button2_Click" /></td>
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
            <td>
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td>
            </td>
        </tr>
    </table>
    &nbsp;<uc1:logedInChecker ID="LogedInChecker1" runat="server" />

</asp:Content>