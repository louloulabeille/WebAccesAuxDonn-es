using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace BOL
{
    [Serializable]
    public class Pays
    {
        public string IdPays2 { get; set; }
        public string IdPays3 { get; set; }
        public int IdPaysNum { get; set; }
        public string IdDevise { get; set; }
        public string LibellePays { get; set; }
      
    }
}