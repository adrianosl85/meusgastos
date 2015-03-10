﻿using Dominio.Abstratos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Extensoes;
using System.Data.Entity;
using NossosGastos.Filtro;
using NossosGastos.Filtro.Implementacoes;

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


        [HttpPost]
        public string PegaPagamentos(Filtros filtro)
        {

            var filtroPagamento = new FiltroPagamento(filtro).Compilar();

            return pagamentoRepository
                .Pagamentos
                .Include(x=>x.Compra)
                .Include(x=>x.Compra.FormaPagamento)
                .Include(x=>x.Compra.Categoria)
                .Where(filtroPagamento)
                .ToList().ToJson();
        }

    }
}
