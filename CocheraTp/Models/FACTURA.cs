﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace CocheraTp.Models;

public partial class FACTURA
{
    public int id_factura { get; set; }

    public DateTime? fecha { get; set; }

    public int? id_cliente { get; set; }

    public int? id_tipo_factura { get; set; }

    public int? id_forma_pago { get; set; }

    public int? id_usuario { get; set; }

    public virtual ICollection<DETALLE_FACTURA> DETALLE_FACTURAs { get; set; } = new List<DETALLE_FACTURA>();
    [JsonIgnore]
    public virtual CLIENTE id_clienteNavigation { get; set; }
    [JsonIgnore]
    public virtual FORMAS_DE_PAGO id_forma_pagoNavigation { get; set; }
    [JsonIgnore]
    public virtual TIPOS_FACTURA id_tipo_facturaNavigation { get; set; }
    [JsonIgnore]
    public virtual USUARIO id_usuarioNavigation { get; set; }
}