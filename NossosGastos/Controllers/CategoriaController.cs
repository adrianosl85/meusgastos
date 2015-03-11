using Dominio.Abstratos;
using NossosGastos.Filtro;
using NossosGastos.Filtro.Implementacoes;
using System.Linq;
using System.Web.Mvc;
using Extensoes;

namespace Dominio.Controllers
{
    public class CategoriaController : Controller
    {
        //
        // GET: /Categoria/
        private readonly ICategoriaRepository categoriaRepository;

        public CategoriaController(ICategoriaRepository categoriaRepository)
        {
            this.categoriaRepository = categoriaRepository;
        }

        public ActionResult Index()
        {
            ViewBag.Menu = "categoria";

            return View();
        }

        [HttpGet]
        public string PegaCategorias(Filtros filtro)
        {
            var filtroCategoria = new FiltroCategoria(filtro).Compilar();

            return categoriaRepository
                .Categorias
                //.Where(filtroCategoria)
                .ToList()
                .ToJson();

                
        }

    }
}
