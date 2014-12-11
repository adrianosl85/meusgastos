using NossosGastos.Abstratos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NossosGastos.Extensoes;

namespace NossosGastos.Controllers
{
    public class FormaPagamentoController : Controller
    {
        //
        // GET: /FormaPagamento/
        private readonly IFormaPagamentoRepository formaPagamentoRepository;
        public FormaPagamentoController(IFormaPagamentoRepository formaPagamentoRepository)
        {
            this.formaPagamentoRepository = formaPagamentoRepository;
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public string PegaFormasPagamento()
        {
            return formaPagamentoRepository
                .FormasPagamento
                .ToList()
                .ToJson();
        }

    }
}
