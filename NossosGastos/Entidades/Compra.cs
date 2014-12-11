using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace NossosGastos.Entidades
{
    [Table("Compras")]
    public class Compra
    {
        [Key]
        public int CompraID { get; set; }
        public string Nome { get; set; }
        public double Total { get; set; }
        public DateTime DataCompra { get; set; }
        public int Parcelas { get; set; }
        public int FormaPagamentoID { get; set; }
        [ForeignKey("FormaPagamentoID")]
        public FormaPagamento FormaPagamento { get; set; }
        public ICollection<Pagamento> Pagamentos { get; set; }
        public bool VirouCartao { get; set; }
        public Compra()
        {
            Pagamentos = new HashSet<Pagamento>();
        }
    }
}