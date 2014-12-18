using Dominio.Abstratos;
using Dominio.EFContext;
using SimpleInjector;

namespace Dominio
{
    public static class Registrator
    {
        public static void Register(Container container)
        {
            Repositories(container);
        }

        public static void Repositories(Container container)
        {

            //Repositórios
            container.Register<ICompraRepository,EFCompraRepository>();
            container.Register<IPagamentoRepository, EFPagamentoRepository>();
            container.Register<IFormaPagamentoRepository, EFFormaPagamentoRepository>();
        }

    }
}
