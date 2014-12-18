using Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using Dominio.Abstratos;

namespace Dominio.EFContext
{
    public class EFFormaPagamentoRepository : IFormaPagamentoRepository
    {
        private readonly EFDBContas context;
        public EFFormaPagamentoRepository()
        {
            context = new EFDBContas();
        }

        public IQueryable<FormaPagamento> FormasPagamento { get { return context.FormasPagamento; } }
        public void Salvar(FormaPagamento formaPagamento){
            var dbFormaPagametno = PegarPorID(formaPagamento.FormaPagamentoID);
            if(dbFormaPagametno==null)
                context.FormasPagamento.Add(formaPagamento);
            else
            {
                context.Entry(dbFormaPagametno).CurrentValues.SetValues(formaPagamento);
            }

            
            context.SaveChanges();
        }

        public void RemoverFormaPagamento(int formaPagamentoID)
        {
            var dbFormaPagamento = PegarPorID(formaPagamentoID);
            if (dbFormaPagamento != null)
            {
                if (dbFormaPagamento.Compras.Count() > 0)
                    throw new Exception("Esta forma de pagamento contém compras, não é possível remover");
                context.Entry(dbFormaPagamento).State = EntityState.Deleted;
                context.SaveChanges();
            }
        }
        public FormaPagamento PegarPorID(int formaPagamentoID)
        {
            return context.FormasPagamento.FirstOrDefault(x=>x.FormaPagamentoID == formaPagamentoID);
        }
    }
}