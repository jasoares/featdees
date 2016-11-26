// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether
//= require jquery_ujs
//= require bootstrap
//= require angular
//= require angular-resource
//= require_tree .

var app = angular.module('mainApp', ['ngResource']);

app.controller('FeaturedAttendeesController', ['$scope', '$http', '$resource', function($scope, $http, $resource){
    $scope.attendees = [];
    $scope.total_count = 0;
    $scope.attendee = null;
    var api_host = location.host === 'localhost:3000' ? 'api.lvh.me:3000' : 'api.' + location.host;
    $scope.next_page = 'http://' + api_host + '/featured_attendees/';

    var FeaturedAttendee = $resource($scope.next_page + ':id', { id: '@id' }, {
        get: { method: 'GET', params: { id: '@id' } }
    });

    $scope.fetchList = function(params) {
        $http({
            url: $scope.next_page,
            paramSerializer: '$httpParamSerializerJQLike',
            params: params
        }).then(function(response) {
            var resp = response['data'];
            $scope.total_count = resp['meta']['total-count'];
            $scope.next_page = resp['links']['next'];
            $scope.attendees = $scope.attendees.concat(resp['data']);
        });
    };

    $scope.fetch = function(id) {
        FeaturedAttendee.get({ id: id }).$promise.then(function(response) {
            $scope.attendee = response['data']['attributes'];
            $('#attendee-modal').modal('show');
        });
    };

    $scope.fetchList({ page: { number: 1, size: 100 } });
}]);
