﻿using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryModelo.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryModelo.Implementacion
{
    public class ModeloRepository : IModeloRepository
    {
        private readonly db_cocherasContext _context;
        public ModeloRepository(db_cocherasContext context)
        {
            _context = context;
        }
        public async Task<List<MODELO>> GetAllByMarca(int idMarca)
        {
            return await _context.MODELOs
                                 .Where(mo => mo.id_marca == idMarca)
                                 .ToListAsync();
        }

        public async Task<List<MODELO>> GetAllModelos()
        {
            return await _context.MODELOs.ToListAsync();
        }
        public async Task<int> GetMaxIDModelo()
        {
            int max_id = 0;
            max_id = await _context.MODELOs.MaxAsync(m => (int?)m.id_modelo) ?? 0;
            return max_id;
        }
        public async Task<MODELO?> GetModeloByID(int id)
        {
            return await _context.MODELOs.FindAsync(id);
        }
        public async Task<bool> GuardarModelo(MODELO modelo)
        {
            await _context.MODELOs.AddAsync(modelo);
            return true;
        }
    }
}
