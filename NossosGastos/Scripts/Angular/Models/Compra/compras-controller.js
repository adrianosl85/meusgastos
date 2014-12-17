/// <reference path="../../../_references.js" />

(function () {

    var ComprasController = function ($scope, $filter, $http) {

        var onPegarComprasComplete = function (response) {
            $scope.compras = response.data;
        };

        $scope.moeda = "R$ ";
        $scope.sort = "+Nome";

        $scope.pegaParcelaAtual = function (compra) {
            var dataAtual = new Date();
            
            var pagamento = $.grep(compra.Pagamentos, function (valor, indice) {
                
                return new Date(valor.DataVencimento).getMonth() == dataAtual.getMonth();
            });

            return pagamento.length > 0 ? pagamento[0].Parcela : compra.Parcelas;
        };

        $http.get("/Compra/PegaCompras")
            .then(onPegarComprasComplete);
    };

    App.controller("ComprasController", ["$scope", "$filter", "$http", ComprasController]);
})();