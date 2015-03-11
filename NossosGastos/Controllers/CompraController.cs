using System.Transactions;
using System.Web.Mvc;
using Extensoes;
using Dominio.Entidades;
using Dominio.Abstratos;
using System.Data.Entity;
using NossosGastos.Filtro;
using System.Linq;
using NossosGastos.Filtro.Implementacoes;

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
            ViewBag.Menu = "compra";
            return View();
        }

        public ActionResult FormCompra()
        {
            ViewBag.Menu = "compra";

            return View();
        }

        [HttpPost]
        public ActionResult Salvar(Compra compra)
        {
            using (var transaction = new TransactionScope())
            {
                compraRepository.Salvar(compra);
                transaction.Complete();
            }
            return Json(new { success = true, urlRedirect = "/Compra/FormCompra" });
        }

        [HttpPost]
        public ActionResult Remover(int compraID)
        {
            compraRepository.RemoverFormaPagamento(compraID);

            return Json(new { success = true, urlRedirect = "/Pagamento" });
        }

        [HttpGet]
        public string PegaCompra(int compraID)
        {
            return compraRepository.PegarPorID(compraID).ToJson();
        }

        [HttpGet]
        public string PegaCompras(Filtros filtro)
        {
            var filtroCompra = new FiltroCompra(filtro).Compilar();



            return compraRepository
                .Compras
                .Include(x=>x.FormaPagamento)
                .Include(x=>x.Pagamentos)
                .Where(filtroCompra)
                .ToList()
                .ToJson();
        }

        
    }
}
