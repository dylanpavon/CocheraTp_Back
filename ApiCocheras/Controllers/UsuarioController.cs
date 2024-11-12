using CocheraTp.Constantes;
using CocheraTp.Dato;
using CocheraTp.Dato;
using CocheraTp.Models;
using CocheraTp.Servicios.UsuarioServicio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;

namespace ApiCocheras.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioService _usuarioService;

        public UsuarioController(IUsuarioService usuarioService)
        {
            _usuarioService = usuarioService;
        }

        [HttpPost("PostLogin")]
        public async Task<ActionResult<ResultBase>> Login([FromBody] DtoFrmLogin frmUsuario)
        {
            ResultBase resultBase = new ResultBase();
            try
            {

                if ((frmUsuario.usuario1 == null || frmUsuario.usuario1 == "") || (frmUsuario.contrasenia == null || frmUsuario.contrasenia == ""))
                {
                    resultBase.Ok = false;
                    resultBase.StatusCode = 400;
                    resultBase.Message = "El usuario o contraseña son requeridos.";

                    return resultBase;
                }
                else
                {
                    resultBase = await _usuarioService.GetAllUsuario(frmUsuario); // aca se le asigna a resultBase 
                    return resultBase;
                }

            }
            catch (Exception ex)
            {
                resultBase.Ok = false;
                resultBase.StatusCode = 400;
                resultBase.Message = "Algo ocurrio en el servidor.";

                return resultBase;
            }
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
