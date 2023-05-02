<%@ Page Language="C#" MasterPageFile="~/KhabarMaster.master" AutoEventWireup="true" CodeFile="ReadNews.aspx.cs" Inherits="ReadNews" %>

<%@ Register Src="AddVoteUC.ascx" TagName="AddVoteUC" TagPrefix="uc2" %>

<%@ Register Src="viewSingleNews.ascx" TagName="viewSingleNews" TagPrefix="uc1" %>

<%@ Register src="MusicsPerNws.ascx" tagname="MusicsPerNws" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:viewSingleNews ID="ViewSingleNews1" runat="server" />
    <br />
    <uc3:MusicsPerNws ID="MusicsPerNws1" runat="server" />
    <br />
    <br />
    <uc2:AddVoteUC ID="AddVoteUC1" runat="server" />


</asp:Content>

