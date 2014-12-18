using Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NossosGastos.Filtro
{
    public interface IFiltro
    {
        void Construir();

        Func<Compra, bool> Compilar();
    }
}
