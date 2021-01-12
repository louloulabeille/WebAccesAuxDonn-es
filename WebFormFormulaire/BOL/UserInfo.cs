using System;
using System.Collections.Generic;

namespace BOL
{
    public class UserInfo
    {
        private int _id;
        private string _nom;
        private string _prenom;
        private Genre _genre;
        public virtual int GenreId
        {
            get
            {
                return (int)this.Genre;
            }
            set
            {
                Genre = (Genre)value;
            }
        }
        private string _adresse;
        private string _cp;
        private string _tel;
        private string _ville;
        private string _idPays2;
        private string _email;
        private string _interest;
        private string _img;
        public UserInfo()
        {
            this.CentresInteret = new HashSet<CentreInteret>();
        }
        public string Nom { get => _nom; set => _nom = value; }
        public string Prenom { get => _prenom; set => _prenom = value; }
        public string Adresse { get => _adresse; set => _adresse = value; }
        public string Cp { get => _cp; set => _cp = value; }
        public string Tel { get => _tel; set => _tel = value; }
        public string Ville { get => _ville; set => _ville = value; }
        public string IdPays2 { get => _idPays2; set => _idPays2 = value; }

        public virtual ICollection<CentreInteret> CentresInteret { get; set; }
        public Pays Pays { get ; set ; }
        public string Email { get => _email; set => _email = value; }
      
        public string Img { get => _img; set => _img = value; }
        public int Id { get => _id; set => _id = value; }
        public Genre Genre { get => _genre; set => _genre = value; }
    }
}
