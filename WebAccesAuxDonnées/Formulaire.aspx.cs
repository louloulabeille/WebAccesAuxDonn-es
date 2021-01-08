using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebAccesAuxDonnées
{
    public partial class Formulaire : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string[] tabForm = Request.Form.AllKeys;

                for (int i = 0; i < tabForm.Length; i++)
                {
                    Response.Write(tabForm[i]);
                    Response.Write( Request.Form.Get(tabForm[i])+"<br/>");
                }
            }   
        }
    }
}