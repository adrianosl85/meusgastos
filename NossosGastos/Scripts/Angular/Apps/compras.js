/// <reference path="../../_references.js" />
var App = angular
    .module("PessiApp", [])
    .directive("ngcDatepicker", ngcDatepicker)
    .directive('format', ngcCurrency)
    .directive("defaultForm", defaultForm)
    .filter('customDate', customDate);