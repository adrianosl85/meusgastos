using Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using Dominio.Abstratos;

namespace Dominio.EFContext
{
    public class EFCompraRepository : ICompraRepository
    {
        private readonly EFDBContas context;
        public EFCompraRepository()
        {
            context = new EFDBContas();
        }

        public IQueryable<Compra> Compras { get { return context.Compras; } }
        public void Salvar(Compra compra){

            var dbCompra = PegarPorID(compra.CompraID);

            if(dbCompra==null){
                
                context.Compras.Add(compra);
            }
                
            else
            {
                foreach (Pagamento remover in dbCompra.Pagamentos.ToList())
                {
                    context.Entry(remover).State = EntityState.Deleted;
                }

                foreach (Pagamento pagamento in compra.Pagamentos)
                {

                    dbCompra.Pagamentos.Add(pagamento);
                }

                context.Entry(dbCompra).CurrentValues.SetValues(compra);
            }

            
            context.SaveChanges();
        }

        public void RemoverFormaPagamento(int compraID)
        {
            var dbcompra = PegarPorID(compraID);
            if (dbcompra != null)
            {
                foreach (Pagamento pagamento in dbcompra.Pagamentos.ToList())
                {
                    context.Entry(pagamento).State = EntityState.Deleted;
                }

                context.Entry(dbcompra).State = EntityState.Deleted;
            }

            context.SaveChanges();
        }
        public Compra PegarPorID(int compraID)
        {
            return context.Compras.Include("Pagamentos").Include("FormaPagamento").FirstOrDefault(x=>x.CompraID == compraID);
        }
    }
}