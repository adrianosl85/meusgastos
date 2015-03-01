/// <reference path="../../Apps/compras.js" />
/// <reference path="../../../utilitarios.js" />

(function () {

    var CompraController = function ($scope, $filter, $location, compraServ, formaPagamentoServ) {

        $scope.compra = {
            FormaPagamentoID: 1
        }

        //formas pagamento
        var onPegaFormaPagametnoComplete = function (data) {
            $scope.formasPagamento = data;

            if (typeof (urlParams.compraid) == 'undefined') {
                    $scope.formaPagamentoSelecionado = $scope.formasPagamento[0];
            }
        };

        //pega formas pagamento
        formaPagamentoServ
            .pegaFormasPagamento()
            .then(onPegaFormaPagametnoComplete);



        //Pegar compra
        var onPegaCompra = function (data) {
            $scope.compra = data;
            $scope.compra.DataCompra = new Date(data.DataCompra);
            $scope.valorParcela = data.Total / data.Parcelas;
            $scope.melhorDia = new Date($filter('filter')(data.Pagamentos, { Parcela: 1 }, true)[0].DataVencimento);
            $scope.formaPagamentoSelecionado = $filter('filter')($scope.formasPagamento, { FormaPagamentoID: data.FormaPagamentoID })[0];
        };

        if (angular.isDefined(urlParams.compraid)) {
            compraServ.pegaCompra(urlParams.compraid).then(onPegaCompra);
        }
            




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

            var parcela = $scope.compra.Parcelas == 0 || !angular.isDefined($scope.compra.Parcelas) ? 1 : $scope.compra.Parcelas;

            $scope.compra.Total = parcela * $scope.valorParcela;

            $scope.gerarParcelas();
        };

        $scope.dataChange = function () {
            if ($scope.formaPagamentoSelecionado.TemVencimento)
                if ($scope.compra.DataCompra.getDate() > $scope.formaPagamentoSelecionado.DiaVencimento) {
                    $scope.compra.VirouCartao = true;
                } else {
                    $scope.compra.VirouCartao = false;
                }

            $scope.melhorDia = pegaMelhorDia();

            $scope.gerarParcelas();  
        };


        $scope.melhorDiaChange = function () {
            $scope.gerarParcelas();
        };

        $scope.formaPagamentoChange = function () {
            $scope.compra.FormaPagamentoID = $scope.formaPagamentoSelecionado.FormaPagamentoID;

            $scope.gerarParcelas();
        };

        $scope.mudaTotal = function () {
            $scope.compra.Total = 0;
            angular.forEach($scope.compra.Pagamentos, function (valor) {
                $scope.compra.Total += parseFloat(valor.Valor);
            });
        };

        var pegaMelhorDia = function () {
            var melhorDia = angular.isDefined($scope.melhorDia) ? new Date($scope.melhorDia) : $scope.compra.DataCompra;

            if (angular.isDate(melhorDia) && $scope.formaPagamentoSelecionado.TemVencimento) {
                melhorDia.setMonth($scope.compra.VirouCartao ? (melhorDia.getMonth() + 1) : melhorDia.getMonth());
                melhorDia.setDate($scope.formaPagamentoSelecionado.DiaVencimento);
            }
            return melhorDia;
        };

        $scope.gerarParcelas = function () {

            var parcelas = $scope.compra.Parcelas;

            $scope.compra.Pagamentos = [];

           

            var dataParcela = new Date($scope.melhorDia);
            
            for (var i = 0; i < parcelas; i++) {
                
                $scope.compra.Pagamentos.push({
                    Parcela: i + 1,
                    Valor: parseFloat($scope.compra.Total) / parcelas,
                    DataVencimento: new Date(dataParcela)
                });
                
                dataParcela.setMonth(dataParcela.getMonth() + 1);
            }



        };

        $scope.voltar = function () {
            window.location.href = "/Pagamento";
        };

        //Salvar compra
        var onSalvarComplete = function (response) {
            
            window.location.href = response.data.urlRedirect;
        };

        $scope.salvar = function () {
            compraServ.salvar($scope.compra)
                .then(onSalvarComplete);
        }
        
        //Remover
        var onRemoverCompra = function (response) {
            window.location.href = response.data.urlRedirect;
        };

        $scope.remover = function (compraID) {
            compraServ.remover(compraID)
                .then(onRemoverCompra);

            return false;
        };
        
    };


    App.controller("CompraController", ["$scope", "$filter", "$location", "compraServ","formaPagamentoServ", CompraController]);

})();