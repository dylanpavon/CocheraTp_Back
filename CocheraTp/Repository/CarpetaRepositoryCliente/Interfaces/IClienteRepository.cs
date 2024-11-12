﻿using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryCliente.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryCliente.Interfaces
{
    public interface IClienteRepository
    {
        Task<List<ClienteDtoOut>> GetAllClientesDto();
        Task<ClienteDtoOut> GetClienteByIdDto(int id);
        Task<CLIENTE> GetClienteById(int id);
        Task<CLIENTE> GetClienteByDocumento(string nroDoc);
        Task<bool> CreateCliente(CLIENTE cliente);
        Task<bool> UpdateCliente(int id, CLIENTE clienteActualizado);
        Task<bool> DeleteCliente(int id);
    }
}
