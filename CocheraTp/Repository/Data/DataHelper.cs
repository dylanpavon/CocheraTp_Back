using Microsoft.Data.SqlClient;
using Microsoft.Graph.Models.ExternalConnectors;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Repository.Data
{
        public class DataHelper
        {
            private static DataHelper _instancia;
            private SqlConnection _connection;

            private DataHelper()
            {
                _connection = new SqlConnection("Data Source=DESKTOP-8KIAG7T;Initial Catalog=db_cocheras_final;Integrated Security=True;Trust Server Certificate=True");
            }

            public static DataHelper GetInstance()
            {
                if (_instancia == null)
                    _instancia = new DataHelper();

                return _instancia;
            }

            public DataTable ExecuteSPQuery(string sp, List<ParameterSQL>? parametros)
            {
                DataTable t = new DataTable();
                try
                {
                    _connection.Open();
                    var cmd = new SqlCommand(sp, _connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    if (parametros != null)
                    {
                        foreach (var param in parametros)
                            cmd.Parameters.AddWithValue(param.Name, param.Value);
                    }

                    t.Load(cmd.ExecuteReader());
                    _connection.Close();
                }
                catch (SqlException)
                {
                    t = null;
                }

                return t;
            }


            public int ExecuteSPDML(string sp, List<ParameterSQL>? parametros)
            {
                int rows;
                try
                {
                    _connection.Open();
                    var cmd = new SqlCommand(sp, _connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    if (parametros != null)
                    {
                        foreach (var param in parametros)
                            cmd.Parameters.AddWithValue(param.Name, param.Value);
                    }

                    rows = cmd.ExecuteNonQuery();
                    _connection.Close();
                }
                catch (SqlException)
                {
                    rows = 0;
                }

                return rows;
            }
        }
    
}
