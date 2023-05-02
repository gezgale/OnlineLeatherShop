<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="ShowNewsGroups.aspx.cs" Inherits="ShowNewsGroups" %>

<%@ Register Src="viewNewsGroups.ascx" TagName="viewNewsGroups" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" Visible="true">
    <uc1:viewnewsgroups id="ViewNewsGroups1" runat="server"></uc1:viewnewsgroups>

</asp:Content>

