using Dominio.Entidades;
using Expressao;
using NossosGastos.Filtro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NossosGastos.Filtro.Implementacoes
{
    public class FiltroPagamento : FiltroAbstrato<Pagamento>
    {
        
        private readonly Filtros filtro;
        public FiltroPagamento(Filtros filtro)
        {
            this.filtro = filtro;

            Construir();
        }

        protected override void Construir()
        {
            base.Construir();

            if (filtro.FilterMes.HasValue)
                expressao.E(x => x.DataVencimento.Month == (filtro.FilterMes + 1));

            if (filtro.FilterAno.HasValue)
                expressao.E(x => x.DataVencimento.Year == filtro.FilterAno);

            if (filtro.FilterDia.HasValue)
                expressao.E(x => x.DataVencimento.Day == filtro.FilterDia);

            if (filtro.FilterDataVencimento.HasValue)
                expressao.E(x => x.DataVencimento == filtro.FilterDataVencimento);
        }
    }
}