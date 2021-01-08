<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formulaire.aspx.cs" Inherits="WebAccesAuxDonnées.Formulaire" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-group row">
        <label class="col-4">Sexe :</label> 
        <div class="col-8">
            <div class="custom-control custom-radio custom-control-inline">
                <%--<input name="radio" id="radio_0" type="radio" aria-describedby="radioHelpBlock" checked="checked" class="custom-control-input" value="h" required="required" tabindex="1">--%>
                <label for="radio_0" class="custom-control-label">Homme</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input name="radio" id="radio_1" type="radio" aria-describedby="radioHelpBlock" class="custom-control-input" value="f" required="required"  tabindex="2"> 
                <label for="radio_1" class="custom-control-label">Femme</label>
                </div> 
                    <span id="radioHelpBlock" class="form-text text-muted">Choisissez votre sexe</span>
                </div>
            </div>
            <div class="form-group row">
              <label class="col-4 col-form-label" for="name">Nom :</label> 
              <div class="col-8">
                <input id="name" name="name" placeholder="Dupond" type="text" class="form-control" aria-describedby="nameHelpBlock" required="required" tabindex="3"> 
                <span id="nameHelpBlock" class="form-text text-muted">Saisissez votre nom</span>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-4 col-form-label" for="nickname">Prenom :</label> 
              <div class="col-8">
                <input id="nickname" name="nickname" placeholder="Marie" type="text" class="form-control" aria-describedby="nicknameHelpBlock" required="required" tabindex="4"> 
                <span id="nicknameHelpBlock" class="form-text text-muted">Saisissez votre prénom</span>
              </div>
            </div>
            <div class="form-group row">
              <label for="adress" class="col-4 col-form-label">Adresse :</label> 
              <div class="col-8">
                <input id="adress" name="adress" placeholder="17 avenue George de la Jungle" type="text" class="form-control" aria-describedby="adressHelpBlock" required="required" tabindex="4"> 
                <span id="adressHelpBlock" class="form-text text-muted">Saisissez votre adresse</span>
              </div>
            </div>
            <div class="form-group row">
              <label for="adress1" class="col-4 col-form-label">...</label> 
              <div class="col-8">
                <input id="adress1" name="adress1" placeholder="bat 2" type="text" class="form-control" aria-describedby="adress1HelpBlock" tabindex="5"> 
                <span id="adress1HelpBlock" class="form-text text-muted">Saisissez le reste de l'adresse</span>
              </div>
            </div>
            <div class="form-group row">
                <label for="cp" class="col-4 col-form-label">Code Postal Ville :</label> 
                <div class="col-8">
                    <div class="row">
                        <div class="col-12 col-lg-4">
                            <input id="cp" name="cp" placeholder="75000" type="text" class="form-control" aria-describedby="cpHelpBlock" required="required"tabindex="6"> 
                        </div>
                        <div class="col-12 col-lg-8">
                            <input id="town" name="town" placeholder="Paris" type="text" class="form-control" required="required" tabindex="7">
                        </div>
                    </div>
                    <span id="cpHelpBlock" class="form-text text-muted">Saisie le code postal et la ville</span>
                </div>
            </div>
            <div class="form-group row">
              <label for="country" class="col-4 col-form-label">Pays : </label> 
              <div class="col-8">
                <select id="country" name="country" class="custom-select" aria-describedby="countryHelpBlock" required="required" tabindex="8">
                  <option value="france">France</option>
                  <option value="royaume unie">Royaume Unie</option>
                  <option value="belgique">Belgique</option>
                  <option value="allemagne">Allemagne</option>
                  <option value="italie">Italie</option>
                  <option value="espagne">Espagne</option>
                </select> 
                <span id="countryHelpBlock" class="form-text text-muted">Choisissez le pays de l'adresse</span>
              </div>
            </div>
            <div class="form-group row">
              <label for="courriel" class="col-4 col-form-label">Courriel : </label> 
              <div class="col-8">
                <input id="courriel" name="courriel" placeholder="jhdkjfhkd@mailo.com" type="text" class="form-control" aria-describedby="courrielHelpBlock" required="required" tabindex="9"> 
                <span id="courrielHelpBlock" class="form-text text-muted">Saisissez votre adresse mail</span>
              </div>
            </div>
            <div class="form-group row">
              <label for="telephone" class="col-4 col-form-label">Téléphone : </label> 
              <div class="col-8">
                <input id="telephone" name="telephone" placeholder="0631278451" type="text" class="form-control" aria-describedby="telephoneHelpBlock" required="required" tabindex="10"> 
                <span id="telephoneHelpBlock" class="form-text text-muted">Saisissez votre numéro de téléphone</span>
              </div>
            </div>
            <div class="form-group row">
              <label for="birthday" class="col-4 col-form-label">Date de naissance :</label> 
              <div class="col-5">
                <input id="birthday" name="birthday" placeholder="jj/mm/aaaa" type="date" class="form-control" aria-describedby="birthdayHelpBlock" tabindex="11"> 
                <span id="birthdayHelpBlock" class="form-text text-muted">Saisissez votre date de naissance</span>
              </div>
            </div>
            <div class="form-group row">
                <label class="col-4 col-form-label">Vos centres d'intérêts : </label>
                <div class="col-8">
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <input name="interet" id="interet_0" type="checkbox" aria-describedby="interetHelpBlock" class="custom-control-input" value="1" tabindex="12"> 
                                    <label for="interet_0" class="custom-control-label">Bricolage</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <input name="interet" id="interet_1" type="checkbox" aria-describedby="interetHelpBlock" class="custom-control-input" value="2" tabindex="13"> 
                                    <label for="interet_1" class="custom-control-label">Jardinage</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <input name="interet" id="interet_2" type="checkbox" aria-describedby="interetHelpBlock" class="custom-control-input" value="3" tabindex="14"> 
                                    <label for="interet_2" class="custom-control-label">Lecture</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="custom-controls-stacked">
                                <div class="custom-control custom-checkbox">
                                    <input name="interet" id="interet_3" type="checkbox" aria-describedby="interetHelpBlock" class="custom-control-input" value="4" tabindex="15"> 
                                    <label for="interet_3" class="custom-control-label">Voyages</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span id="interetHelpBlock" class="form-text text-muted">Cochez vos centres d'intérêts</span>
                </div>
            </div>
            <div class="form-group row">
              <div class="offset-4 col-8">
                <button name="submit" type="submit" class="btn btn-primary" tabindex="16">Envoyer</button>
              </div>
            </div>
</asp:Content>
