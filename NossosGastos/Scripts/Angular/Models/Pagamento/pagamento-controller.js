/// <reference path="../../../utilitarios.js" />
/// <reference path="../../Apps/compras.js" />
(function () {
    var PagamentoController = function ($scope, $filter, $http) {
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
        //var dataAtual = new Date(new Date().getFullYear(), new Date().getMonth()+1, new Date().getDate());

        $scope.carregado = { display: 'none' };

        var pegaMesAno = function () {
            $scope.mes = $scope.dataAtual.getMonth();
            $scope.ano = $scope.dataAtual.getFullYear();
        }

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

        var onPegaPagamentosComplete = function (response) {
            $scope.pagamentos = response.data;
            $scope.carregado = {display: 'block'};
            $scope.pegaParcelasVencendo = function () {
                var ultimasParcelas = $.grep($scope.pagamentos, function (valor) {
                    return valor.Parcela == valor.Compra.Parcelas;
                });

                var soma = 0;

                angular.forEach(ultimasParcelas, function (valor) {
                    soma += valor.Valor;
                });

                return {
                    quantidade : ultimasParcelas.length,
                    soma: soma
                };
            }
        };
        
        $("#DataCompra").datepicker("setDate", new Date(2014,11,12));

        var onErrorPagamentos = function (erro) {
            alert("Erro");
        }

        $scope.pegaClasse = function (pagamento) {
            if (pagamento.Parcela == pagamento.Compra.Parcelas) {
                return "success";
            } else if (pagamento.Parcela == (pagamento.Compra.Parcelas - 1)) return "warning";
        };

        $scope.filtrar = function () {
            $scope.carregado = { display: 'none' };

            $http.get("/Compra/PegarPagamentos?mes=" + ($scope.mes+1) + "&ano=" + $scope.ano)
            .then(onPegaPagamentosComplete, onErrorPagamentos);
        };


        $scope.pegarTotal = function () {
            var soma = {
                cartao : 0,
                dinheiro: 0,
                ticket: 0
            };

            angular.forEach($scope.pagamentos, function (valor) {
                if (valor.Compra.FormaPagamento == 1)
                    soma.cartao += valor.Valor;
                else if (valor.Compra.FormaPagamento == 2)
                    soma.dinheiro += valor.Valor;
                else soma.ticket += valor.Valor;
            });
      
            return soma;
        };


        $scope.filtrar();
        
    };

    App.controller("PagamentoController", ["$scope", "$filter", "$http", PagamentoController]);
})();