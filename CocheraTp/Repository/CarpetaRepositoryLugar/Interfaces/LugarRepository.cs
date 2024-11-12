using CocheraTp.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryLugar.Interfaces
{
    public class LugarRepository : ILugarRepository
    {
        private readonly db_cocherasContext _context;
        public LugarRepository(db_cocherasContext context)
        {
            _context = context;
        }

        public async Task<List<LUGARE>> GetAllLugares()
        {
            return await _context.LUGAREs.ToListAsync();
        }

        public async Task<List<LUGARE>> GetLugaresDisponibles()
        {
            return await _context.LUGAREs
                                  .Where(l => l.seccion_uno == false && l.seccion_dos == false)
                                  .ToListAsync();
        }

        public async Task<bool> ActualizarSecciones(string idLugar)
        {
            var lugar = await _context.LUGAREs.FindAsync(idLugar);

            if (lugar == null)
            {
                return false;
            }

            if (lugar.seccion_uno == false && lugar.seccion_dos == false)
            {
                lugar.seccion_uno = true;
                lugar.seccion_dos = true;
            }
            else
            {
                lugar.seccion_uno = false;
                lugar.seccion_dos = false;
            }

            _context.LUGAREs.Update(lugar);
            await _context.SaveChangesAsync();

            return true;
        }
    }
}
