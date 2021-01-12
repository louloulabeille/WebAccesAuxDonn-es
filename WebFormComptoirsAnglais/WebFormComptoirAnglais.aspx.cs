using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormComptoirsAnglais
{
    public partial class WebFormComptoirAnglais : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource sqlData = Source(StringConnexion("WebFormComptoirsAnglais.Properties.Settings.dataComptoiranglais")
                , "select distinct CategoryID, CategoryName from Categories order by CategoryName");

            SqlDataSource sqlDataProduit = Source(StringConnexion("WebFormComptoirsAnglais.Properties.Settings.dataComptoiranglais")
                , "select distinct CategoryID, CategoryName from Categories order by CategoryName");

            CategorieProduitDropDownList.DataSource = sqlData;
            CategorieProduitDropDownList.DataBind();
        }

        /// <summary>
        /// méthode qui retourne un sqlDataSource
        /// </summary>
        /// <param name="dataname"></param>
        /// <returns></returns>
        protected SqlDataSource Source ( string stringConnexion, string commandSql)
        {
            return new SqlDataSource(stringConnexion, commandSql);
        }

        /// <summary>
        /// retour la chaine de connexion vers la base de données
        /// </summary>
        /// <param name="dataName"></param>
        /// <returns></returns>
        protected string StringConnexion ( string dataName )
        {
            Configuration connexionConfiguration = WebConfigurationManager.OpenWebConfiguration("~/");
            if ( connexionConfiguration.ConnectionStrings.ConnectionStrings.Count > 0 )
            {
                return connexionConfiguration.ConnectionStrings.ConnectionStrings[dataName].ToString();
            }
            return string.Empty;
        }
    }
}