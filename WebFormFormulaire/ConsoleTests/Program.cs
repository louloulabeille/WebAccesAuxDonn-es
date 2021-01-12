using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAC;

namespace ConsoleTests
{
    class Program
    {
        static void Main(string[] args)
        {
            DBConnexion.DbConString = Properties.Settings.Default.UserInfoCs;
            UserInfo utilisateur = new UserInfo();
            utilisateur.Nom = "Bost";
            utilisateur.Prenom = "Vincent";
            utilisateur.Adresse = "2, Route de la Maurie Haut";
            utilisateur.Cp = "19270";
            utilisateur.Ville = "Sainte Féréole";
            utilisateur.Email = "vincent.bost@afpa.fr";
            utilisateur.Tel = "06 40 75 27 78";
            utilisateur.IdPays2 = "Fr";
            utilisateur.Genre = Genre.Masculin;
            utilisateur.GenreId = (int)Genre.Masculin;
            utilisateur.CentresInteret = new HashSet<CentreInteret>()
            { new CentreInteret {IdCentreInteret="LEC",DesignationCentreInteret="Lecture"},
            new CentreInteret {IdCentreInteret="INF",DesignationCentreInteret="Informatique"}};
            UserInfoDAC.Instance.AddUserInfo(utilisateur);

        }
    }
}
