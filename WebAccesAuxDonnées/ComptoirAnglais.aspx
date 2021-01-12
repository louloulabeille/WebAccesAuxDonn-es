<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComptoirAnglais.aspx.cs" Inherits="WebAccesAuxDonnées.ComptoirAnglais" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="lister" runat="server"></div>
    <div>
        <%= Liste %>
    </div>
    <div>
        <!--<% 
            //plein de manière
            //<asp:SqlDataSource 
            //ConnectionString="<%$ connectionStrings:connexionApllicationData %>"
        <%
            //ID="SqlDataProduitByCategorie" 
            //runat="server"
            //DataSourceMode="DataReader"
            //SelectCommand="select c.CategoryName as 'Categorie Produit', p.ProductID as 'Produit identifiant', p.ProductName as 'Nom du produit',p.UnitPrice as 'Prix unitaire' from Products as p inner join Categories as c on p.CategoryID = c.CategoryID order by c.CategoryName">
           //</asp:SqlDataSource>
            //<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataProduitByCategorie">
         %>-->
        <asp:Repeater ID="RepeaterListeProduit" runat="server">
            <HeaderTemplate>
                <table class="table">
                    <tr>
                        <th scope="col">Categorie Produit</th>
                        <th scope="col">Produit identifiant</th>
                        <th scope="col">Nom du produit</th>
                        <th scope="col">Prix unitaire</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="label1" runat="server" Text='<%# Eval("Categorie Produit") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="label2" runat="server" Text='<%# Eval("Produit identifiant") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="label5" runat="server" Text='<%# Eval("Nom du produit") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="label3" runat="server" Text='<%# Eval("Prix unitaire") %>'></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        
    </div>

</asp:Content>
