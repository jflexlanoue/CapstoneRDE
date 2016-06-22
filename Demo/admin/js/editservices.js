angular.module("AdminPanel", ["AdminPanelServices"]);

var AdminPanelServices = angular.module('AdminPanelServices', []);

AdminPanelServices.controller('ServiceListController',

function ServiceListController($scope, $http) {

	console.log("Services Angular");
	
	$scope.Services = [];
	
	$scope.sService = {};
	
	
	$("#ServicesTab").addClass("active");
	
	
	$scope.getServices = function() {

		$scope.sService = {};
		$scope.Services = [];
		
		$http({
			method : 'POST',
			url : 'json/Query.cfm?req=getallservices',
			headers : {
						'Content-Type' : 'application/x-www-form-urlencoded'
						},
			timeout : 3000,
			
		}).success(function(data, status, header, config) {
			
			
			for (var i = 0; i < data.ROWCOUNT; i++) {
				var sr = {
					ArrayIndex : i,
					Id : data.DATA.ID[i],
					Name : data.DATA.NAME[i],
					LocCount : data.DATA.LOCATIONCOUNT[i]
				};
				$scope.Services.push(sr);
			}
			console.log("Retrieved " + data.ROWCOUNT + " services");


		}).error(function(data, status, header, config) {
			console.log('error');
		});
	};
	
	$scope.getServices();
	
	
	$scope.SelectService = function(service){
		$scope.sService.ArrayIndex = service.ArrayIndex;
		$scope.sService.Name = service.Name;
		$scope.sService.Id = service.Id
	}
	
	$scope.SaveService = function(){

		var ServId = $scope.sService.Id;
		var ServName = $scope.sService.Name;


		$.ajax({
			'url' : 'json/Query.cfm?req=saveservice',
			'type' : 'POST',
			'data' : ({
				id : ServId,
				name : ServName,
			}),
			'success' : function(result) {

				console.log("SavedService(" + ServId + ") " + ServName);
				


				$scope.Services[$scope.sService.ArrayIndex].Name = ServName;
				$scope.sService.Name = ServName;
				$scope.$apply();
			}
		});
		
	};
	
	
	$scope.DeleteService = function(){
		
		var ServiceId = $scope.sService.Id;
		console.log("Deleted (" + ServiceId + ") ");
		
		$.ajax({
			'url' : 'json/Query.cfm?req=deleteservice',
			'type' : 'POST',
			'data' : ({
				servid : ServiceId
			}),
			'success' : function(result) {
				$scope.getServices();
			}
		});
		
	}
	
	
	
});