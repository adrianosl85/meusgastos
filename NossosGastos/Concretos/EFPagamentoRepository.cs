using NossosGastos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NossosGastos.Concretos
{
    public class EFPagamentoRepository
    {
        private readonly EFDBContas context;
        public EFPagamentoRepository()
        {
            context = new EFDBContas();
        }

        public ICollection<Pagamento> Pagamentos { get { return context.Pagamentos.Include("compra").ToList(); } }
        public void Add(Pagamento pagamento){
            var dbPagamento = PegarID(pagamento.PagamentoID);

            if(dbPagamento==null)
                context.Pagamentos.Add(pagamento);
            else
                context.Entry(dbPagamento).CurrentValues.SetValues(pagamento);

            context.SaveChanges();
        }
        
        public Pagamento PegarID(int pagamentoID)
        {
            return Pagamentos.FirstOrDefault(x => x.PagamentoID == pagamentoID);
        }
    }
}