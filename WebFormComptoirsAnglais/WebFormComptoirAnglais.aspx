<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormComptoirAnglais.aspx.cs" Inherits="WebFormComptoirsAnglais.WebFormComptoirAnglais" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList runat="server" ID="CategorieProduitDropDownList" DataTextField="CategoryName" DataValueField="CategoryID">
    </asp:DropDownList>
    <asp:DropDownList ID="ProduitDropDownList" runat="server"></asp:DropDownList>
</asp:Content>
