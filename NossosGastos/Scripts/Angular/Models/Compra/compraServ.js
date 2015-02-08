/// <reference path="../../../_references.js" />
(function () {
    
    var CompraServ = function ($http) {

        var pegaCompra = function (compraID) {
            return $http.get("/Compra/PegaCompra?compraID="+compraID)
                .then(function (response) { return response.data });
        };

        var pegaCompras = function (filtro) {
            return $http.get("/Compra/PegaCompras", filtro)
                .then(function (response) { return response.data });
        };

        var salvar = function (compra) {
            return $http.post("/Compra/Salvar", compra);
        };


        var remover = function (compraID) {
            return $http.post("/Compra/Remover", { compraID: compraID });
        }


        return {
            pegaCompra: pegaCompra,
            pegaCompras: pegaCompras,
            salvar: salvar,
            remover: remover
        };
    };

    App.factory("compraServ", ["$http", CompraServ]);
}());