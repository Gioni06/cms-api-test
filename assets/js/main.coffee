app = angular.module 'myApp',[]

cms = [ { 'zones': 'main': 'widgets': [
  1:{
    'type': 'headline'
    'contents':
      'editable': 'Hello World'
      'nested-widgets': {}
  }
  2: {
    'type': 'paragraph'
    'contents':
      'editable': 'lorem ipsum dolor sit.'
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
  scope:
    text: '=text'
  templateUrl: 'js/templates/h1-widget.html'
  restrict: 'A'
]

app.directive 'paragraphDirective', [ ->
  scope:
    text: '=text'
  templateUrl: 'js/templates/p-widget.html'
  restrict: 'A'
]

app.directive 'mainDirective', [ ->
  template: '<div ng-transclude></div>'
  restrict: 'A'
  transclude: true
]
