myApp = angular.module('myApp',['infinite-scroll']);

myApp.controller('PromotionsController', function($scope, SoPromocoes) {
  $scope.soPromocoes = new SoPromocoes();
});

// SoPromocoes constructor function to encapsulate HTTP and pagination logic
myApp.factory('SoPromocoes', function($http) {
  var SoPromocoes = function() {
    this.items = [];
    this.busy = false;
    this.last = 0;
  };

  SoPromocoes.prototype.nextPage = function() {
    if (this.busy) return;
    this.busy = true;

    var url = "http://localhost:3000/promotions.json?last=" + this.last;
    $http.get(url).success(function(data) {
      var items = data;
      for (var i = 0; i < items.length; i++) {
        this.items.push(items[i]);
      }
      this.last = this.items.length - 1;
      this.busy = false;
    }.bind(this));
  };

  return SoPromocoes;
});
