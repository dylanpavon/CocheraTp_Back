﻿
using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryFactura.UnitOfWorkFactura;
using CocheraTp.Servicios.FacturaServicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Servicios.FacturaServicio
{
    public class FacturaService : IFacturaService
    {
        private readonly IUnitOfWorkFactura _unitOfWork;
        public FacturaService(IUnitOfWorkFactura unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<bool?> CreateFactura(FACTURA? f)
        {
            var agregado = await _unitOfWork.FacturaRepository.Create(f);
            if ((bool)agregado)
            {
                await _unitOfWork.SaveChangesAsync();
            }
            return true;
        }

        public async Task<bool> DeleteFactura(int id)
        {
            var eliminado = await _unitOfWork.FacturaRepository.DeleteById(id);
            if (eliminado)
            {
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<List<FACTURA?>> GetAllFacturas()
        {
            return await _unitOfWork.FacturaRepository.GetAll();
        }

        public async Task<FACTURA?> GetByDocumento(string dni)
        {
            return await _unitOfWork.FacturaRepository.GetByDocumento(dni);
        }

        public async Task<FACTURA?> GetFacturaById(int id)
        {
            return await _unitOfWork.FacturaRepository.GetById(id);
        }

        public async Task<FACTURA?> GetFacturaByPatente(string patente)
        {
            return await _unitOfWork.FacturaRepository.GetFacturaByPatente(patente);
        }

        public async Task<bool> UpdateFactura(int id, FACTURA facturaActualizada)
        {
            var actualizado = await _unitOfWork.FacturaRepository.Update(id, facturaActualizada);
            if (actualizado)
            {
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            return false;
        }
    }
}
