<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formulaire.aspx.cs" Inherits="Atelier4_2021.Formulaire" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   
    <style>
        #rbGenres label {
            
            padding-left: 5px;
            padding-right: 5px
        }

        #photoUtilisateur {
            height: auto;
            width: 40vw;
        }
    </style>
    <script type="text/javascript">
        function IsSelectionValide(source, args) {
            var groupe = document.getElementById(source.IdGroupe);
            var controlList = groupe.getElementsByTagName("input");
            args.IsValid = false;
            for (var i = 0; i < controlList.length; i++) {
                if (controlList[i].checked) {
                    args.IsValid = true;
                    break;
                }
            }
        }
       

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="well text-primary">Vos coordonnées et informations <span id="Enregistre" runat="server"></span></h1>
        <div class="col-lg-12 well">
            <div class="row">
                <fieldset id='fsCoordonnees' runat="server" class="col-sm-12">

                    <asp:ValidationSummary DisplayMode="BulletList" ID="ValidationSummary1" HeaderText="Veuillez corriger ces erreurs :" runat="server" CssClass="alert alert-danger" />
                    <div visible="false" clientidmode="static" id="LabelValidDiv" class="alert alert-success" runat="server">
                        <asp:Label ID="LabelValid" runat="server" Text="" Visible="False"></asp:Label>
                    </div>
                    <label>Votre genre</label>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <asp:RadioButtonList runat="server" ClientIDMode="Static"
                                RepeatLayout="Flow" RepeatDirection="Horizontal" ID="rbGenres">
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CheckGenre" runat="server"
                                ControleAssocie="rbGenres"
                                CssClass="text-danger"
                                ClientValidationFunction="IsSelectionValide"
                                ErrorMessage="Vous devez sélectionner votre genre"
                                Display="Dynamic"
                                OnServerValidate="IsSelectionValideServer">
                            </asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <asp:Label AssociatedControlID="txtNom" Text="Nom" runat="server" />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtNom" ClientIDMode="Static" runat="server" class="form-control" placeholder="Nom" name="txtNom"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNom" ErrorMessage="Le nom doit être renseigné" CssClass="text-danger" Display="Dynamic">Nom requis</asp:RequiredFieldValidator>
                        </div>

                        <div class="col-sm-6 form-group">
                            <asp:Label AssociatedControlID="txtPrenom" Text="Prenom" runat="server" />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user "></i></span>
                                <asp:TextBox ID="txtPrenom" runat="server" ClientIDMode="Static" class="form-control" placeholder="Prenom" name="txtPrenom"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ControlToValidate="txtPrenom" ErrorMessage="Le prénom doit être renseigné">Le prénom ne peut être vide</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label AssociatedControlID="txtAdresse_P1" Text="Adresse" runat="server" />
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <asp:TextBox class="form-control" ID="txtAdresse_P1" runat="server" name="txtAdresse_P1" placeholder="Entrez votre adresse ici" TextMode="MultiLine" Rows="3" required="true"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdresse_P1" CssClass="text-danger" ErrorMessage="L'adresse doit être renseignée">l'adresse doit être renseignée</asp:RequiredFieldValidator>
                    </div>


                    <div class="row">
                        <div class="col-sm-4 form-group">
                            <asp:Label AssociatedControlID="txtCodePostal" Text="Code postal" runat="server" />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <asp:TextBox CssClass="form-control" ID="txtCodePostal" placeholder="Code postal nnnnn" runat="server" name="txtCodePostal"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtCodePostal" ErrorMessage="Le Code postal doit être défini" CssClass="text-danger" Display="Dynamic">Code Postal requis</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExpCp" runat="server" ControlToValidate="txtCodePostal" ErrorMessage="Code postal non valide" CssClass="text-danger" Display="Dynamic" ValidationExpression="^[0-9]{5,5}$">Code postal non valide</asp:RegularExpressionValidator>

                        </div>
                        <div class="col-sm-4 form-group">
                            <asp:Label AssociatedControlID="txtVille" Text="Ville" runat="server" />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <asp:TextBox CssClass="form-control" ID="txtVille" placeholder="Votre ville" runat="server" name="txtVille"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="text-danger" ControlToValidate="txtVille" Display="Dynamic" ErrorMessage="La ville doit être renseignée">La ville doit être renseignée</asp:RequiredFieldValidator>


                        </div>
                        <div class="col-sm-4 form-group">
                            <asp:Label AssociatedControlID="cbPays" Text="Pays" runat="server" />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <div class="dropdown">
                                    <asp:DropDownList runat="server" ID="cbPays" CssClass="btn btn-default dropdown-toggle"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-sm-6 form-group">

                            <asp:Label AssociatedControlID="txtTelephone" Text="Téléphone" runat="server" />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                <asp:TextBox CssClass="form-control" placeholder="Votre numéro de téléphone" ID="txtTelephone" runat="server" name="txtTelephone"></asp:TextBox>
                            </div>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="text-danger" ErrorMessage="Le numéro n'est pas valide" ControlToValidate="txtTelephone" Display="Static" ValidationExpression="^[0-9]+$">Numéro non valide</asp:RegularExpressionValidator>

                        </div>

                        <div class="col-sm-6 form-group">
                            <asp:Label AssociatedControlID="txtMail" Text="Email" runat="server" />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <asp:TextBox class="form-control" ID="txtMail" runat="server" TextMode="Email" name="txtMail"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" CssClass="text-danger" ControlToValidate="txtMail" Display="Dynamic" ErrorMessage="Veuillez saisir un email">Veuillez saisir un email valide</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" runat="server" ErrorMessage="L'email n'est pas valide" ControlToValidate="txtMail">ex nom@domain.ext</asp:RegularExpressionValidator>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <asp:Label AssociatedControlID="ListeInterets" Text="Vos centres d'intérêts" runat="server" />
                            <asp:CheckBoxList ID="ListeInterets" ClientIDMode="static" runat="server">

                            </asp:CheckBoxList>

                            <asp:CustomValidator ID="CheckInterets" runat="server"
                                ControleAssocie="ListeInterets"
                                CssClass="text-danger"
                                ClientValidationFunction="IsSelectionValide"
                                ErrorMessage="Vous devez sélectionner au moins un centre d'intérêt"
                                OnServerValidate="IsSelectionValideServer">
                            </asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <asp:Label AssociatedControlID="fichier" Text="Votre photo" runat="server" />
                            <asp:FileUpload ID="fichier" ClientIDMode="Static" CssClass="form-control" runat="server" />
                            <asp:CustomValidator ID="CustomValidatorFichier" runat="server"
                                ControleAssocie="fichier"
                                CssClass="text-danger"
                                OnServerValidate="IsFichierValideServer">
                            </asp:CustomValidator>
                            </div>
                            <div class="col-sm-6 form-group">
                            <div class="center-block">
                                <asp:Image ID="photoUtilisateur" ClientIDMode="Static" CssClass="img-thumbnail center-block" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <asp:Button ID="btnSoumission" class="btn btn-primary" runat="server" Text="Envoyer"  OnClick="btnSoumission_Click" />
                        </div>
                    </div>

                </fieldset>

            </div>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
<script type="text/javascript" >
    $(document).ready(
        $("#fichier").change(function () {
            var oFReader = new FileReader();
            oFReader.readAsDataURL(this.files[0]);
            oFReader.onloadend = function (oFREvent) {
                $("#photoUtilisateur").attr('src', oFREvent.target.result);
                $("#photoUtilisateur").attr('visible', true);
            };
        })
    );
      
</script>
</asp:Content>
