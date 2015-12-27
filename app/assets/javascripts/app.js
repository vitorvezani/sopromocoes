myApp = angular.module('myApp',['infinite-scroll']);

myApp.controller('PromotionsController', function($scope, SoPromocoes) {
  $scope.soPromocoes = new SoPromocoes();
});

// SoPromocoes constructor function to encapsulate HTTP and pagination logic
myApp.factory('SoPromocoes', function($http) {
  var SoPromocoes = function() {
    this.items = [{
  "name": "asddsadsa",
  "description": "sdasd",
  "price_from": "5.0",
  "price_to": "2.0",
  "price_billet": "2.0",
  "percent_discount": "25.0",
  "init_at": "2015-12-12",
  "end_at": "2015-12-12",
  "link": "www.google.com.br",
  "img_link": "www.google.com.br",
  "user_id": "1",
  "created_at": "2015-12-23",
  "updated_at": "2015-12-23"
},{
  "name": "asddsadsa",
  "description": "sdasd",
  "price_from": "5.0",
  "price_to": "2.0",
  "price_billet": "2.0",
  "percent_discount": "25.0",
  "init_at": "2015-12-12",
  "end_at": "2015-12-12",
  "link": "www.google.com.br",
  "img_link": "www.google.com.br",
  "user_id": "1",
  "created_at": "2015-12-23",
  "updated_at": "2015-12-23"
},{
  "name": "asddsadsa",
  "description": "sdasd",
  "price_from": "5.0",
  "price_to": "2.0",
  "price_billet": "2.0",
  "percent_discount": "25.0",
  "init_at": "2015-12-12",
  "end_at": "2015-12-12",
  "link": "www.google.com.br",
  "img_link": "www.google.com.br",
  "user_id": "1",
  "created_at": "2015-12-23",
  "updated_at": "2015-12-23"
},{
  "name": "asddsadsa",
  "description": "sdasd",
  "price_from": "5.0",
  "price_to": "2.0",
  "price_billet": "2.0",
  "percent_discount": "25.0",
  "init_at": "2015-12-12",
  "end_at": "2015-12-12",
  "link": "www.google.com.br",
  "img_link": "www.google.com.br",
  "user_id": "1",
  "created_at": "2015-12-23",
  "updated_at": "2015-12-23"
},{
  "name": "asddsadsa",
  "description": "sdasd",
  "price_from": "5.0",
  "price_to": "2.0",
  "price_billet": "2.0",
  "percent_discount": "25.0",
  "init_at": "2015-12-12",
  "end_at": "2015-12-12",
  "link": "www.google.com.br",
  "img_link": "www.google.com.br",
  "user_id": "1",
  "created_at": "2015-12-23",
  "updated_at": "2015-12-23"
}];
    this.busy = false;
    this.last = 5;
  };

  SoPromocoes.prototype.nextPage = function() {
    if (this.busy) return;
    this.busy = true;

    var url = "http://localhost:3100/promotions.json";
    $http.get(url).success(function(data) {
      var items = data;
      for (var i = 0; i < items.length; i++) {
        this.items.push(items[i].data);
      }
      this.last = this.items.length - 1;
      //this.busy = false;
    }.bind(this));
  };

  return SoPromocoes;
});