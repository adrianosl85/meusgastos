using System;
using System.Collections.Generic;
using System.Data.Entity;
using NossosGastos.Entidades;
using System.Linq;
using System.Web;
using NossosGastos.Mapeamentos;

namespace NossosGastos.EFContext
{
    public class EFDBContas : DbContext
    {
        public DbSet<Compra> Compras { get; set; }
        public DbSet<Pagamento> Pagamentos { get; set; }
        public DbSet<FormaPagamento> FormasPagamento { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CompraMap());
            modelBuilder.Configurations.Add(new PagamentoMap());
        }
    }
}