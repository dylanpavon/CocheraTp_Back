using CocheraTp.Repository.CarpetaRepositoryLugar.UnitofWorkLugar;
using CocheraTp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using CocheraTp.Servicios.LugarServicio;


namespace ApiLugares.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LugarController : ControllerBase
    {
        private readonly ILugarService _service;
        public LugarController(ILugarService iservicio)
        {
            _service = iservicio;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<LUGARE>>> GetAll()
        {
            try
            {
                var lugares = await _service.GetAllLugares();
                if (lugares == null || !lugares.Any())
                {
                    return BadRequest();
                }
                return Ok(lugares);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }



        [HttpGet("disponibles")]
        public async Task<ActionResult<IEnumerable<LUGARE>>> GetLugaresDisponibles()
        {
            try
            {
                var lugaresDisponibles = await _service.GetLugaresDisponibles();
                if (lugaresDisponibles == null || !lugaresDisponibles.Any())
                {
                    return BadRequest();
                }
                return Ok(lugaresDisponibles);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }


        [HttpPut()]
        public async Task<IActionResult> ActualizarSección([FromQuery] string id)
        {
            try
            {
                bool actualizado = await _service.ActualizarSecciones(id);
                if (actualizado)
                {
                    return Ok("Estado del lugar actualizado correctamente.");
                }
                return NotFound();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
