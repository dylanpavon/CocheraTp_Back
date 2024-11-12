using CocheraTp.Constantes;
using CocheraTp.Dato;
using CocheraTp.Dato;
using CocheraTp.Models;
using CocheraTp.Servicios.UsuarioServicio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace ApiCocheras.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioService _usuarioService;
        private readonly IConfiguration _configuration;

        public UsuarioController(IUsuarioService usuarioService, IConfiguration configuration)
        {
            _usuarioService = usuarioService;
            _configuration = configuration;
        }

        [HttpPost("PostLogin")]
        public async Task<ActionResult<ResultBase>> Login([FromBody] DtoFrmLogin frmUsuario)
        {
            ResultBase resultBase = new ResultBase();
            try
            {
                if (!EsUsuarioValido(frmUsuario))
                {
                    resultBase.Ok = false;
                    resultBase.StatusCode = 400;
                    resultBase.Message = "El usuario o contraseña son requeridos.";
                    return resultBase;
                }

                // Autenticación del usuario
                resultBase = await _usuarioService.GetAllUsuario(frmUsuario);

                if (!resultBase.Ok)
                {
                    // Credenciales incorrectas
                    resultBase.StatusCode = 401;  // Código HTTP 401 para autenticación fallida
                    resultBase.Message = "Usuario o contraseña incorrectos.";
                    return resultBase;
                }

                // Generar token si las credenciales son válidas
                var tokenHandler = new JwtSecurityTokenHandler();
                var key = _configuration["AppSettings:Token"];
                var keyBytes = Encoding.UTF8.GetBytes(key);

                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new Claim[]
                    {
                new Claim(ClaimTypes.Name, frmUsuario.usuario1)
                    }),
                    Expires = DateTime.UtcNow.AddHours(1),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
                };

                var token = tokenHandler.CreateToken(tokenDescriptor);
                resultBase.Token = tokenHandler.WriteToken(token);

                return resultBase;
            }
            catch (Exception ex)
            {
                resultBase.Ok = false;
                resultBase.StatusCode = 500;
                resultBase.Message = $"Error en el servidor: {ex.Message}";
                return resultBase;
            }
        }
        private bool EsUsuarioValido(DtoFrmLogin frmUsuario)
        {
            return !(string.IsNullOrEmpty(frmUsuario.usuario1) || string.IsNullOrEmpty(frmUsuario.contrasenia));
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> PutUsuario(int id, USUARIO usuario)
        {
            try
            {
                var actualizado = await _usuarioService.UpdateUsuario(id, usuario);
                if (!actualizado)
                {
                    return NotFound("No se pudo actualizar el usuario");
                }
                return Ok("Usuario actualizado con éxito");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al actualizar el usuario: {ex.Message}");
            }
        }


        [HttpPost]
        public async Task<ActionResult<USUARIO>> PostUsuario(USUARIO usuario)
        {
            try
            {
                var resultado = await _usuarioService.CreateUsuario(usuario);
                if (!resultado)
                {
                    return NotFound("No se pudo guardar el usuario");
                }
                return Ok("Usuario guardado con éxito");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al guardar el usuario: {ex.Message}");
            }

        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUsuario(int id)
        {
            try
            {
                var eliminado = await _usuarioService.DeleteUsuario(id);
                if (!eliminado)
                {
                    return NotFound("No se pudo eliminar el usuario");
                }
                return Ok("Usuario eliminado con éxito");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al guardar el usuario: {ex.Message}");
            }
        }
    }
}
