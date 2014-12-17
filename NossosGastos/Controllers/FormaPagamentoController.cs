using NossosGastos.Abstratos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NossosGastos.Extensoes;
using NossosGastos.Entidades;

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

        public ActionResult FormFormaPagamento()
        {
            return View();
        }

        [HttpGet]
        public string PegaFormaPagamento(int formaPagamentoID)
        {
            return formaPagamentoRepository
                .PegarPorID(formaPagamentoID)
                .ToJson();
        }

        [HttpPost]
        public string Salvar(FormaPagamento formaPagamento)
        {
            try
            {
                formaPagamentoRepository.Salvar(formaPagamento);
                return new {
                    mensagem = "Forma de pagamento salva com sucesso",
                    sucesso = true
                }.ToJson();
            }
            catch (Exception e)
            {
                return new
                {
                    mensagem = "Ocorreu um erro ao tentar salvar a forma de pagamento erro: " + e.Message,
                    sucesso = false
                }.ToJson();
            }
            

            return "".ToJson();
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
