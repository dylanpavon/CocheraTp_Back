﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace CocheraTp.Models;

public partial class FORMAS_DE_PAGO
{
    public int id_forma_pago { get; set; }

    public string descripcion { get; set; }

    public virtual ICollection<FACTURA> FACTURAs { get; set; } = new List<FACTURA>();
}