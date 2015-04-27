app = angular.module 'myApp',[]

cms = [ { 'zones': 'main': 'widgets': [
  2:{
    'type': 'headline-directive'
    'contents':
      'editable': 'h1-editable': 'Hello World'
      'nested-widgets': {}
  }
  1: {
    'type': 'paragraph-directive'
    'contents':
      'editable': 'p-editable': 'lorem ipsum dolor sit.'
      'nested-widgets': {}
  }
] } ]

class BaseController
  constructor: (@$scope = $scope) ->
    @$scope.data = cms[0]
    @$scope.zones = $scope.data.zones
    console.log @$scope.zones



app.controller 'BaseController', ['$scope', BaseController]

app.directive 'headlineDirective', [ ->
  template: '<h1>{{val}}</h1>'
  restrict: 'A'
]

app.directive 'paragraphDirective', [ ->
  template: '<p>{{val}}</p>'
  restrict: 'A'
]

app.directive 'mainDirective', [ ->
  template: '<div ng-transclude></div>'
  restrict: 'A'
  transclude: true
]
