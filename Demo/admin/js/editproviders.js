
angular.module("AdminPanel", ["AdminPanelProviders"]);

var AdminPanelProviders = angular.module('AdminPanelProviders', []);

AdminPanelProviders.controller('ProviderListController',

function ProviderListController($scope, $http) {

	
	
	$scope.Providers = [];

	$scope.sProvider = {};
	$scope.sLocation = {};
	$scope.sService = {};

	
	$("#ProvidersTab").addClass("active");
	
	
	$scope.getProviders = function() {

		$http({
			method : 'POST',
			url : 'json/Query.cfm?req=getallproviders',
			headers : {'Content-Type' : 'application/x-www-form-urlencoded'},
			timeout : 3000,
			
		}).success(function(data, status, header, config) {
			
			$scope.Providers = [];
			for (var i = 0; i < data.ROWCOUNT; i++) {
				var sr = {
					ArrayIndex : i,
					Id : data.DATA.ID[i],
					Name : data.DATA.NAME[i],
					LocCount : data.DATA.LOCATIONCOUNT[i]
				};
				$scope.Providers.push(sr);
			}
			console.log("Retrieved " + data.ROWCOUNT + " providers");

			$scope.SelectProvider(0);

		}).error(function(data, status, header, config) {
			console.log('error');
		});
	};

	$scope.SelectProvider = function(ArrayIndex) {

		var Provid = $scope.Providers[ArrayIndex].Id;

		$http({
			method : 'POST',
			url : 'json/Query.cfm?req=getprovider',
			headers : {'Content-Type' : 'application/x-www-form-urlencoded'},
			timeout : 3000,
			data : $.param({
				provid : Provid,
			})
		}).success(function(data, status, header, config) {

			console.log("Provider Loaded: " + Provid);

			var sr = {
				ArrayIndex : ArrayIndex,
				Id : data.DATA.ID[0],
				Name : data.DATA.NAME[0],
				Website : data.DATA.WEBSITE[0],
				Description : data.DATA.DESCRIPTION[0],
			};

			sr.Locations = [];

			var LocationsID = data.DATA.LOCATIONSID[0].split('|');
			var LocationsAddress = data.DATA.LOCATIONSADDRESS[0].split('|');
			
			
			for (var i = 0; i < LocationsID.length; i++) {
				var Location = {
					Id : LocationsID[i],
					Address : LocationsAddress[i],
				};
				
				if(Location.Id == ""){
					Location.Id = -1;
					Location.Address = "";
				}
				
				sr.Locations.push(Location);
			}
			$scope.sProvider = sr;

			$scope.sLocation = $scope.sProvider.Locations[0];


			$scope.SelectLocation();
			
			
			

		}).error(function(data, status, header, config) {
			console.log('error');
		});
	};

	$scope.SaveProvider = function() {

		var ProvID = $scope.sProvider.Id;
		var ProvName = $scope.sProvider.Name;
		var ProvWebsite = $scope.sProvider.Website;
		var ProvDesc = $scope.sProvider.Description;

		$.ajax({
			'url' : 'json/Query.cfm?req=saveprovider',
			'type' : 'POST',
			'data' : ({
				id : ProvID,
				name : ProvName,
				website : ProvWebsite,
				desc : ProvDesc
			}),
			'success' : function(result) {
				
				if(ProvID == -1) {
					
					console.log("Created Provider " + ProvName);
					$scope.getProviders();

				} else{
					console.log("Saved Provider(" + ProvID + ") " + ProvName);
					//$('#ProviderSaveResult').text(result);

					$scope.Providers[$scope.sProvider.ArrayIndex].Name = ProvName;
					$scope.$apply();
				
					$scope.SelectProvider($scope.sProvider.ArrayIndex);
				}
			}
		});
	}

	$scope.SelectLocation = function() {

		var Locid = $scope.sLocation.Id;

		if(Locid == -1){
			$scope.sLocation.Id = Locid;
			$scope.sLocation.ProviderId = $scope.sProvider.Id;
			$scope.sLocation.Address = "";
			$scope.sLocation.Phone = "";
			$scope.sLocation.Geo_Lat = 0;
			$scope.sLocation.Geo_Lng = 0;
			$scope.sLocation.Hours = "";
			console.log("Location Loaded(" + $scope.sLocation.Id + ") " + $scope.sLocation.Address);
			$scope.UpdateMap();
			return;
			
		}
		
		
		$http({
			method : 'POST',
			url : 'json/Query.cfm?req=getlocation',
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			},
			timeout : 3000,
			data : $.param({
				locid : Locid,
			})
		}).success(
				function(data, status, header, config) {

					$scope.sLocation.Id = data.DATA.ID[0],
					$scope.sLocation.ProviderId = data.DATA.PROVIDER_ID[0];
					$scope.sLocation.Address = data.DATA.ADDRESS[0],
					$scope.sLocation.Phone = data.DATA.PHONE[0],
					$scope.sLocation.Geo_Lat = data.DATA.GEO_LAT[0],
					$scope.sLocation.Geo_Lng = data.DATA.GEO_LNG[0],
					$scope.sLocation.Hours = data.DATA.HOURS[0],

					$scope.sLocation.Services = [];

					var ServicesID = data.DATA.SERVICESID[0].split('|');
					var ServicesName = data.DATA.SERVICESNAME[0].split('|');

					for (var i = 0; i < ServicesID.length; i++) {
						var Service = {
							Id : ServicesID[i],
							Name : ServicesName[i],
						};
						$scope.sLocation.Services.push(Service);
					}

					$scope.sService = $scope.sLocation.Services[0];

					console.log("Location Loaded(" + $scope.sLocation.Id + ") " + $scope.sLocation.Address);
					
					$scope.UpdateMap();

				}).error(function(data, status, header, config) {
			console.log('error');
		});
		
	}

	$scope.SaveLocation = function() {
		console.log("Save Location " + $scope.sLocation.Id);

		var LocID =  $scope.sLocation.Id;
		var LocProvId = $scope.sLocation.ProviderId;
		var LocAddr =  $scope.sLocation.Address;
		var LocPhone =  $scope.sLocation.Phone;
		var LocGeoLat =  $scope.sLocation.Geo_Lat;
		var LocGeoLng =  $scope.sLocation.Geo_Lng;
		var LocHours =  $scope.sLocation.Hours;

		$.ajax({
			'url' : 'json/Query.cfm?req=savelocation',
			'type' : 'POST',
			'data' : ({
				id : LocID,
				provid: LocProvId,
				addr : LocAddr,
				phone : LocPhone,
				geolat : LocGeoLat,
				geolng : LocGeoLng,
				hours : LocHours
			}),
			'success' : function(result) {
				//$('#LocationSaveResult').text(result);
				
				if(LocID == -1){
					$scope.Providers[$scope.sProvider.ArrayIndex].LocCount++;
					$scope.$apply();
					$scope.SelectProvider($scope.sProvider.ArrayIndex);
				}
				
			}
		});

	};

	$scope.NewLocation = function(){
		console.log("New Location");
		

		$scope.sService = {};
		
		$scope.sLocation = {};

		$scope.sLocation.Id = -1;
		$scope.sLocation.ProviderId = $scope.sProvider.Id;
		$scope.sLocation.Address = "";
		$scope.sLocation.Phone = "";
		$scope.sLocation.Hours = "";
		$scope.sLocation.Geo_Lat = 0;
		$scope.sLocation.Geo_Lng = 0;
		$scope.sLocation.Services = [];
		$scope.UpdateMap();
	}
	
	$scope.NewProvider = function(){
		console.log("New Provider");
		
		$scope.sLocation = {};
		$scope.sService = {};
		
		$scope.sProvider = {};
		
		$scope.sProvider.Id = -1;
		$scope.sProvider.Name = "";
		$scope.sProvider.Website = "";
		$scope.sProvider.Description = "";
		
	}
	
	$scope.DeleteLocation = function(){
		
		var LocId = $scope.sLocation.Id;
		
		
		$.ajax({
			'url' : 'json/Query.cfm?req=deletelocation',
			'type' : 'POST',
			'data' : ({
				id : LocId,
			}),
			'success' : function(result) {
				//$('#LocationSaveResult').text(result);
				
				$scope.Providers[$scope.sProvider.ArrayIndex].LocCount--;
				
				$scope.SelectProvider($scope.sProvider.ArrayIndex);

			}
		});
	}
	
	
	$scope.DeleteProvider = function(){
		
		var ProvId = $scope.sProvider.Id;
		
		$.ajax({
			'url' : 'json/Query.cfm?req=deleteprovider',
			'type' : 'POST',
			'data' : ({
				id : ProvId,
			}),
			'success' : function(result) {
				$scope.getProviders();
			}
		});
	}
	
    var mapOptions = {
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            scrollwheel: false,
            draggable: false,
            panControl: true,
            zoomControl: true,
            mapTypeControl: true,
            scaleControl: true,
            streetViewControl: true,
            overviewMapControl: true,
            rotateControl: true,
        }
	
	$scope.Map = new google.maps.Map(document.getElementById('LocationMap'), mapOptions);
	
    
    $scope.MapMarker = new google.maps.Marker();
    
    
	$scope.UpdateMap = function(){
		
		console.log ("Moving Map to Location: " +  $scope.sLocation.Geo_Lat + " , " + $scope.sLocation.Geo_Lng);
		$scope.MapMarker.setMap(null);
		var newloc = {lat: $scope.sLocation.Geo_Lat, lng: $scope.sLocation.Geo_Lng};
		
		$scope.Map.setCenter(newloc);
		$scope.Map.setZoom(5);
		
		$scope.MapMarker = new google.maps.Marker({position: newloc,map: $scope.Map,});
	}
	
	
	$scope.GeoLocate = function(){
		var addr = $scope.sLocation.Address;
		
		$.ajax({
			'url' : 'json/GeoLocate.cfm',
			'type' : 'POST',
			'data' : ({
				address : addr,
			}),
			'success' : function(result) {
				console.log(result);
				
				var splitres = result.split("|");
				
				$scope.sLocation.Geo_Lat =  parseFloat(splitres["2"]);
				$scope.sLocation.Geo_Lng =  parseFloat(splitres["3"]);
				$scope.UpdateMap();
				$scope.$apply();
			}
		});
		
		
	}
	
	
	$scope.getProviders();
	

});