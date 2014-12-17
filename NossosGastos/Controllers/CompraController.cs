using NossosGastos.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Transactions;
using System.Web.Mvc;
using NossosGastos.Extensoes;
using NossosGastos.Entidades;
using NossosGastos.Abstratos;
using System.Data.Entity;

namespace NossosGastos.Controllers
{
    public class CompraController : Controller
    {
        //
        // GET: /Compra/

        private readonly ICompraRepository compraRepository;
        private readonly IPagamentoRepository pagamentoRepository;

        public CompraController(ICompraRepository compraRepository
            , IPagamentoRepository pagamentoRepository)
        {
            this.compraRepository = compraRepository;
            this.pagamentoRepository = pagamentoRepository;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult FormCompra()
        {
            return View();
        }

        [HttpPost]
        public string PegaCompraById(int compraID)
        {
            return compraRepository.PegarPorID(compraID).ToJson();
        }

        [HttpPost]
        public ActionResult SalvarCompra(Compra compra)
        {
            using (var transaction = new TransactionScope())
            {
                compraRepository.Salvar(compra);
                transaction.Complete();
            }
            return Json(new { success = true, urlRedirect = "/Compra/FormCompra" });
        }

        [HttpPost]
        public ActionResult DeletarCompra(int compraID)
        {
            compraRepository.RemoverFormaPagamento(compraID);

            return Json(new { success = true, urlRedirect = "/Pagamento" });
        }

        [HttpGet]
        public string PegaCompras()
        {
            return compraRepository
                .Compras
                .Include(x=>x.FormaPagamento)
                .Include(x=>x.Pagamentos)
                .ToJson();
        }

        public class Filter
        {
            public DateTime? FilterDataCompra { get; set; }
            public DateTime? FilterDataVencimento { get; set; }
            public string FilterMes { get; set; }
            public string FilterAno { get; set; }
            public string  FilterDia { get; set; }
            public string FilterName { get; set; }
            public int? FilterParcela { get; set; }
            public int? FilterParcelas { get; set; }
        }
    }
}
