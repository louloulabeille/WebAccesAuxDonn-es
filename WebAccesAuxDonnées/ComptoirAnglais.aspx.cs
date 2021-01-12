using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Text;
using System.Web.UI.HtmlControls;

namespace WebAccesAuxDonnées
{
    public partial class ComptoirAnglais : System.Web.UI.Page
    {
        private StringBuilder _liste;

        public StringBuilder Liste { get => _liste; set => _liste = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection sConnection = new SqlConnection(RecupererChaineConnexion("connexionApllicationData"));
                SqlCommand sqlC = sConnection.CreateCommand();
                sqlC.CommandText = @"select c.CategoryName as 'Categorie du produit', p.ProductID as 'Produit identifiant', " +
                    "p.ProductName as 'Nom du produit',p.UnitPrice as 'Prix unitaire' from Products as p inner join Categories as c on p.CategoryID = c.CategoryID order by c.CategoryName";
                sConnection.Open();
                SqlDataReader sdr = sqlC.ExecuteReader();
                lister.Controls.Add(CreationListeTable(sdr));
                sdr.Close();

                SqlDataReader sdr2 = sqlC.ExecuteReader();
                Liste = LireValeurs(sdr2);
                sdr2.Close();

                sqlC.Dispose();
                sConnection.Close();

                SqlDataSource source = new SqlDataSource(RecupererChaineConnexion("connexionApllicationData"), "select c.CategoryName as 'Categorie Produit', p.ProductID as 'Produit identifiant', p.ProductName as 'Nom du produit', p.UnitPrice as 'Prix unitaire' from Products as p inner join Categories as c on p.CategoryID = c.CategoryID order by c.CategoryName");
                RepeaterListeProduit.DataSource = source;
                RepeaterListeProduit.DataBind();
            }            
        }

        /// <summary>
        ///  méthode de récupération de la chaine de connexion dans le fichier WebConfig
        /// </summary>
        /// <param name="nomCle"></param>
        /// <returns></returns>
        protected string RecupererChaineConnexion( string nomCle )
        {
            Configuration connexionConfiguration = WebConfigurationManager.OpenWebConfiguration("~/");
            if (0 < connexionConfiguration.ConnectionStrings.ConnectionStrings.Count)
            {
                return connexionConfiguration.ConnectionStrings.ConnectionStrings[nomCle].ToString();
            }
            else
                return string.Empty;
        }


        /// <summary>
        /// méthode d'affichage des données de la requete
        /// en  html
        /// </summary>
        /// <param name="sdr"></param>
        /// <returns></returns>
        protected StringBuilder LireValeurs ( SqlDataReader sdr )
        {
            StringBuilder sB = new StringBuilder();
            sB.Append("<table class='table table-dark'><tr>");

            for (int i = 0; i < sdr.FieldCount; i++ )
            {
                sB.Append("<th>"+sdr.GetName(i)+"<th>");
            }

            sB.Append("</tr>");
            while ( sdr.Read() )
            {
                sB.Append("<tr>");
                for (int i = 0; i < sdr.FieldCount; i++)
                {
                    sB.Append("<td>" + sdr.GetValue(i)+ "<td>");
                }
                sB.Append("</tr>");
            }
            sB.Append("</table>");
            return sB;
        }


        /// <summary>
        /// méthode de création du table
        /// </summary>
        /// <param name="sdr"></param>
        /// <returns></returns>
        protected HtmlTable CreationListeTable ( SqlDataReader sdr )
        {
            HtmlTable table = new HtmlTable();
            bool noEntete = false;
            table.Attributes.Add("class","table");

            do
            {
                HtmlTableRow ligneTable = new HtmlTableRow();
                for (int i = 0; i < sdr.FieldCount; i++)
                {
                    HtmlTableCell cellule = new HtmlTableCell();
                    cellule.InnerText = (noEntete) ? sdr.GetValue(i).ToString(): sdr.GetName(i).ToString();
                    
                    ligneTable.Cells.Add(cellule);
                }
                noEntete = true;
                table.Rows.Add(ligneTable);
            } while (sdr.Read());

            return table;
        } 

    }
}