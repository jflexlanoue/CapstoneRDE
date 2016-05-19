 var app = angular.module("myModule", ['angularUtils.directives.dirPagination','ngSanitize']);
 app.controller("myController", function ($scope, $http,$timeout) {
            	
                $scope.searchResult = {
                		Name : "",
                		WebSite : "",
                		Hours : "",
                		Phone : "",
                		Address : "",
                		Lat : "",
                		Long : "",
                };
                $scope.searchResults = [];
                $scope.getData = function(){
                	$http({url: "SearchJSON.txt"})
                	.success(function(data,status,header,config){
                		for (var i =0; i < data.ROWCOUNT; i++) {
                			var sr = {
                				Name : data.DATA.NAME[i],
                        		WebSite : data.DATA.WEBSITE[i],
                        		Hours : data.DATA.HOURS[i],
                        		Phone : data.DATA.PHONE[i],
                        		Address : data.DATA.ADDRESS[i],
                        		Lat : data.DATA.GEO_LAT[i],
                        		Long : data.DATA.GEO_LNG[i]
                			};
                			$scope.searchResults.push(sr);
                			$scope.showOnMap(sr, true);
                		}	
                	})
                	.error(function(data,status,header,config){
                		alert("ERROR");
                	});
                };
                var mapOptions = {
                        zoom: 4,
                        center: new google.maps.LatLng(40.0000, -98.0000),
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    }
                $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);  
                $scope.createGeoMarker = function(info) {
                	var marker = new google.maps.Marker({
                        map: $scope.map,
                        position: new google.maps.LatLng(info.lat, info.long),
                        title: info.companyName,
                        fit:true,
                    });
                  marker.content =info.desc;   
                    google.maps.event.addListener(marker, 'click', function(){
                        infoWindow.setContent('<h2>' + marker.title + '</h2>' + marker.content);
                        infoWindow.open($scope.map, marker);
                    });
                	return marker;
                };
                //info window-content
                $scope.showOnMap = function(sr, hideInfoWindow) {
                	var info =  {
	                			 companyName : sr.Name,
	                             desc : sr.Name,
	                             lat : sr.Lat,
	                             long : sr.Long
                              };
                	var marker = $scope.createGeoMarker(info);
                	google.maps.event.trigger(marker, 'click');
                	if (hideInfoWindow) {
                		infoWindow.close($scope.map,marker);
                		// to hide marker InfoWindow 		
                	} 	
                };
                //on select view info window
                  var infoWindow = new google.maps.InfoWindow();  
                  $scope.openInfoWindow = function(e, selectedMarker) { 
                      e.preventDefault();
                      google.maps.event.trigger(selectedMarker, 'click');
                  }   
                 $scope.getData();                
            });
 

 
 
 
 
 
 
 
 
