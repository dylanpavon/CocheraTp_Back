
using CocheraTp.Models;
using CocheraTp.Repository.CarpetaRepositoryFactura.Interfaces;
using CocheraTp.Repository.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.CarpetaRepositoryFactura.Implementacion
{
    public class FacturaRepository : IFacturaRepository
    {
        db_cocherasContext _context;

        private SqlConnection _connection;


        public FacturaRepository(db_cocherasContext context)
        {
            _context = context;
            _connection = new SqlConnection("Data Source=DESKTOP-8KIAG7T;Initial Catalog=db_cocheras_final;Integrated Security=True;Trust Server Certificate=True");
        }

        public async Task<List<Dictionary<string, object>>> GetAllSP()
        {
            var result = new List<Dictionary<string, object>>();

            try
            {
                string query = "SP_JOIN_FACTURAS";
                using (var cmd = new SqlCommand(query, _connection))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    // Abrimos la conexión
                    if (_connection.State == System.Data.ConnectionState.Closed)
                        await _connection.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var row = new Dictionary<string, object>();

                            // Iterar sobre cada columna de la fila y agregar al diccionario
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                string columnName = reader.GetName(i);
                                object columnValue = reader.IsDBNull(i) ? null : reader.GetValue(i);
                                row.Add(columnName, columnValue);
                            }

                            // Agregar la fila al resultado
                            result.Add(row);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo de errores o log
                Console.WriteLine(ex.Message);
            }
            finally
            {
                // Asegurarse de cerrar la conexión
                if (_connection.State == System.Data.ConnectionState.Open)
                    await _connection.CloseAsync();
            }

            return result;
        }


        public async Task<List<FACTURA?>> GetAll()
        {
            var facturas = await _context.FACTURAs
                .Include(f => f.DETALLE_FACTURAs)
                    .ThenInclude(d => d.id_vehiculoNavigation)
                        .ThenInclude(v => v.id_tipo_vehiculoNavigation)
                .Include(f => f.DETALLE_FACTURAs)
                    .ThenInclude(d => d.id_abonoNavigation)
                .Include(f => f.id_clienteNavigation)
                .ToListAsync();

            return facturas;
        }

        public async Task<FACTURA?> GetByDocumento(string dni)
        {
            return await _context.FACTURAs
                         .Include(f => f.id_clienteNavigation)
                         .Where(f => f.id_clienteNavigation.nro_documento == dni)
                         .FirstOrDefaultAsync();
        }

        public async Task<FACTURA?> GetById(int id)
        {
            var f = await _context.FACTURAs.Include(f => f.DETALLE_FACTURAs)
                .Where(f => f.id_factura == id).FirstOrDefaultAsync();

            if (f != null)
                return f;
            return null;
        }

        public async Task<FACTURA?> GetFacturaByPatente(string patente)
        {
            return await _context.FACTURAs
                .Include(f => f.DETALLE_FACTURAs) 
                    .ThenInclude(df => df.id_vehiculoNavigation)
                .Where(f => f.DETALLE_FACTURAs.Any(df => df.id_vehiculoNavigation.patente == patente))
                .FirstOrDefaultAsync();
        }

        public async Task<bool?> Create(FACTURA oFactura)
        {
            bool result = true;
            SqlTransaction t = null;
            string query = "SP_INSERTAR_FACTURA";

            try
            {
                if (oFactura != null)
                {

                    _connection.Open();
                    t = _connection.BeginTransaction();
                    var cmd = new SqlCommand(query, _connection, t);


                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@fecha", oFactura.fecha);
                    cmd.Parameters.AddWithValue("@id_cliente", oFactura.id_cliente);
                    cmd.Parameters.AddWithValue("@id_tipo_factura ", oFactura.id_tipo_factura);
                    cmd.Parameters.AddWithValue("@id_forma_pago", oFactura.id_forma_pago);
                    cmd.Parameters.AddWithValue("@id_usuario", oFactura.id_usuario);

                    SqlParameter param = new SqlParameter("@nro_factura", SqlDbType.Int);

                    param.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(param);
                    int filas = cmd.ExecuteNonQuery();

                    result = filas == 1; //ExecuteNonQuery: cantidad de filas afectadas!

                    int nroFactura = (int)param.Value;

                    foreach (var detalle in oFactura.DETALLE_FACTURAs)
                    {
                        var cmdDetalle = new SqlCommand("SP_INSERTAR_DETALLE", _connection, t);
                        cmdDetalle.CommandType = CommandType.StoredProcedure;

                        cmdDetalle.Parameters.AddWithValue("@id_factura", nroFactura);
                        cmdDetalle.Parameters.AddWithValue("@fecha_entrada", detalle.fecha_entrada);
                        cmdDetalle.Parameters.AddWithValue("@fecha_salida", detalle.fecha_salida);
                        cmdDetalle.Parameters.AddWithValue("@id_vehiculo", detalle.id_vehiculo);
                        cmdDetalle.Parameters.AddWithValue("@id_lugar", detalle.id_lugar);
                        cmdDetalle.Parameters.AddWithValue("@id_abono", detalle.id_abono == null ? DBNull.Value : detalle.id_abono);
                        cmdDetalle.Parameters.AddWithValue("@descuento", detalle.descuento == null ? DBNull.Value : detalle.descuento);
                        cmdDetalle.Parameters.AddWithValue("@recargo", detalle.recargo == null ? DBNull.Value : detalle.recargo);
                        cmdDetalle.Parameters.AddWithValue("@precio", detalle.precio);
                        cmdDetalle.ExecuteNonQuery();
                    }

                    t.Commit();
                }
            }
            catch (SqlException sqlEx)
            {
                if (t != null)
                {
                    t.Rollback();
                }
                result = false;
            }
            finally
            {
                if (_connection != null && _connection.State == System.Data.ConnectionState.Open)
                {
                    _connection.Close();
                }
            }
            return result;
        }


        public async Task<bool> DeleteById(int id)
        {
            var f = await _context.FACTURAs.FindAsync(id);

            if (f != null)
                if (_context.FACTURAs.Remove(f) != null)
                    return true;
            return false;
        }

        public async Task<bool> Update(int id, FACTURA? f)
        {
            f = await _context.FACTURAs.FindAsync(id);
            if (f != null)
                if (_context.FACTURAs.Update(f) != null)
                    return true;
            return false;
        }
    }
}
