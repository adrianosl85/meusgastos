using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Dominio.Entidades
{
    [Table("FormasPagamento")]
    public class FormaPagamento
    {
        [Key]
        public int FormaPagamentoID { get; set; }
        public string Nome { get; set; }
        public bool TemVencimento { get; set; }
        public int DiaVencimento { get; set; }
        public ICollection<Compra> Compras { get; set; }
        public string Icone { get; set; }

        public FormaPagamento()
        {
            Compras = new HashSet<Compra>();
        }
    }
}