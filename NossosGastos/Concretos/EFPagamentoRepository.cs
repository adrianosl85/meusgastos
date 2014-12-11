using NossosGastos.Abstratos;
using NossosGastos.Entidades;
using System.Linq;

namespace NossosGastos.EFContext
{
    public class EFPagamentoRepository : IPagamentoRepository
    {
        private readonly EFDBContas context;
        public EFPagamentoRepository()
        {
            context = new EFDBContas();
        }

        public IQueryable<Pagamento> Pagamentos { get { return context.Pagamentos; } }
        public void Salvar(Pagamento pagamento){
            var dbPagamento = PegarPorID(pagamento.PagamentoID);

            if(dbPagamento==null)
                context.Pagamentos.Add(pagamento);
            else
                context.Entry(dbPagamento).CurrentValues.SetValues(pagamento);

            context.SaveChanges();
        }
        
        public Pagamento PegarPorID(int pagamentoID)
        {
            return Pagamentos.FirstOrDefault(x => x.PagamentoID == pagamentoID);
        }
    }
}