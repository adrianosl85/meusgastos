/// <reference path="../../../_references.js" />
(function () {

    var pagamentoServ = function ($http) {

        var pegaPagamento = function (pagamentoID) {
            return $http.get("/Pagamento/PegaPagamento", pagamentoID)
                .then(function (response) { return response.data; });
        };

        var pegaPagamentos = function (filtro) {
            console.log(filtro);
            return $http.post("/Pagamento/PegaPagamentos", filtro)
                .then(function (response) { return response.data; });
        };

        var salvar = function (pagamento) {
            return $http.post("/Pagamento/Salvar", pagamento);
        };

        var remover = function (pagamentoID) {
            return $http.post("/Pagamento/Remover", pagamentoID);
        };

        return {
            pegaPagamento: pegaPagamento,
            pegaPagamentos: pegaPagamentos,
            salvar: salvar,
            remover: remover
        };
    };

    App.factory("pagamentoServ", ["$http", pagamentoServ]);
}());