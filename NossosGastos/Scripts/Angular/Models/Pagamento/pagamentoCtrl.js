/// <reference path="../../../utilitarios.js" />
(function () {
    var PagamentoController = function ($scope, $filter, pagamentoServ, formaPagamentoServ, categoriaServ) {
        $scope.meses = [
            { nome: "Janeiro", id: 0 },
            { nome: "Fevereiro", id: 1 },
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

        categoriaServ.pegaCategorias().then(function (categorias) {
            $scope.categorias = categorias;
        });

        var pegaMesAno = function () {
            $scope.filtro.FilterMes = $scope.dataAtual.getMonth();
            $scope.filtro.FilterAno = $scope.dataAtual.getFullYear();
        }

        formaPagamentoServ.pegaFormasPagamento()
            .then(function (data) {
                $scope.formasPagamento = data;
            });

        $scope.dataAtual = new Date();
        var dia = $scope.dataAtual.getDate();

        if (dia > 9)
            $scope.dataAtual.setMonth($scope.dataAtual.getMonth() + 1);

        pegaMesAno();

        $scope.moeda = "R$ ";

        $scope.sort = "+Compra.Nome";

        $scope.changeDataFiltro = function (mes) {
            $scope.dataAtual.setMonth($scope.dataAtual.getMonth() + mes);
            pegaMesAno();
            $scope.filtrar();
        };





        $scope.pegaClasse = function (pagamento) {
            if (pagamento.Compra.Parcelas > 1) {
                if (pagamento.Parcela == pagamento.Compra.Parcelas) {
                    return "success";
                } else if (pagamento.Parcela == (pagamento.Compra.Parcelas - 1)) return "warning";
            }
        };

        $scope.pagamentosPorCategoria = [];

        //Pegar Pagamentos 
        var onPegaPagamentosComplete = function (data) {
            $scope.pagamentos = data;
            $scope.carregado = { display: 'block' };

            angular.forEach(data, function (pagamentos) {

                var valor = pagamentos.Valor;
                var categoria = pagamentos.Compra.Categoria;
                
                if (categoria != null) {
                    $scope.pagamentosPorCategoria[categoria.NomeCategoria];
                }

                


            });

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
            pagamentoServ.pegaPagamentos($scope.filtro)
                .then(onPegaPagamentosComplete);
        };


        $scope.pegarTotal = function (propriedade, valorProp) {
            var pagamentos = $scope.pagamentos;

            if (typeof (pagamentos) != 'undefined' && typeof (valorProp) != 'undefined' && valorProp != null) {
                var pagamentos = $.grep(pagamentos, function (valor) {
                    return valor['Compra'][propriedade] == valorProp;
                });
            }
                
            var soma = 0;

            angular.forEach(pagamentos, function (valor) {
                soma += parseFloat(valor.Valor);
            });

            return soma;
        };


        $scope.filtrar();

    };

    App.controller("PagamentoController", ["$scope", "$filter", "pagamentoServ", "formaPagamentoServ", "categoriaServ", PagamentoController]);
})();