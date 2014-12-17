using NossosGastos.Abstratos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NossosGastos.Extensoes;
using System.Data.Entity;

namespace NossosGastos.Controllers
{
    public class PagamentoController : Controller
    {
        //
        // GET: /Pagamentos/

        private readonly IPagamentoRepository pagamentoRepository;

        public PagamentoController(IPagamentoRepository pagamentoRepository)
        {
            //repositories
            this.pagamentoRepository = pagamentoRepository;
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public string PegarPagamentos(int mes, int ano)
        {
            return pagamentoRepository
                .Pagamentos
                .Include(x=>x.Compra)
                .Include(x=>x.Compra.FormaPagamento)
                .ToList().Where(x => x.DataVencimento.Month == mes && x.DataVencimento.Year == ano).ToJson();
        }

    }
}
