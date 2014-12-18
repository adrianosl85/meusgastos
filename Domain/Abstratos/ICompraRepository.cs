using Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Abstratos
{
    public interface ICompraRepository
    {
        IQueryable<Compra> Compras { get; }
        void Salvar(Compra compra);
        void RemoverFormaPagamento(int compraID);
        Compra PegarPorID(int compraID);
    }
}
