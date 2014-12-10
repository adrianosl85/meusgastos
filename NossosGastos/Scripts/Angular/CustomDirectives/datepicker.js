﻿var ngcDatepicker = function ($filter) {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            $(function () {


                ngModelCtrl.$formatters.unshift(function (a) {
                    return $filter('date')(ngModelCtrl.$modelValue, 'dd/MM/yyyy');
                });
    

                element.datepicker({
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 2,
                    showButtonPanel: true,
                    onSelect: function (date, objcet) {
                        scope.$apply(function () {
                            ngModelCtrl.$setViewValue(new Date(objcet.selectedYear, objcet.selectedMonth, objcet.selectedDay, 0, 0, 0, 0));
                            $("#" + attrs.ngcDatepicker).select();
                        });
                    }
                });
            });
        }
    }
};