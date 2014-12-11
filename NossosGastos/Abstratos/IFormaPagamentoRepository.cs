using NossosGastos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NossosGastos.Abstratos
{
    public interface IFormaPagamentoRepository
    {
        IQueryable<FormaPagamento> FormasPagamento { get; }
        void Salvar(FormaPagamento formaPagamento);
        void RemoverFormaPagamento(int formaPagamentoID);
        FormaPagamento PegarPorID(int formaPagamentoID);
    }
}
