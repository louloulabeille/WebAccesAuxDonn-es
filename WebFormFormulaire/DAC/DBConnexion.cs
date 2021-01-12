using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DAC
{
    /// <summary>
    /// Fournit les mécanismes de connexion & déconnexion à la base de données
    /// La chaine de connexion doit être initialisé au démarrage de l'application
    /// </summary>
    public class DBConnexion
    {
        private static DBConnexion _instance = null;
        private SqlConnection _dbCon = null;
        private static object _verrou = new object();
        private static string _dbConString = null;
        /// <summary>
        /// Privatisation du constructeur
        /// </summary>
        private DBConnexion()
        {

        }
        public static string DbConString
        {
            get { return _dbConString; }
            set { _dbConString = value; }
        }
        /// <summary>
        /// Méthode de création d'instance publique
        /// </summary>
        public static DBConnexion CreateInstance
        {
            get
            {
                lock (_verrou)
                {
                    if (_instance == null)
                    {
                        _instance = new DBConnexion();
                    }
                }
                return _instance;
            }
        }
        /// <summary>
        /// Fournit une connexion à la base de données valide
        /// Les informations de connexion sont extraites du fichier de configuration
        /// cette méthode fait appel à une fabrique pattern Factory
        /// </summary>
        /// <returns></returns>
        public SqlConnection GetDBConnection()
        {
            
                _dbCon = new SqlConnection(_dbConString);
                _dbCon.Open();
                return _dbCon;
        }
        /// <summary>
        /// Ferme la connexion ouverte
        /// </summary>
        public void CloseConnection()
        {
            if (_dbCon?.State != ConnectionState.Closed)
            {
                _dbCon.Close();
            }
        }
    }
}