/// <reference path="../../../_references.js" />
(function () {
    
    var CategoriaServ = function ($http) {

        var pegaCategoria = function (categoriaID) {
            return $http.get("/Categoria/PegaCategoria?categoriaID=" + categoriaID)
                .then(function (response) { return response.data });
        };

        var pegaCategorias = function (filtro) {
            return $http.get("/Categoria/PegaCategorias", filtro)
                .then(function (response) { return response.data });
        };

        var salvar = function (compra) {
            return $http.post("/Categoria/Salvar", compra);
        };


        var remover = function (compraID) {
            return $http.post("/Categoria/Remover", { compraID: compraID });
        }


        return {
            pegaCategoria: pegaCategoria,
            pegaCategorias: pegaCategorias,
            salvar: salvar,
            remover: remover
        };
    };

    App.factory("categoriaServ", ["$http", CategoriaServ]);
}());