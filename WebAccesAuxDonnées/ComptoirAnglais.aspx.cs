using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

namespace WebAccesAuxDonnées
{
    public partial class ComptoirAnglais : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection sConnection = new SqlConnection(RecupererChaineConnexion("ComptoirAnglais"));
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
                return connexionConfiguration.ConnectionStrings.ConnectionStrings[nomCle].ToString();
            else
                return string.Empty;
        }
    }
}