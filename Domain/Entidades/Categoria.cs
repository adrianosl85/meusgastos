using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Entidades
{
    [Table("Categorias")]
    public class Categoria
    {
        [Key]
        public int CategoriaID { get; set; }
        public string NomeCategoria { get; set; }
        public int? CategoriaPaiID { get; set; }
        [ForeignKey("CategoriaPaiID")]
        public Categoria CategoriaPai { get; set; }
        public string Icone { get; set; }
    }
}
