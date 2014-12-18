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
            Filtros filtros = new Filtros();
            filtros.FilterNome = "América";

            var filtrosCompra = new FiltroCompra(filtros);

            var compras = compraRepository.Compras.ToList();

            var compras2 = compras.Where(filtrosCompra.Compilar());

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

        
    }
}
