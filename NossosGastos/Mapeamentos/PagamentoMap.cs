using NossosGastos.Entidades;
using System.Data.Entity.ModelConfiguration;

namespace NossosGastos.Mapeamentos
{
    internal class PagamentoMap : EntityTypeConfiguration<Pagamento>
    {
        public PagamentoMap()
        {
            HasRequired<Compra>(x => x.Compra)
                .WithMany(x => x.Pagamentos)
                .HasForeignKey(x => x.CompraID);
        }
    }
}