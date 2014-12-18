using Dominio.Entidades;
using Expressao;
using NossosGastos.Filtro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NossosGastos.Filtro.Implementacoes
{
    public class FiltroCompra : IFiltro
    {
        private readonly IExpressao<Compra> expressao;
        private readonly Filtros filtro;
        public FiltroCompra(Filtros filtro)
        {
            this.filtro = filtro;
            expressao = new Expressao<Compra>();

            Construir();
        }
        public void Construir()
        {
            expressao.Criar(x => true);

            if (!string.IsNullOrEmpty(filtro.FilterNome))
                expressao.E(x => x.Nome.StartsWith(filtro.FilterNome));
        }


        public Func<Compra, bool> Compilar()
        {
            return expressao.Compilar();
        }
    }
}