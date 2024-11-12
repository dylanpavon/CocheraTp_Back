using CocheraTp.Constantes;
using CocheraTp.Dato;
using CocheraTp.Dato;
using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryUsuario.UnitOfWorkUsuario;
using Microsoft.Extensions.Configuration;
using Microsoft.Graph.Models;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Servicios.UsuarioServicio
{
    public class UsuarioService : IUsuarioService
    {
        private readonly IUnitOfWorkUsuario _unitOfWork;
        private readonly IConfiguration _configuration;

        public UsuarioService(IUnitOfWorkUsuario unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        public async Task<bool> CreateUsuario(USUARIO usuario)
        {
            var creado = await _unitOfWork.UsuarioRepository.CreateUsuario(usuario);
            if (creado)
            {
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<bool> DeleteUsuario(int id)
        {
            var drop = await _unitOfWork.UsuarioRepository.DeleteUsuario(id);
            if (drop)
            {
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<ResultBase> GetAllUsuario(DtoFrmLogin frmLogin)
        {
            ResultBase resultBase = new ResultBase();

            var Lstusuarios = await _unitOfWork.UsuarioRepository.GetAllUsuario();

            if (Lstusuarios != null)
            {

                var Usuario = Lstusuarios.FirstOrDefault(m => m.usuario1 == frmLogin.usuario1 && m.contrasenia == frmLogin.contrasenia);

                if (Usuario == null)
                {
                    resultBase.Result = null;
                    resultBase.Token = null;
                    resultBase.Message = "No existe un usuario con esas credenciales";
                    resultBase.StatusCode = 400;
                    resultBase.Ok = false;

                    return resultBase;
                }
                else
                {
                    var token = GenerateJwtToken(Usuario);
                    resultBase.Result = Usuario;
                    resultBase.Token = token;
                    resultBase.Message = "Todo ok";
                    resultBase.StatusCode = 200;
                    resultBase.Ok = true;

                }

            }
            else
            {
                resultBase.Ok = false;
                resultBase.Result = null;
                resultBase.Token = null;
                resultBase.Message = "Todo mal";
                resultBase.StatusCode = 400;
            }

            return resultBase;
        }

        public async Task<bool> UpdateUsuario(int id, USUARIO usuario)
        {
            var update = await _unitOfWork.UsuarioRepository.UpdateUsuario(id, usuario);
            if (update)
            {
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            return false;
        }


        private string GenerateJwtToken(USUARIO usuario)
        {
            try
            {
                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["AppSettings:Token"]));
                var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                var claims = new[]
                {
                    new Claim(ClaimTypes.Name, usuario.usuario1)
                };

                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(claims),
                    Expires = DateTime.UtcNow.AddHours(1), // Fecha de expiración en UTC
                    NotBefore = DateTime.UtcNow,           // Establecer NotBefore en el momento actual en UTC
                    SigningCredentials = creds
                };

                var tokenHandler = new JwtSecurityTokenHandler();
                var token = tokenHandler.CreateToken(tokenDescriptor);


                return tokenHandler.WriteToken(token);
            }
            catch (Exception ex)
            {
                return null;
            }
        }





    }
}
