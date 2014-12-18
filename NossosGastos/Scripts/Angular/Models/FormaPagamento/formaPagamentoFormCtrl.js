/// <reference path="../../../_references.js" />

(function () {

    var FormaPagamentoController = function ($scope, $filter, formaPagamentoRepos) {

        var onComplete = function (data) {
            $scope.formaPagamento = data;
        };

        var onError = function (error) {
            $scope.error = "";
        };


        if (typeof (urlParams.formapagamentoid) != 'undefined') {
            
            formaPagamentoRepos.pegaFormaPagamento(urlParams.formapagamentoid)
                .then(onComplete, onError);
        }

        $scope.salvar = function () {
            formaPagamentoRepos.salvar($scope.formaPagamento)
                .then(function () {
                    location.reload();
                });
        };

        $scope.remover = function (id) {
            console.log(id)
        };

    };

    App.controller("FormaPagamentoController", ["$scope", "$filter", "formaPagamentoRepos", FormaPagamentoController]);
}());