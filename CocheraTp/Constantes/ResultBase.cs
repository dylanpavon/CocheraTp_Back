using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocheraTp.Constantes
{
    public class ResultBase
    {
        public string Message { get; set; } = null!;
        public bool Ok { get; set; }
        public dynamic Result { get; set; }
        public int StatusCode { get; set; }
        public string Token { get; set; }
    }
}
