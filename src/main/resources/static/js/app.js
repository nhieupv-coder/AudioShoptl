var app = angular.module('myApp', ["ngRoute"]);
app.config(function($routeProvider){
    $routeProvider.when("/home",{
        templateUrl: "/views/home.html"
    }).when("/products",{
        templateUrl: "/views/product.html"
    }).otherwise({
        redirectTo: "/home"
    })
})
