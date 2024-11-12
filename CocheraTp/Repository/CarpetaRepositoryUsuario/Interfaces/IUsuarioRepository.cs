using CocheraTp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryUsuario.Interfaces
{
    public interface IUsuarioRepository
    {
        Task<List<USUARIO>> GetAllUsuario();
        Task<bool> CreateUsuario(USUARIO usuario);
        Task<bool> UpdateUsuario(int id, USUARIO usuario);
        Task<bool> DeleteUsuario(int id);
    }
}
