using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryRemito.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryRemito.Implementacion
{
    public class RepositoryRemito : IRepostoryRemito
    {
        private readonly db_cocherasContext _context;
        public RepositoryRemito(db_cocherasContext db_CocherasContext)
        {
            _context = db_CocherasContext;
        }
        public async Task<bool> AddRemito(REMITO remito)
        {
            await _context.REMITOs.AddAsync(remito);
            return true;
        }

        public async Task<List<REMITO>> GetAllRemito()
        {
            return await _context.REMITOs.ToListAsync();
        }

        public async Task<REMITO> GetRemito(int id)
        {
            return await _context.REMITOs.FindAsync(id);
        }
        public async Task<int> GetMaxIDRemito()
        {
            int max_id = 0;
            max_id = await _context.REMITOs.MaxAsync(r => (int?)r.id_remito) ?? 0;
            return max_id;
        }

        public async Task<bool> DeleteRemito(int id)
        {
            var remito = await _context.REMITOs.FindAsync(id);
            if (remito != null)
            {
                _context.REMITOs.Remove(remito);
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }
    }
}
