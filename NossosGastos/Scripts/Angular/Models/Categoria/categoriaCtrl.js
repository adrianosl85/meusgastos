/// <reference path="../../../_references.js" />

(function () {

    var CategoriaController = function ($scope, $filter, categoriaServ) {

        $scope.sort = "+NomeCategoria";

        var onPegaCatergoriaComplete = function (data) {
            $scope.categorias = data;
        };

        categoriaServ.pegaCategorias($scope.filtro)
             .then(onPegaCatergoriaComplete);

        $scope.filtrar = function () {
            categoriaServ.pegaCategorias($scope.filtro)
                 .then(onPegaCatergoriaComplete);
        };
    };

    App.controller("CategoriaController", ["$scope", "$filter", "categoriaServ", CategoriaController]);
})();