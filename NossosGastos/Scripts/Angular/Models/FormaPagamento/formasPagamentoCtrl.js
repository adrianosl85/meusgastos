/// <reference path="../../../_references.js" />
(function () {
    var FormasPagamentoController = function ($scope, $filter, formaPagamentoRepos) {

        //sort
        $scope.sort = "+Nome";

        //pegar formas de pagamento
        formaPagamentoRepos.pegaFormasPagamento()
            .then(function (data) {
                $scope.formasPagamento = data;
            });

        //remover
        var remover = function (formaPagamentoID) {
                formaPagamentoRepos.remover()
                    .then(function (data) {

                    });
        }

    };

    App.controller("FormasPagamentoController", ["$scope", "$filter", "formaPagamentoRepos", FormasPagamentoController]);
}());