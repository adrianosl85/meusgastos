using NossosGastos.Abstratos;
using NossosGastos.EFContext;
using SimpleInjector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NossosGastos
{
    public static class Registrator
    {
        public static void Register(Container container)
        {
            Repositories(container);
        }

        public static void Repositories(Container container)
        {
            container.Register<ICompraRepository,EFCompraRepository>();
            container.Register<IPagamentoRepository, EFPagamentoRepository>();
            container.Register<IFormaPagamentoRepository, EFFormaPagamentoRepository>();
        }

    }
}
