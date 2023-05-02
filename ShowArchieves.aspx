<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="ShowArchieves.aspx.cs" Inherits="ShowArchieves" %>

<%@ Register Src="viewArchives.ascx" TagName="viewArchives" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:viewArchives ID="ViewArchives1" runat="server" />

</asp:Content>