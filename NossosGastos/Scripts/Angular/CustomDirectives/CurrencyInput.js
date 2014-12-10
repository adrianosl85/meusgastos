ngcCurrency = ['$filter', function ($filter) {
    return {
        require: '?ngModel',
        link: function (scope, elem, attrs, ctrl) {
            if (!ctrl) return;


            ctrl.$formatters.unshift(function (a) {
                return $filter(attrs.format)(ctrl.$modelValue,2)
            });

            ctrl.$parsers.unshift(function (viewValue) {

                elem.priceFormat({
                    prefix: '',
                    centsSeparator: ',',
                    thousandsSeparator: '.'
                });

                return parseFloat(elem[0].value.replace('.','').replace(',','.'));
            });
        }
    };
}]


var customDate = function ($filter) {
    return function (items, filter) {
        if (!items) return;

        if (items.length <= 3) {
            return items;
        } else {
            return $filter('date')(items, filter);
        }
    };
};