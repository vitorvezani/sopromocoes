myApp = angular.module('myApp',['infinite-scroll']);

myApp.controller('PromotionsController', function($scope, SoPromocoes) {
  $scope.soPromocoes = new SoPromocoes();
});

// SoPromocoes constructor function to encapsulate HTTP and pagination logic
myApp.factory('SoPromocoes', function($http) {
  var SoPromocoes = function() {
    this.items = [];
    this.busy = false;
    this.after = '';
  };

  SoPromocoes.prototype.nextPage = function() {
    if (this.busy) return;
    this.busy = true;

    var url = "http://api.reddit.com/hot?after=" + this.after + "&jsonp=JSON_CALLBACK";
    $http.jsonp(url).success(function(data) {
      var items = data.data.children;
      for (var i = 0; i < items.length; i++) {
        this.items.push(items[i].data);
      }
      this.after = "t3_" + this.items[this.items.length - 1].id;
      this.busy = false;
    }.bind(this));
  };

  return SoPromocoes;
});