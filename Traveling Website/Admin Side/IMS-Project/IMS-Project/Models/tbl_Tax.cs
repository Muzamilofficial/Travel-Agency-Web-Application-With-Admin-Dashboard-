//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IMS_Project.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Tax
    {
        public int TaxID { get; set; }
        public Nullable<decimal> TaxRate { get; set; }
        public string Taxcode { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<decimal> TaxValue { get; set; }
    }
}
