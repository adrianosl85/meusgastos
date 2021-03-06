﻿/// <reference path="../../Apps/compras.js" />
/// <reference path="../../../utilitarios.js" />

(function () {

    var CompraController = function ($scope, $filter, $location, $http) {

        var onSucess = function (response) {
            $scope.compra = response.data;
            $scope.compra.DataCompra = new Date($scope.compra.DataCompra);
            $scope.valorParcela = $scope.compra.Total / $scope.compra.Parcelas;
        };

        if (angular.isDefined(urlParams.compraID))
            $http.post("/Compra/PegaCompraById", { compraID: urlParams.compraID })
                .then(onSucess);



        $scope.formasPagamento = [{ forma: "Cartão", id: 1 },
            { forma: "Dinheiro", id: 2 },
            { forma: "Ticket", id: 3 }]


        $scope.mudaValorTotal = function () {
            var parcelas = angular.isDefined($scope.compra.Parcelas) ? $scope.compra.Parcelas : 1;

            var valor = $scope.compra.Total / parcelas;

            $scope.valorParcela = valor;

            $scope.gerarParcelas();
        };


        $scope.mudaValorParcelas = function () {
            var parcelas = angular.isDefined($scope.compra.Parcelas) || $scope.compra.Parcelas == '' ? $scope.compra.Parcelas : 1;

            $scope.compra.Total = $scope.valorParcela * parcelas;

            $scope.gerarParcelas();
        };

        $scope.mudaParcelas = function () {

            //$scope.compra.Parcelas = angular.isDefined($scope.compra.Parcelas) || $scope.compra.Parcelas == '' ? $scope.compra.Parcelas : 1

            var parcela = $scope.compra.Parcelas == 0 || !angular.isDefined($scope.compra.Parcelas) ? 1 : $scope.compra.Parcelas;

            $scope.compra.Total = parcela * $scope.valorParcela;

            $scope.gerarParcelas();
        };

        $scope.dataChange = function () {
            if ($scope.compra.FormaPagamento == 1)
                if ($scope.compra.DataCompra.getDate() > 9) {
                    $scope.compra.VirouCartao = true;
                } else {
                    $scope.compra.VirouCartao = false;
                }

            $scope.gerarParcelas();
        };

        $scope.gerarParcelas = function () {

            var parcelas = $scope.compra.Parcelas;

            $scope.compra.Pagamentos = [];


            var dataVencimentoBase = angular.isDefined($scope.compra.DataCompra) ? new Date($scope.compra.DataCompra) : '';

            if (angular.isDate(dataVencimentoBase) && $scope.compra.FormaPagamento == 1) {

                dataVencimentoBase.setMonth($scope.compra.VirouCartao ? (dataVencimentoBase.getMonth() + 1) : dataVencimentoBase.getMonth());

                dataVencimentoBase.setDate(9);
            }

            for (var i = 0; i < parcelas; i++) {

                var aux = angular.copy(dataVencimentoBase);

                $scope.compra.Pagamentos.push({
                    Parcela: i + 1,
                    Valor: parseFloat($scope.compra.Total) / parcelas,
                    DataVencimento: angular.isDate(dataVencimentoBase) ? new Date(aux.setMonth(dataVencimentoBase.getMonth() + i)) : ''
                });
            }



        };

        $scope.voltar = function () {
            window.location.href = "/compra/pagamentos";
        };

        var onSalvarCompraComplete = function (response) {
            window.location.href = response.data.urlRedirect;
        };

        $scope.salvarCompra = function () {
            $http.post("/Compra/SalvarCompra", $scope.compra)
                .then(onSalvarCompraComplete);
        };

        var onRemoverCompra = function (response) {
            window.location.href = response.data.urlRedirect;
        };

        $scope.removerCompra = function (compraID) {
            $http.post("/Compra/DeletarCompra", { compraID: compraID })
                .then(onRemoverCompra);

            return false;
        };


    };


    App.controller("CompraController", ["$scope", "$filter", "$location", "$http", CompraController]);

})();