using NossosGastos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace NossosGastos.Concretos
{
    public class EFCompraRepository
    {
        private readonly EFDBContas context;
        public EFCompraRepository()
        {
            context = new EFDBContas();
        }

        public ICollection<Compra> Compras { get { return context.Compras.Include("Pagamentos").AsNoTracking().ToList(); } }
        public void Salvar(Compra compra){
            var dbCompra = PegarID(compra.CompraID);
            if(dbCompra==null)
                context.Compras.Add(compra);
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

        public void RemoverCompra(int compraID)
        {
            var dbcompra = PegarID(compraID);
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
        public Compra PegarID(int compraID)
        {
            return context.Compras.Include("Pagamentos").FirstOrDefault(x=>x.CompraID == compraID);
        }
    }
}