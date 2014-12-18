/// <reference path="../../../utilitarios.js" />
(function () {
    var PagamentoController = function ($scope, $filter, pagamentoServ, formaPagamentoServ) {
        $scope.meses = [
            { nome: "Janeiro", id: 0 },
            { nome: "Fevereiro", id:1 },
            { nome: "Março", id: 2 },
            { nome: "Abril", id: 3 },
            { nome: "Maio", id: 4 },
            { nome: "Junho", id: 5 },
            { nome: "Julho", id: 6 },
            { nome: "Agosto", id: 7 },
            { nome: "Setembro", id: 8 },
            { nome: "Outubro", id: 9 },
            { nome: "Novembro", id: 10 },
            { nome: "Dezembro", id: 11 },
        ]

        $scope.filtro = {};

        $scope.carregado = { display: 'none' };

        var pegaMesAno = function () {
            $scope.filtro.FilterMes = $scope.dataAtual.getMonth();
            $scope.filtro.FilterAno = $scope.dataAtual.getFullYear();
        }

        formaPagamentoServ.pegaFormasPagamento()
            .then(function (data) {
                     $scope.formasPagamento = data;
             });

        $scope.dataAtual = new Date();
        $scope.dataAtual.setMonth($scope.dataAtual.getMonth() + 1);

        pegaMesAno();

        $scope.moeda = "R$ ";
        
        $scope.sort = "+Compra.Nome";

        $scope.changeDataFiltro = function (mes) {
            $scope.dataAtual.setMonth($scope.dataAtual.getMonth() + mes);
            pegaMesAno();
            $scope.filtrar();
        };

        
        
        $("#DataCompra").datepicker("setDate", new Date(2014,11,12));

        $scope.pegaClasse = function (pagamento) {
            if (pagamento.Compra.Parcelas > 1) {
                if (pagamento.Parcela == pagamento.Compra.Parcelas) {
                    return "success";
                } else if (pagamento.Parcela == (pagamento.Compra.Parcelas - 1)) return "warning";
            }
        };

        //Pegar Pagamentos 
        var onPegaPagamentosComplete = function (data) {
            $scope.pagamentos = data;
            $scope.carregado = { display: 'block' };
            $scope.pegaParcelasVencendo = function () {
                var ultimasParcelas = $.grep($scope.pagamentos, function (valor) {
                    return valor.Parcela == valor.Compra.Parcelas && valor.Compra.Parcelas > 1;
                });

                var soma = 0;

                angular.forEach(ultimasParcelas, function (valor) {
                    soma += valor.Valor;
                });

                return {
                    quantidade: ultimasParcelas.length,
                    soma: soma
                };
            }
        };

        $scope.filtrar = function () {
            $scope.carregado = { display: 'none' };
            console.log($scope.filtro)
            pagamentoServ.pegaPagamentos($scope.filtro)
                .then(onPegaPagamentosComplete);
        };


        $scope.pegarTotal = function (formaPagamentoID) {
            var pagamentoPorFormaPagamento = $filter('filter')($scope.pagamentos, { Compra: { FormaPagamentoID: formaPagamentoID } });
            var soma = 0;

            angular.forEach(pagamentoPorFormaPagamento, function (valor) {
                soma += parseFloat(valor.Valor);
            });

            return soma;
        };


        $scope.filtrar();
        
    };

    App.controller("PagamentoController", ["$scope", "$filter", "pagamentoServ", "formaPagamentoServ", PagamentoController]);
})();