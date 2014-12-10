using NossosGastos.Concretos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Transactions;
using System.Web.Mvc;
using NossosGastos.Extensoes;
using NossosGastos.Entidades;

namespace NossosGastos.Controllers
{
    public class CompraController : Controller
    {
        //
        // GET: /Compra/

        private readonly EFCompraRepository compraRepository;
        private readonly EFPagamentoRepository pagamentoRepository;

        public CompraController()
        {
            this.compraRepository = new EFCompraRepository();
            this.pagamentoRepository = new EFPagamentoRepository();
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
            return compraRepository.PegarID(compraID).ToJson();
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
            compraRepository.RemoverCompra(compraID);

            return Json(new { success = true, urlRedirect = "/Compra/Pagamentos" });
        }

        public ActionResult Pagamentos()
        {
            return View();
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

        [HttpGet]
        public string PegarPagamentos(int mes, int ano)
        {
            return pagamentoRepository.Pagamentos.ToList().Where(x=>x.DataVencimento.Month == mes && x.DataVencimento.Year == ano).ToJson();
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
