using Dominio.Entidades;
using Expressao;
using NossosGastos.Filtro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NossosGastos.Filtro.Implementacoes
{
    public class FiltroCompra : FiltroAbstrato<Compra>
    {
        
        private readonly Filtros filtro;
        public FiltroCompra(Filtros filtro)
        {
            this.filtro = filtro;

            Construir();
        }

        protected override void Construir()
        {
            base.Construir();

            if (!string.IsNullOrEmpty(filtro.FilterNome))
                expressao.E(x => x.Nome.StartsWith(filtro.FilterNome));

            if (filtro.FormasPagamento.Count() > 0)
            {
                foreach (int formaPagamentoID in filtro.FormasPagamento)
                {
                    expressao.E(x => x.FormaPagamentoID == formaPagamentoID);
                }
            }

            if (filtro.FilterDataCompra.HasValue)
            {
                expressao.E(x => x.DataCompra == filtro.FilterDataCompra);
            }
        }
    }
}