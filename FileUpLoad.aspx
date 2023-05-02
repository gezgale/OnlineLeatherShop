<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="FileUpLoad.aspx.cs" Inherits="MoosigiUpLoad" Title="Untitled Page" %>

<%@ Register Src="logedInChecker.ascx" TagName="logedInChecker" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="text-align: center"> 
        <table style="width: 462px">
            <tr>
                <td style="width: 106px; text-align: right;">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Text="نام محصول:"></asp:Label></td>
                <td style="width: 29px; text-align: right;">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                    </asp:DropDownList></td>
                <td style="width: 29px; text-align: right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="لطفا نام محصولی که قبلا در پرتال ثبت شده را وارد نمائید." ControlToValidate="DropDownList1">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 106px; text-align: right;">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Text="نام فایل:"></asp:Label></td>
                <td style="width: 29px; text-align: right;">
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 29px; text-align: right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="لطفا شرح و نام فایل را وارد نمائید." ControlToValidate="TextBox1">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 106px; text-align: right">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Text="موضوع فایل:"></asp:Label></td>
                <td style="width: 29px; text-align: right">
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="80"></asp:TextBox></td>
                <td style="width: 29px; text-align: right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="لطفا موضوع فایل را وارد نمائید.">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 106px; text-align: right">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Text="مسیر:"></asp:Label></td>
                <td style="width: 29px; text-align: right">
        <asp:FileUpload ID="FileField" size="60" runat="server" Width="196px"  /><asp:Button ID="UploadButton" runat="server" Text=". . . Click to Process Upload" Width="196px" OnClick="UploadButton_Click" /></td>
                <td style="width: 29px; text-align: right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="لطفا فایل مورد نظر را جهت آپلود انتنخاب فرمائید." ControlToValidate="FileField">*</asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
        <br />
        <span style="color: #ff0000">لطفا فایلهای خود را جهت آپلود انتخاب فرمائید</span>&nbsp;<br /> 
        </div>
        <div id="UploadDetails" visible="false" runat="server" style="text-align: left">
        File Name: <span id="FileName" runat="server" /> <br />
        File Content: <span id="FileContent" runat="server" /> <br />
            &nbsp;File Size: <span id="FileSize" runat="server" /> <br />
            
          <span id="Span1" style="color:Red" runat="server" > <br /> </span>
   </div>


</asp:Content>

