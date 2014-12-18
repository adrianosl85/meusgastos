using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Expressao
{
    public interface IExpressao<T> where T:class
    {
        void E(Expression<Func<T, bool>> direita);

        void Ou(Expression<Func<T, bool>> direita);

        void Criar(Expression<Func<T, bool>> direita);

        Func<T, bool> Compilar();
    }
}
