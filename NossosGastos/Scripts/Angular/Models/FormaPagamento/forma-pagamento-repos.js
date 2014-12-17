/// <reference path="../../../_references.js" />
(function () {
    var formaPagamentoRepos = function ($http) {

        var pegaFormaPagamento = function (formaPagamentoID) {
            return $http.get("/FormaPagamento/PegaFormaPagamento?formaPagamentoID=" + formaPagamentoID)
                .then(function (response) {
                    return response.data;
                });
        };

        var salvar = function (formaPagamento) {
            return $http.post("/FormaPagamento/Salvar", formaPagamento)
                .then(function (response) {
                    return response.data;
                });
        };

        var remover = function (formaPagamentoID) {
            return $http.post("/FormaPagamento/Remover", { formaPagamentoID: formaPagamentoID })
                .then(function (response) {
                    return response.data;
                });
        }

        var pegaFormasPagamento = function (filter) {
            return $http.get("/FormaPagamento/PegaFormasPagamento", filter)
                .then(function (response) {
                    return response.data;
                });
        }

        return {
            pegaFormaPagamento: pegaFormaPagamento,
            salvar: salvar,
            remover: remover,
            pegaFormasPagamento: pegaFormasPagamento
        };
    };

    App.factory('formaPagamentoRepos', ["$http", formaPagamentoRepos]);

}());