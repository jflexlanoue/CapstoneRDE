 var app = angular.module("myModule", ['angularUtils.directives.dirPagination','ngSanitize','ui.bootstrap']);
 app.controller("myController", function ($scope, $http, $timeout, $compile) {
		 
             $scope.searchResult = {
                		Name : "",
                		WebSite : "",
                		Hours : "",
                		Phone : "",
                		Address : "",
                		Lat : "",
                		Long : "",
<<<<<<< HEAD
                		Service: "",
             };
             $scope.searchResults = [];
             $scope.activeResults = {};
             $scope.changeActiveMap = function(index){
       			$scope.activeResults = index;
       		 };
       		 
       		 $scope.changeActiveMarker= function(idOfMarker){
       		 $scope.activeResults = {
       				Name : idOfMarker.title,
            		WebSite : idOfMarker.web,
            		Hours : idOfMarker.hour,
            		Phone : idOfMarker.phn,
            		Address : idOfMarker.add,
            		Lat : "",
            		Long : "",
       		 	}; 
       		 };
       		 
       		 $scope.getFilteredData = function(filterData) {
       			 console.log(filterData);
       			$http({
       				//url: "http://67.80.252.63:8500/CapstoneRDE/Demo/json/providerlistJSON.cfm", 
       				//data : { "term" : filterData }
       				url: "http://67.80.252.63:8500/CapstoneRDE/Demo/JSON/searchJSON.cfm?term=nj"
       			})
            	.success(function(data,status,header,config){
            		$scope.searchResults = [];
            		for (var i =0; i < data.ROWCOUNT; i++) {
            			if (filterData.toLowerCase().indexOf(data.DATA.NAME[i].toLowerCase()) > -1 ) {
            				var sr = {
                    				Name : data.DATA.NAME[i],
                            		WebSite : data.DATA.WEBSITE[i],
                            		Hours : data.DATA.HOURS[i],
                            		Phone : data.DATA.PHONE[i],
                            		Address : data.DATA.ADDRESS[i],
                            		Lat : data.DATA.GEO_LAT[i],
                            		Long : data.DATA.GEO_LNG[i],
                            		Service: data.DATA.SERVICES[i].replace(/\|/g,'<br />'),
                    			};
                    			$scope.searchResults.push(sr);
                    			$scope.showOnMap(sr, true);		
            			}            			
            		}            		
            	})
            	.error(function(data,status,header,config){
            		alert("ERROR");
            	});
       		 };
       		 
       		  $scope.getData = function(){
                	$http({url: "http://67.80.252.63:8500/CapstoneRDE/Demo/JSON/searchJSON.cfm?term=nj"})
=======
                };
                $scope.searchResults = [];
                $scope.getData = function(){
                	$http({url: "JSON/searchJSON.cfm?term=hiv"})
>>>>>>> origin/master
                	.success(function(data,status,header,config){
                		for (var i =0; i < data.ROWCOUNT; i++) {
                			var sr = {
                				Name : data.DATA.NAME[i],
                        		WebSite : data.DATA.WEBSITE[i],
                        		Hours : data.DATA.HOURS[i],
                        		Phone : data.DATA.PHONE[i],
                        		Address : data.DATA.ADDRESS[i],
                        		Lat : data.DATA.GEO_LAT[i],
                        		Long : data.DATA.GEO_LNG[i],
                				Service: data.DATA.SERVICES[i].replace(/\|/g,'<br />'),	
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
                        zoom: 7,
                        center: new google.maps.LatLng(40.0654607,-74.5916748),
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    }
                $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);  
                $scope.createGeoMarker = function(info) {
                	  var marker = new google.maps.Marker({
                        map: $scope.map,
                        position: new google.maps.LatLng(info.lat, info.long),
                        title: info.companyName,
                        animation: google.maps.Animation.DROP,
                        fit:true,
                      });
	                  marker.web =info.web;
	                  marker.hour =info.hour;
	                  marker.add =info.add;
	                  marker.phn =info.phn;
	                  google.maps.event.addListener(marker, 'click', function(){
	                	  var infoWindowContentHtml = '<div class="info-window"><h2>' + marker.title + '</h2><br/>' +
 						 	'<b>Address: </b>'+'<a href="https://www.google.com/maps?q='+marker.add+'" target="_blank">'+marker.add+'</a>'+
 						 	'<br/><b>Hour: </b>'+ marker.hour +'<br/>'+ 
 						 	'<b>Phone: </b>'+marker.phn +'<br/>'+
 						 	'<b>Website: </b>'+'<a href="'+marker.web+'" target="_blank">'+marker.web+'</a>'+
 						 	'<br/><button class="btn btn-default" data-toggle="modal" data-target="#service-info" ng-click="changeActiveMarker(marker);" data-keyboard="true">More</button></div>';
	                	  infoWindow.setContent(infoWindowContentHtml);
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
	                             long : sr.Long,
	                             web: sr.WebSite,
	                             hour: sr.Hours,
	                             phn: sr.Phone,
	                             add: sr.Address
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
 
 
 
 
 
 
