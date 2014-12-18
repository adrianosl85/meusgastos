using Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Dominio.Abstratos
{
    public interface IPagamentoRepository
    {
        IQueryable<Pagamento> Pagamentos { get; }
        void Salvar(Pagamento pagamento);
        Pagamento PegarPorID(int pagamentoID);
    }
}
