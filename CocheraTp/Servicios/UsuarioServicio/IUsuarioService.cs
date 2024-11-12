using CocheraTp.Constantes;
using CocheraTp.Dato;
using CocheraTp.Dato;
using CocheraTp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Servicios.UsuarioServicio
{
    public interface IUsuarioService
    {
        Task<ResultBase> GetAllUsuario(DtoFrmLogin frmLogin);
        Task<bool> CreateUsuario(USUARIO usuario);
        Task<bool> UpdateUsuario(int id, USUARIO usuario);
        Task<bool> DeleteUsuario(int id);
    }
}
