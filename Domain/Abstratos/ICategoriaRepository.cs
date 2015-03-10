using Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Abstratos
{
    public interface ICategoriaRepository
    {
        IQueryable<Categoria> Categorias { get; }
        void Salvar(Categoria categoria);
        void Remover(int categoriaID);
        Categoria PegaCategoria(int categoriaID, params string[] includes);
    }
}
