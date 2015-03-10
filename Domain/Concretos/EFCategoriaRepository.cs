using Dominio.Abstratos;
using Dominio.EFContext;
using Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Concretos
{
    public class EFCategoriaRepository : ICategoriaRepository
    {
        private readonly EFDBContas context;

        public EFCategoriaRepository()
        {
            context = new EFDBContas();
        }

        public IQueryable<Categoria> Categorias
        {
            get { return context.Categorias; }
        }

        public void Salvar(Categoria categoria)
        {
            
        }

        public void Remover(int categoriaID)
        {
            
        }

        public Categoria PegaCategoria(int categoriaID, params string[] includes)
        {

            if (includes != null)
                foreach (string include in includes)
                {
                    context.Categorias.Include(include); 
                }

            Categoria categoria = context.Categorias.Find(categoriaID);

            return categoria;
        }


    }
}
