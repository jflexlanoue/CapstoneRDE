
angular.module("AdminPanel", ["AdminPanelProviders"]);

var AdminPanelProviders = angular.module('AdminPanelProviders', []);

AdminPanelProviders.controller('ProviderListController',

function ProviderListController($scope, $http) {

	
	$scope.ProviderPage = {};
	
	
	$scope.ProviderPage.TotalCount = 0;
	$scope.ProviderPage.PageCurrent = 1;
	$scope.ProviderPage.PageMax = 1;
	$scope.ProviderPage.PageSize = 15;
	

	$scope.Services = [];

		
	
	$scope.sProvider = {};
	$scope.sLocation = {};
	
	$scope.sService = "";

	
	$("#ProvidersTab").addClass("active");
	
	

	$scope.getProviders = function(PageNumber, SelectIndex) {

		
		console.log ("Request Providers Page: " + PageNumber)
		if(PageNumber < 1 ) {
			PageNumber = 1;
		}
		
		if(PageNumber > $scope.ProviderPage.PageMax ){
			PageNumber = $scope.ProviderPage.PageMax;		
		}
		
		
		var SearchOffset = 0;
		var SearchCount = $scope.ProviderPage.PageSize;
		
		SearchOffset = SearchCount * (PageNumber-1);
		

		
		$http({
			method 	: 'POST',
			url 	: 'json/Query.cfm?req=getallproviders',
			headers : {'Content-Type' : 'application/x-www-form-urlencoded'},
			data 	: $.param
							({  Offset : SearchOffset, 
								ResultCount : SearchCount
							}),
			timeout : 3000,
			
		}).success(function(data, status, header, config) {
			
			$scope.Providers = [];
			for (var i = 0; i < data.ROWCOUNT; i++) {
				var sr = {
					ArrayIndex : i,
					Id : data.DATA.ID[i],
					Name : data.DATA.NAME[i],
					LocCount : data.DATA.LOCATIONCOUNT[i],
				};
				$scope.Providers.push(sr);
			}
			
			console.log("Retrieved Providers: " + SearchOffset + " to " + (SearchOffset+SearchCount)  );
			
			$scope.ProviderPage.PageCurrent = PageNumber;
			
			$scope.SelectProvider(SelectIndex);

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
					
					var newProvId = result.split("|")[1];

					
					console.log("Created Provider " + ProvName);
					
					window.location.href = "./?p=providers&provid=" + newProvId;
					
					//$scope.getProviders($scope.ProviderPage.PageCurrent, 0);

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
				$scope.getProviders($scope.ProviderPage.PageCurrent,0);
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
	
	$scope.GetProviderCount = function(){
		
		console.log("Getting Provider Count");
		
		$http({
			method : 'POST',
			url : 'json/Query.cfm?req=getprovidercount',
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			},
			timeout : 3000,
		}).success(
				function(data, status, header, config) {

					$scope.ProviderPage.TotalCount = data.DATA.PROVIDERCOUNT[0];
					$scope.ProviderPage.PageCurrent = 1;
					$scope.ProviderPage.PageMax = Math.ceil($scope.ProviderPage.TotalCount / $scope.ProviderPage.PageSize);
					
					console.log($scope.ProviderPage.TotalCount + " Providers. " + $scope.ProviderPage.PageMax + " Pages" );
						
					
					$scope.LoadFirstPage();
					
				}).error(function(data, status, header, config) {
			console.log('Error Getting Provider Count');
		});
	};
	
	
	$scope.SwitchPage = function(cmd) {
		console.log(cmd);
		
		var PageRequest = 0;
		
		if($scope.ProviderPage.PageCurrent == 1){
			if(cmd == "first" || cmd == "prev"){
				return;
			}
		}
		
		if($scope.ProviderPage.PageCurrent == $scope.ProviderPage.PageMax){
			if(cmd == "next" || cmd == "last"){
				return;
			}
		}
		
		if(cmd == "first"){
			PageRequest = 1;
		} else if (cmd == "prev"){
			PageRequest = $scope.ProviderPage.PageCurrent - 1;
		} else if (cmd == "next"){
			PageRequest = $scope.ProviderPage.PageCurrent + 1;
		} else if (cmd == "last"){
			PageRequest = $scope.ProviderPage.PageMax;
		}
		
		$scope.getProviders(PageRequest,0);

		
	};
	
	$scope.getServices = function() {

		$http({
			method : 'POST',
			url : 'json/Query.cfm?req=getallservices',
			headers : { 'Content-Type' : 'application/x-www-form-urlencoded' },
			timeout : 3000,
			
		}).success(function(data, status, header, config) {

			
			$scope.Services = data.DATA.NAME;
			
			console.log("Retrieved " + data.ROWCOUNT + " services");


		}).error(function(data, status, header, config) {
			console.log('error');
		});
	};
	
	
	$scope.AddServiceToLocation = function(){

		var LocationId = $scope.sLocation.Id;
		
		$.ajax({
			'url' : 'json/Query.cfm?req=addservice',
			'type' : 'POST',
			'data' : ({
				locid : LocationId,
				servname : $scope.sService
			}),
			'success' : function(result) {
					
				console.log("Added Service: " + $scope.sService);
				$scope.SelectLocation();
			}
		
		});
	};
	
	$scope.RemoveServiceFromLocation = function(){
		
		var ServicesChecked = $("[class=ServiceCheck]");
		
		var ServicesId = [];
		
		for (var i = 0; i < ServicesChecked.length; i++) {
			if(ServicesChecked[i].checked){
				ServicesId.push(ServicesChecked[i].value);
			}
		}
		
		var LocationId = $scope.sLocation.Id;
		
		$.ajax({
			'url' : 'json/Query.cfm?req=removeservice',
			'type' : 'POST',
			'data' : ({
				locid : LocationId,
				servids : ServicesId.toString()
			}),
			'success' : function(result) {
					
				console.log("Removed Services: " + ServicesId);
				
				$scope.SelectLocation();
			}
		
		});
	};
	
	
	$scope.InitSelectedProvider = function(InitProviderOffset){
		$scope.InitProviderOffset = InitProviderOffset;
	}
	
	
	$scope.LoadFirstPage = function(){
		
		var InitPage = Math.ceil( $scope.InitProviderOffset / $scope.ProviderPage.PageSize);
		var InitPageIndex = $scope.InitProviderOffset % $scope.ProviderPage.PageSize;
		
		$scope.getProviders(InitPage, InitPageIndex-1);
		
	}
	
	$scope.InitProviderOffset = 0;

	
	$scope.getServices();
	
	$scope.GetProviderCount();
	
	
});