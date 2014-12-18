using Dominio.Entidades;
using Expressao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace NossosGastos.Filtro
{
    public abstract class FiltroAbstrato<T> where T:class
    {
        protected readonly IExpressao<T> expressao = new Expressao<T>();
        protected virtual void Construir(){
            expressao.Criar(x=>true);
        }

        public Func<T, bool> Compilar()
        {
            return expressao.Compilar();
        }

        public void AdicionaRegra(Expression<Func<T, bool>> exp)
        {
            expressao.E(exp);
        }
    }
}
