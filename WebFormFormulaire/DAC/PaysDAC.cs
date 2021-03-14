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
    /// <summary>
    /// git feacture toto
    /// </summary>
    public class PaysDAC
    {
        private static PaysDAC _instance = null;
        private static object _verrou = new object();
        /// <summary>
        /// Privatisation du constructeur
        /// </summary>
        private PaysDAC() { }

        /// <summary>
        /// Méthode de création d'instance publique
        /// </summary>
        public static PaysDAC Instance
        {
            get
            {
                lock (_verrou)
                {
                    if (_instance == null)
                    {
                        _instance = new PaysDAC();
                    }
                }
                return _instance;
            }
        }


        public Pays GetPaysById(string idPays2)
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

                cmd.CommandText = "SELECT idPays2, idPays3, idPaysNum, LibellePays " +
                    "FROM  dbo.Pays";
                cmd.Parameters.Add(new SqlParameter()
                {
                    Direction = ParameterDirection.Input,
                    ParameterName = "@idPays2",
                    Value = idPays2
                });

                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    return rd.Read() ? ChargerDonnees(rd) : null;

                }
            }

        }
        public HashSet<Pays> GetAll()
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

                cmd.CommandText = "SELECT idPays2, idPays3, idPaysNum, LibellePays " +
                    "FROM  dbo.Pays";

                return AlimenterListe(cmd);
            }

        }
        private HashSet<Pays> AlimenterListe(SqlCommand cmd)
        {
            HashSet<Pays> pays = new HashSet<Pays>();
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    pays.Add(ChargerDonnees(rd));
                }
            }
            return pays;
        }
        private Pays ChargerDonnees(SqlDataReader rd)
        {
            Pays pays = new Pays();
            pays.IdPays2 = rd["IdPays2"].ToString();
            pays.IdPays3 = rd["IdPays3"].ToString();
            pays.IdPaysNum = (int)rd["IdPaysNum"];
            pays.LibellePays = rd["LibellePays"].ToString();
           return pays;
        }

              }
}
