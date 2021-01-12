using System;
using System.Collections.Generic;
using System.Text;

namespace BOL
{
    [Serializable]
    public class CentreInteret
    {
        string _idCentreInteret;
        string _designationCentreInteret;

        public string IdCentreInteret { get => _idCentreInteret; set => _idCentreInteret = value; }
        public string DesignationCentreInteret { get => _designationCentreInteret; set => _designationCentreInteret = value; }
    }
}
