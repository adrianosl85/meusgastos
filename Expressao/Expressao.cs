using System;
using System.Linq.Expressions;
using System.Linq;

namespace Expressao
{
    public class Expressao<T> : IExpressao<T> where T:class
    {
        private Expression<Func<T, bool>> esquerda;

        public void Criar(Expression<Func<T, bool>> esquerda)
        {
            this.esquerda = esquerda;
        }

        public void E(Expression<Func<T, bool>> direita)
        {
            this.esquerda = this.esquerda.And(direita);
        }

        public void Ou(Expression<Func<T, bool>> direita)
        {
            this.esquerda = this.esquerda.Or(direita);
        }

        public Func<T, bool> Compilar()
        {
            return esquerda.Compile();
        }

    }
}
