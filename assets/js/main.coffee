app = angular.module 'myApp',[]

cms = [ { 'zones': 'main': 'widgets': [
  1:{
    'type': 'headline'
    'contents':
      'editable': 'Hello World'
      'nested_widgets': {}
  }
  3: {
    'type': 'paragraph'
    'contents':
      'editable': 'lorem ipsum dolor sit.'
      'nested_widgets': {}
  }
  2:{
    'type' : 'panel'
    'contents':
      'editable': "The Title"
      'nested_widgets':1:{
        'type': 'paragraph'
        'contents':
          'editable': 'Das ist genesteter Content'
          'nested-widgets': {}
      }
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

app.directive 'panelDirective', [ ->
  scope:
    text: '=text'
    include: '=include'
  templateUrl: 'js/templates/panel-widget.html'
  restrict: 'A'
]
