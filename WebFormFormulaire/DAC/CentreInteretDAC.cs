using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using System.Data.SqlClient;
using System.Data;

namespace DAC
{
    public class CentreInteretDAC
    {
        private static CentreInteretDAC _instance = null;
        private static object _verrou = new object();
        /// <summary>
        /// Privatisation du constructeur
        /// </summary>
        private CentreInteretDAC() { }

        /// <summary>
        /// Méthode de création d'instance publique
        /// </summary>
        public static CentreInteretDAC Instance
        {
            get
            {
                lock (_verrou)
                {
                    if (_instance == null)
                    {
                        _instance = new CentreInteretDAC();
                    }
                }
                return _instance;
            }
        }


        public CentreInteret GetCentreInteretById(string idCentreInteret)
        {
            // A noter
            // Vous pouvez faire un return au sein d'un bloc using, la ressource sera tout de même libérée.
            // La ressource sera aussi libérée si une erreur se produisait dans le bloc using
            // Ce qui ne doit pas être fait serait le renvoi de la ressource managée par l'instruction using
            //
            using (SqlConnection cnx = DBConnexion.CreateInstance.GetDBConnection())
            using (SqlCommand cmd = cnx.CreateCommand())
            {
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "SELECT idCentreInteret, designationInteret " +
                    "FROM  dbo.CentreInteret Where idCentreInteret=@idCentreInteret";
                cmd.Parameters.Add(new SqlParameter()
                {
                    Direction = ParameterDirection.Input,
                    ParameterName = "@idCentreInteret",
                    Value = idCentreInteret
                });

                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    return rd.Read() ? ChargerDonnees(rd) : null;

                }
            }

        }

        private HashSet<CentreInteret> AlimenterListe(SqlCommand cmd)
        {
            HashSet<CentreInteret> ci = new HashSet<CentreInteret>();
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    ci.Add(ChargerDonnees(rd));
                }
            }
            return ci;
        }
        private CentreInteret ChargerDonnees(SqlDataReader rd)
        {
            CentreInteret ci = new CentreInteret();
            ci.IdCentreInteret = rd["IdCentreInteret"].ToString();
            ci.DesignationCentreInteret = rd["DesignationInteret"].ToString();
            return ci;
        }

        public HashSet<CentreInteret> GetAll()
        {
            using (SqlConnection cnx = DBConnexion.CreateInstance.GetDBConnection())
            using (SqlCommand cmd = cnx.CreateCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT idCentreInteret, designationInteret " +
                    "FROM  dbo.CentreInteret";
                return AlimenterListe(cmd);
            }

        }
    }
}
