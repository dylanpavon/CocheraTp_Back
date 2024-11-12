using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryMarca.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryMarca.Implementacion
{
    public class MarcaRepository : IMarcaRepository
    {
        private readonly db_cocherasContext _context;
        public MarcaRepository(db_cocherasContext context)
        {
            _context = context;
        }
        //public async Task<List<MARCA>> GetAllByMarca(string nombreMarca)
        //{
        //    return await _context.MARCAs
        //                         .Where(m => m.nombre_marca.Contains(nombreMarca))
        //                         .ToListAsync();
        //}

        public async Task<List<MARCA>> GetAllMarcas()
        {
            return await _context.MARCAs.ToListAsync();
        }
        public async Task<int> GetMaxIDMarca()
        {
            int max_id = 0;
            max_id = await _context.MARCAs.MaxAsync(m => (int?)m.id_marca) ?? 0;
            return max_id;
        }

        public async Task<bool> GuardarMarca(MARCA marca)
        {
            await _context.MARCAs.AddAsync(marca);
            return true;
        }
    }
}
