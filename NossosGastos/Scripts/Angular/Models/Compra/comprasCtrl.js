/// <reference path="../../../_references.js" />

(function () {

    var ComprasController = function ($scope, $filter, compraServ) {

        $scope.moeda = "R$ ";
        $scope.sort = "+Nome";

        $scope.pegaParcelaAtual = function (compra) {
            var dataAtual = new Date();

            var pagamento = $.grep(compra.Pagamentos, function (valor, indice) {

                return new Date(valor.DataVencimento).getMonth() == dataAtual.getMonth();
            });

            return pagamento.length > 0 ? pagamento[0].Parcela : compra.Parcelas;
        };


        var onPegaComprasComplete = function (data) {
            $scope.compras = data;
        };

        compraServ.pegaCompras($scope.filtro)
             .then(onPegaComprasComplete);

        $scope.filtrar = function () {
            compraServ.pegaCompras($scope.filtro)
                 .then(onPegaComprasComplete);
        };
    };

    App.controller("ComprasController", ["$scope", "$filter", "compraServ", ComprasController]);
})();