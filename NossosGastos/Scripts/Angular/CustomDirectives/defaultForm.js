var defaultForm = function () {
    return {
        scope: {
            removeTitulo: "=",
            removeId: "=",
            removeNome: "=",
            escopoPai: "=",
            salvar: "&onSalvar",
            remover: "&onRemover",
            back: "&onBack"
        },
        restrict: 'E',
        transclude: true,
        templateUrl: "/htmls/form.html",
        link: function (scope, element, attrs, ctrl) {

        }

    }
}