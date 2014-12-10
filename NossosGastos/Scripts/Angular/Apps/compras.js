/// <reference path="../../utilitarios.js" />
var App = angular
    .module("PessiApp", [])
    .directive("ngcDatepicker", ngcDatepicker)
    .directive('format', ngcCurrency)
    .filter('customDate', customDate);