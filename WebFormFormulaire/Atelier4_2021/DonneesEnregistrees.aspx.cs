using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BOL;
using DAC;

namespace Atelier4_2021
{
    public partial class DonneesEnregistrees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( !IsPostBack )
            {
               if (Request.QueryString.Get("idUser") != null )
               {
                    liste.Controls.Add(CreationListeTable(UserInfoDAC.Instance.GetUserInfoById(int.Parse(Request.QueryString.Get("idUser")))));
               }
            }
        }

        protected HtmlTable CreationListeTable( UserInfo user )
        {
            HtmlTable table = new HtmlTable();
            HtmlTableRow entete = new HtmlTableRow();
            HtmlTableCell celEntete1 = new HtmlTableCell();
            HtmlTableCell celEntete2 = new HtmlTableCell();
            HtmlTableCell celEntete3 = new HtmlTableCell();

            table.Attributes.Add("class", "table");

            celEntete1.InnerHtml = "Utilisateur";
            celEntete2.InnerHtml = "Adresse";
            celEntete3.InnerHtml = "";
            entete.Cells.Add(celEntete1);
            entete.Cells.Add(celEntete2);
            entete.Cells.Add(celEntete3);

            table.Rows.Add(entete);
            /*foreach (UserInfo user in listeUser )
            {*/
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cel1 = new HtmlTableCell();
            HtmlTableCell cel2 = new HtmlTableCell();
            HtmlTableCell cel3 = new HtmlTableCell();

            cel1.InnerHtml = user.Nom + " " + user.Prenom;
            cel2.InnerHtml = user.Adresse + " " + user.Cp +" "+ user.Ville +" "+user.Pays.LibellePays;
            cel3.InnerHtml = "<a href=\"Formulaire?idUser=" + user.Id + "\">modification</a>";

            row.Cells.Add(cel1);
            row.Cells.Add(cel2);
            row.Cells.Add(cel3);

            table.Rows.Add(row);
            //}

            return table;
        }
    }
}