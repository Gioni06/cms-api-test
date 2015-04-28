

app = angular.module('myApp',['ngDraggable']).run ($rootScope) ->
  $rootScope.Utils =
    keys: Object.keys


cms = [ { 'zones': 'main': 'widgets': [
  {
    'type': 'headline'
    'contents':
      'editable': 'Hello World'
      'nested_widgets': {}
  },
  {
    'type' : 'panel'
    'contents':
      'editable': "The Title"
      'nested_widgets': [
        {
          'type': 'paragraph'
          'contents':
            'editable': 'lorem ipsum dolor sit.'
            'nested_widgets': [{}]
        }
      ]
  },
  {
    'type': 'paragraph'
    'contents':
      'editable': 'lorem ipsum dolor sit.'
      'nested_widgets': {}
  }
] } ]


class BaseController
  constructor: ($scope) ->
    $scope.data = cms[0]
    $scope.zones = $scope.data.zones
    $scope.widgets = $scope.zones.widgets
    $scope.onDropComplete = ($data, $event) ->
      # console.log "the curren zone: " + $data.zone
      # console.log "the curren index: " + $data.index
      console.log "ON DROP"
      console.log $data
      console.log $event.event.target
    $scope.onDragSucess = ($data, $event) ->
      console.log "ON DRAG"
      console.log $data
      console.log $event.target
      # console.log Object.keys($scope.zones).toString()
      # console.log cms
    $scope.onClick = ($index) ->
      constructor: (@$scope = $scope)
      $index--
      $scope.$digest

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
