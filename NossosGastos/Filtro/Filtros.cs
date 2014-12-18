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
        public string FilterMes { get; set; }
        public string FilterAno { get; set; }
        public string FilterDia { get; set; }
        public string FilterNome { get; set; }
        public int? FilterParcela { get; set; }
        public int? FilterParcelas { get; set; }
        public IEnumerable<int> FormasPagamento { get; set; }
    }
}