using Dominio.Entidades;
using Expressao;
using NossosGastos.Filtro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NossosGastos.Filtro.Implementacoes
{
    public class FiltroCategoria : FiltroAbstrato<Categoria>
    {
        
        private readonly Filtros filtro;
        public FiltroCategoria(Filtros filtro)
        {
            this.filtro = filtro;

            Construir();
        }

        protected override void Construir()
        {
            base.Construir();

            if (!string.IsNullOrEmpty(filtro.FilterNome))
                expressao.E(x => x.NomeCategoria.StartsWith(filtro.FilterNome));
        }
    }
}