﻿using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryCliente.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CocheraTp.Servicios.ClienteSevicio
{
    public interface IClienteServicios
    {
        Task<List<ClienteDtoOut>> GetAllClientesDto();
        Task<ClienteDtoOut> GetClienteByIdDto(int id);
        Task<CLIENTE> GetClienteById(int id);
        Task<bool> CreateCliente(CLIENTE cliente);
        Task<bool> UpdateCliente(int id, CLIENTE clienteActualizado);
        Task<CLIENTE> GetClienteByDocumento(string nroDoc);
        Task<bool> DeleteCliente(int id);
    }
}
