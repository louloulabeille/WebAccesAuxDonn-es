using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;

namespace DAC
{
    public class UserInfoDAC
    {
        private static UserInfoDAC _instance = null;
        private static object _verrou = new object();
        /// <summary>
        /// Privatisation du constructeur
        /// </summary>
        private UserInfoDAC() { }

        /// <summary>
        /// Méthode de création d'instance publique
        /// </summary>
        public static UserInfoDAC Instance
        {
            get
            {
                lock (_verrou)
                {
                    if (_instance == null)
                    {
                        _instance = new UserInfoDAC();
                    }
                }
                return _instance;
            }
        }


        public UserInfo GetUserInfoById(int id)
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

                cmd.CommandText = "SELECT  id , Nom , Prenom , Genre, Adress, Cp, Ville, Tel, idPays2, Email, img, Interets" +
                " FROM dbo.UserInfo Where id=@id";
                cmd.Parameters.Add(new SqlParameter()
                {
                    Direction = ParameterDirection.Input,
                    ParameterName = "@id",
                    Value = id
                });

                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    return rd.Read() ? ChargerDonnees(rd) : null;

                }
            }

        }
        public HashSet<UserInfo> GetAll()
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

                cmd.CommandText = "SELECT  id , Nom , Prenom , Genre, Adress, Cp, Ville, Tel, idPays2, Email, img, Interets" +
                " FROM dbo.UserInfo";

                return AlimenterListe(cmd);
            }

        }
        private HashSet<UserInfo> AlimenterListe(SqlCommand cmd)
        {
            HashSet<UserInfo> usersInfo = new HashSet<UserInfo>();
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    usersInfo.Add(ChargerDonnees(rd));
                }
            }
            return usersInfo;
        }
        // A compléter
        private UserInfo ChargerDonnees(SqlDataReader rd)
        {
            UserInfo userInfo = new UserInfo();
            userInfo.Id = (int)(rd["id"]);
            userInfo.Nom = rd["Nom"].ToString();
            userInfo.Prenom = rd["Prenom"].ToString();
            userInfo.IdPays2 = rd["idPays2"].ToString();
            userInfo.Tel = rd["Tel"].ToString();
            userInfo.Ville = rd["Ville"].ToString();
            userInfo.Img = rd["Img"].ToString();
            userInfo.Adresse = rd["Adress"].ToString();
            userInfo.Cp = rd["Cp"].ToString();
            userInfo.Email = rd["Email"].ToString();
            userInfo.GenreId = int.Parse(rd["Genre"].ToString());
            // A compléter traitement Json centres d'intérêt
            userInfo.CentresInteret = JsonConvert.DeserializeObject<ICollection<CentreInteret>>(rd["Interets"].ToString());
            userInfo.Pays = PaysDAC.Instance.GetPaysById(rd["idPays2"].ToString());
            return userInfo;
        }
        public void AddUserInfo(UserInfo userInfo)
        {

            using (SqlConnection cnx = DBConnexion.CreateInstance.GetDBConnection())
            using (SqlCommand cmd = cnx.CreateCommand())
            {

                cmd.CommandText = "dbo.UserInfo_Insert";
                cmd.CommandType = CommandType.StoredProcedure;

                // Ajout des paramètres 
                SqlParameter parameter;
                parameter = new SqlParameter();
                parameter.ParameterName = "@RETURN_VALUE";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@id";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Nom";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Prenom";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Genre";
                parameter.SqlDbType = SqlDbType.TinyInt;
                parameter.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Adress";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 255;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Cp";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Tel";
                parameter.SqlDbType = SqlDbType.VarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Ville";
                parameter.SqlDbType = SqlDbType.NChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 30;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@idPays2";
                parameter.SqlDbType = SqlDbType.Char;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 2;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Email";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 255;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Interets";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 1055;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@img";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 255;
                cmd.Parameters.Add(parameter);


                // Passage des valeurs

               
                cmd.Parameters["@Nom"].Value = userInfo.Nom;
                cmd.Parameters["@Prenom"].Value = userInfo.Prenom;
                cmd.Parameters["@Genre"].Value = userInfo.GenreId ;
                cmd.Parameters["@Adress"].Value = userInfo.Adresse;
                cmd.Parameters["@Cp"].Value = userInfo.Cp;
                cmd.Parameters["@Tel"].Value = userInfo.Tel ;
                cmd.Parameters["@Ville"].Value = userInfo.Ville ;
                cmd.Parameters["@idPays2"].Value = userInfo.IdPays2;
                cmd.Parameters["@Email"].Value = userInfo.Email;
                // A modifier par sérialisation du tableau des centres d'intérêts retenus
                //string rawJson = "[{\"IdCentreInteret\": \"INF\", \"DesignationCentreInteret\":\"Informatique\"},{\"IdCentreInteret\": \"LCT\", \"DesignationCentreInteret\":\"Lecture\"}]";

                cmd.Parameters["@Interets"].Value = JsonConvert.SerializeObject(userInfo.CentresInteret);
                cmd.Parameters["@img"].Value = userInfo.Img;

                cmd.ExecuteNonQuery();
                userInfo.Id = (int)cmd.Parameters["@id"].Value;
            }
        }

        /// <summary>
        /// méthode qui modifie les données un utilisateurs
        /// </summary>
        /// <param name="user"></param>
        public void ModifieUserInfo(UserInfo userInfo)
        {
            using (SqlConnection cnx = DBConnexion.CreateInstance.GetDBConnection())
            using (SqlCommand cmd = cnx.CreateCommand())
            {

                cmd.CommandText = "dbo.UserInfo_Update";
                cmd.CommandType = CommandType.StoredProcedure;

                // Ajout des paramètres 
                SqlParameter parameter;
                parameter = new SqlParameter();
                parameter.ParameterName = "@RETURN_VALUE";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@id";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Nom";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Prenom";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Genre";
                parameter.SqlDbType = SqlDbType.TinyInt;
                parameter.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Adress";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 255;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Cp";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Tel";
                parameter.SqlDbType = SqlDbType.VarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 50;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Ville";
                parameter.SqlDbType = SqlDbType.NChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 30;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@idPays2";
                parameter.SqlDbType = SqlDbType.Char;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 2;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Email";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 255;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@Interets";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 1055;
                cmd.Parameters.Add(parameter);
                parameter = new SqlParameter();
                parameter.ParameterName = "@img";
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Direction = ParameterDirection.Input;
                parameter.Size = 255;
                cmd.Parameters.Add(parameter);


                // Passage des valeurs


                cmd.Parameters["@Nom"].Value = userInfo.Nom;
                cmd.Parameters["@Prenom"].Value = userInfo.Prenom;
                cmd.Parameters["@Genre"].Value = userInfo.GenreId;
                cmd.Parameters["@Adress"].Value = userInfo.Adresse;
                cmd.Parameters["@Cp"].Value = userInfo.Cp;
                cmd.Parameters["@Tel"].Value = userInfo.Tel;
                cmd.Parameters["@Ville"].Value = userInfo.Ville;
                cmd.Parameters["@idPays2"].Value = userInfo.IdPays2;
                cmd.Parameters["@Email"].Value = userInfo.Email;
                // A modifier par sérialisation du tableau des centres d'intérêts retenus
                //string rawJson = "[{\"IdCentreInteret\": \"INF\", \"DesignationCentreInteret\":\"Informatique\"},{\"IdCentreInteret\": \"LCT\", \"DesignationCentreInteret\":\"Lecture\"}]";

                cmd.Parameters["@Interets"].Value = JsonConvert.SerializeObject(userInfo.CentresInteret);
                cmd.Parameters["@img"].Value = userInfo.Img;

                cmd.ExecuteNonQuery();
            }
        }

    }
}

