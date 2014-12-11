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

        [HttpGet]
        public ActionResult NovaCompra()
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
            return Json(new { success = true, urlRedirect = "/Compra/NovaCompra" });
        }

        [HttpPost]
        public ActionResult DeletarCompra(int compraID)
        {
            compraRepository.RemoverFormaPagamento(compraID);

            return Json(new { success = true, urlRedirect = "/Pagamento/Pagamentos" });
        }



        public ActionResult Compras()
        {
            return View(); 
        }

        [HttpGet]
        public string PegaCompras(Filter filtro)
        {
            return new Compra().ToJson();
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
