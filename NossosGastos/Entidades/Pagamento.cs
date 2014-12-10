using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace NossosGastos.Entidades
{
    [Table("Pagamentos")]
    public class Pagamento
    {
        public int PagamentoID { get; set; }
        public double Valor { get; set; }
        public int Parcela { get; set; }
        public DateTime DataVencimento { get; set; }
        public int CompraID { get; set; }
        [ForeignKey("CompraID")]
        public Compra Compra { get; set; }
    }

   
}