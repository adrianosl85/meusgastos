using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NossosGastos.Filtro
{
    public class Filtros
    {
        public DateTime? FilterDataCompra { get; set; }
        public DateTime? FilterDataVencimento { get; set; }
        public int? FilterMes { get; set; }
        public int? FilterAno { get; set; }
        public int? FilterDia { get; set; }
        public string FilterNome { get; set; }
        public int? FilterParcela { get; set; }
        public int? FilterParcelas { get; set; }
        public IEnumerable<int> FormasPagamento { get; set; }

        public Filtros()
        {
            FormasPagamento = new HashSet<int>();
        }
    }
}