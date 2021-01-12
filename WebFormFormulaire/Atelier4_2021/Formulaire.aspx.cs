using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAC;

namespace Atelier4_2021
{
    public partial class Formulaire : System.Web.UI.Page
    {
        private bool _modification = false;

        public bool Modification { get => _modification; set => _modification = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterExpandoAttribute(CheckInterets.ClientID, "IdGroupe", ListeInterets.ID);
            Page.ClientScript.RegisterExpandoAttribute(CheckGenre.ClientID, "IdGroupe", rbGenres.ID);

            if (!IsPostBack)
            {
                cbPays.DataSource = PaysDAC.Instance.GetAll(); 
                cbPays.DataMember = nameof(Pays);
                cbPays.DataTextField = nameof(Pays.LibellePays);
                cbPays.DataValueField = nameof(Pays.IdPays2);
                cbPays.DataBind();
                cbPays.SelectedValue = "FR";
                rbGenres.DataSource = ChargerGenres();
                rbGenres.DataBind();
                ListeInterets.DataSource = CentreInteretDAC.Instance.GetAll();
                ListeInterets.DataMember = nameof(CentreInteret);
                ListeInterets.DataTextField = nameof(CentreInteret.DesignationCentreInteret);
                ListeInterets.DataValueField = nameof(CentreInteret.IdCentreInteret);
                ListeInterets.DataBind();

                //charge les données
                if ( !string.IsNullOrEmpty(Request.QueryString.Get("idUser")) )
                {
                    UserInfo user = UserInfoDAC.Instance.GetUserInfoById(int.Parse(Request.QueryString.Get("idUser")));
                    Modification = true;
                    RemplieChamp(user);

                }
                else
                {
                    Modification = false;
                }
            }

            // Page.Validate();
            // if (Page.IsValid)

        }
        protected void btnSoumission_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int id;
                ChargerImage();
                if (Modification == false)
                {
                    id = EnregistrerDonnees();
                }
                else
                {
                    id = int.Parse(Request.QueryString.Get("idUser"));
                    ModificationDonnees();
                }
                Response.Redirect("DonneesEnregistrees?idUser="+id.ToString());
            }
        }
     
        private  List<ListItem> ChargerGenres()
        {
            List<ListItem> genres = new List<ListItem>();

            foreach (var genre in Enum.GetValues(typeof(Genre)))
            {
                genres.Add(new ListItem
                {
                    Text = Enum.GetName(typeof(Genre), genre),
                    Value = genre.ToString()
                });
            }
            return genres;
        }
        protected void IsSelectionValideServer(object source, ServerValidateEventArgs args)
        {
            CustomValidator cV = source as CustomValidator;
            // Récupération de l'attribut ajouté
            string controleID = cV.Attributes["ControleAssocie"];
            // Récupération du contrôle 
            ListControl listeCB = this.Master.FindControl("MainContent").FindControl(controleID) as ListControl;
            args.IsValid = false;
            foreach (ListItem item in listeCB.Items)
            {
                if (item.Selected)
                {
                    args.IsValid = true;
                    break;
                }
            }
        }
        protected void IsFichierValideServer(object source, ServerValidateEventArgs args)
        {
            CustomValidator cV = source as CustomValidator;
            args.IsValid = true;
            if (fichier.HasFile)
            {
                if (fichier.PostedFile.ContentLength > 2000000)
                {
                    args.IsValid = false;
                    cV.IsValid = false;
                    cV.ErrorMessage = "Taille du fichier trop importante";
                }
                String fileExtension = System.IO.Path.GetExtension(fichier.PostedFile.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                bool autorise = false;
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        autorise = true;
                        break;
                    }
                }
                if (!autorise)
                {
                    args.IsValid = false;
                    cV.IsValid = false;
                    cV.ErrorMessage = "Ce type de fichier n'est pas autorisé";
                }
            }
        }
        /// <summary>
        /// méthode qui enregistre les informations du formulaires
        /// </summary>
        private int EnregistrerDonnees( )
        {
            UserInfo user = new UserInfo()
            {
                Nom = txtNom.Text,
                Prenom = txtPrenom.Text,
                Adresse = txtAdresse_P1.Text,
                Email = txtMail.Text,
                Cp = txtCodePostal.Text,
                Ville = txtVille.Text,
                Tel = txtTelephone.Text,
                Genre = ReturnGenreSaisie(rbGenres.SelectedValue),
                GenreId = (int)ReturnGenreSaisie(rbGenres.SelectedValue),
                IdPays2 = cbPays.SelectedValue,
                Img = photoUtilisateur.ImageUrl,
                CentresInteret = ReturnCentreInteretsSaisie(),
            };
            UserInfoDAC.Instance.AddUserInfo(user);
            return user.Id;
        }

        /// <summary>
        /// méthode qui appelle la méthode de modification de l'utilisateur
        /// </summary>
        /// <returns></returns>
        private int ModificationDonnees ()
        {
            UserInfo user = new UserInfo()
            {
                Nom = txtNom.Text,
                Prenom = txtPrenom.Text,
                Adresse = txtAdresse_P1.Text,
                Email = txtMail.Text,
                Cp = txtCodePostal.Text,
                Ville = txtVille.Text,
                Tel = txtTelephone.Text,
                Genre = ReturnGenreSaisie(rbGenres.SelectedValue),
                GenreId = (int)ReturnGenreSaisie(rbGenres.SelectedValue),
                IdPays2 = cbPays.SelectedValue,
                Img = photoUtilisateur.ImageUrl,
                CentresInteret = ReturnCentreInteretsSaisie(),
            };
            UserInfoDAC.Instance.ModifieUserInfo(user);
            return user.Id;
        }

        /// <summary>
        /// méthode qui remplie les différents du formulaire selon utilisateur
        /// </summary>
        /// <param name="user"></param>
        private void RemplieChamp ( UserInfo user )
        {
            rbGenres.SelectedValue = ReturnGenreSaisie(user.GenreId).ToString();
            txtNom.Text = user.Nom;
            txtPrenom.Text = user.Prenom;
            txtAdresse_P1.Text = user.Adresse;
            txtCodePostal.Text = user.Cp;
            txtVille.Text = user.Cp;
            txtMail.Text = user.Email;
            txtTelephone.Text = user.Tel;
            cbPays.SelectedValue = user.IdPays2;
            photoUtilisateur.ImageUrl = user.Img;
            photoUtilisateur.DataBind();
            
        }

        /// <summary>
        /// méthode qui retourne une collection des centre intérets saisie au
        /// au niveau du formulaire
        /// </summary>
        /// <returns></returns>
        private List<CentreInteret> ReturnCentreInteretsSaisie ()
        {
            List<CentreInteret> listeInterets = new List<CentreInteret>();
            foreach ( ListItem item in ListeInterets.Items )
            {
                if ( item.Selected )
                {
                    listeInterets.Add(new CentreInteret()
                    {
                        IdCentreInteret = item.Value,
                        DesignationCentreInteret = item.Text,
                    }) ;
                }
            }
            return listeInterets;
        }

        /// <summary>
        /// retourne le genre sélectionné dans le fomulaire
        /// </summary>
        /// <returns></returns>
        private Genre ReturnGenreSaisie( string genre )
        {
            switch (genre)
            {
                case "Féminin":
                    return Genre.Féminin;
                case "Masculin":
                    return Genre.Masculin;
                default:
                    return Genre.Neutre;
            }
        }

        /// <summary>
        /// méthode qui retourne le genre selon la valeur numérique
        /// </summary>
        /// <param name="genre"></param>
        /// <returns></returns>
        private Genre ReturnGenreSaisie ( int genre )
        {
            switch (genre)
            {
                case 1:
                    return Genre.Masculin;
                case 2:
                    return Genre.Féminin;
                default:
                    return Genre.Neutre;
            }
        }

        private void ChargerImage()
        {
            if (fichier.HasFile)
            {
                try
                {
                    string filepath = Server.MapPath($"~/Images/");
                    string s_newfilename = $"{Path.GetRandomFileName()}{Path.GetExtension(fichier.PostedFile.FileName)}";
                    fichier.PostedFile.SaveAs($"{filepath}{s_newfilename}");
                    photoUtilisateur.ImageUrl = $"~/Images/{s_newfilename}";
                    photoUtilisateur.Visible = true;
                }

                catch (Exception)
                {

                    Response.Write("File could not be uploaded.");
                }
            }
        }
    }
}