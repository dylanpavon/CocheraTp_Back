using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryUsuario.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryUsuario.Implementacion
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly db_cocherasContext _context;
        public UsuarioRepository(db_cocherasContext context) { 
            _context = context;
        }

        public async Task<bool> CreateUsuario(USUARIO usuario)
        {
            await _context.USUARIOs.AddAsync(usuario);
            return true;
        }

        public async Task<bool> DeleteUsuario(int id)
        {
            var usuario = await _context.USUARIOs.FindAsync(id);
            if (usuario != null)
            {
                _context.USUARIOs.Remove(usuario);
                return true;
            }
            return false;
        }

        public async Task<List<USUARIO>> GetAllUsuario()
        {
            return await _context.USUARIOs.ToListAsync();
        }

        public async Task<bool> UpdateUsuario(int id, USUARIO usuario)
        {
            var usuario1 = await _context.USUARIOs.FindAsync(id);
            if (usuario1 != null)
            {
                _context.Entry(usuario1).CurrentValues.SetValues(usuario);
                return true;
            }
            return false;
        }
    }
}
