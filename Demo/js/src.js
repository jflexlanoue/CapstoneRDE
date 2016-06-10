var app = angular.module("myModule", ['angularUtils.directives.dirPagination','ngSanitize','ui.bootstrap','matchMedia']);
 app.controller("myController", function ($scope, $http, $timeout, $compile,screenSize) {

	 $scope.desktop = screenSize.on('sm, md, lg', function(match){
		    $scope.desktop = match;
		    
		});
		$scope.mobile = screenSize.on('xs', function(match){
		    $scope.mobile = match;
		     $scope.mobile ? $("#srDiv").css({"overflow-y":"hidden","height":"auto","width":"auto"}) : $("#srDiv").css({"overflow-y":"auto","height":"600px"});
		});


		 	//Structure for 1 Entry of the Search Results
             $scope.searchResult = {
             			Index: "",
                		Name : "",
                		WebSite : "",
                		Hours : "",
                		Phone : "",
                		Address : "",
                		Lat : "",
                		Long : "",
                		Service: "",
                		ServiceMatch: "",
                		Marker: ""
             };

             $scope.markers = [];


             //Holds the Results of the last search
             $scope.searchResults = [];

             //Holds Entry for the Search Result currently Selected. (Full-Screen Modal View)
             $scope.activeResults = {};


       		 $scope.changeActiveMarker= function(idOfMarker){
	       		 $scope.activeResults = $scope.searchResults[idOfMarker];
       		 };

       		 $scope.clearResults = function(){
       		 	console.log("Clearing Old Results");

	       		 for (var i =0; i < $scope.searchResults.length; i++) {
	       		 	google.maps.event.clearListeners($scope.searchResults[i].Marker, 'click');
	       		 	$scope.searchResults[i].Marker.setMap(null);
	       		 }
	       		 $scope.searchResults = [];
       		 }


       		 $scope.getFilteredData = function(searchTerms, searchProviders, searchServices) {


       			 console.log("Requesting Data For Search: Term=" + searchTerms + " Services=" + searchServices + " Providers=" + searchProviders);


       			    //Uses $.param function from NodeJS to send POST data
                	//http://stackoverflow.com/a/31475710
       			$http({
       						method: 'POST',
        					url: 'json/searchJSON.cfm',
        					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        					data: $.param({ terms : searchTerms,
        									providers : searchProviders,
        									services : searchServices })
       				})
            	.success(function(data,status,header,config){

						$scope.clearResults();
						
						$scope.map.setOptions(mapOptions);
						
						
						
            		for (var i =0; i < data.ROWCOUNT; i++) {
            				var sr = {
            						Index : i,
                    				Name : data.DATA.NAME[i],
                            		WebSite : data.DATA.WEBSITE[i],
                            		Hours : data.DATA.HOURS[i],
                            		Phone : data.DATA.PHONE[i],
                            		Address : data.DATA.ADDRESS[i],
                            		Lat : data.DATA.GEO_LAT[i],
                            		Long : data.DATA.GEO_LNG[i],
                            		Service: data.DATA.SERVICES[i].replace(/\|/g,'<br />'),
                            		ServiceMatch: data.DATA.SERVICESMATCH[i]
                    			};

                    			sr.Marker = $scope.createGeoMarker(sr, true);
                    			$scope.searchResults.push(sr);
                    }
                    $("#resultcount").text(data.ROWCOUNT);
  					$("#resultcountXS").text(data.ROWCOUNT);
  
            	})
            	.error(function(data,status,header,config){
            		alert("ERROR");
            	});
       		 };

       		   var mapOptions = {
                        zoom: 4,
                        center: new google.maps.LatLng(38,-95),
                        mapTypeId: google.maps.MapTypeId.ROADMAP,
                        scrollwheel: false,
                        panControl: true,
                        zoomControl: true,
                        mapTypeControl: true,
                        scaleControl: true,
                        streetViewControl: true,
                        overviewMapControl: true,
                        rotateControl: true,
                    }

                var mapOptions2 = {
                        zoom: 12,
                        center: new google.maps.LatLng(38,-95),
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

                $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);
                google.maps.event.addDomListener(window, "resize", function() {
                    google.maps.event.trigger($scope.map, 'resize',{});
                    $scope.map.setCenter(new google.maps.LatLng(38,-95));
                });

                $scope.map2 = new google.maps.Map(document.getElementById('map2'), mapOptions2);
                jQuery('#service-info')
                .on('shown.bs.modal',
                     function(){
                	   console.log($scope.activeResults.Name);
                       google.maps.event.trigger($scope.map2,'resize',{});
                       $scope.map2.setCenter(new google.maps.LatLng($scope.activeResults.Lat,$scope.activeResults.Long));
                       google.maps.event.addDomListener(window, "resize", function() {
                    	   google.maps.event.trigger($scope.map2,'resize',{});
                           $scope.map2.setCenter(new google.maps.LatLng($scope.activeResults.Lat,$scope.activeResults.Long));
                       });
                       var sr = {
       						Index : 0,
               				Name : $scope.activeResults.Name,
                       		WebSite : $scope.activeResults.WebSite,
                       		Hours : $scope.activeResults.Hours,
                       		Phone : $scope.activeResults.Phone,
                       		Address : $scope.activeResults.Address,
                       		Lat : $scope.activeResults.Lat,
                       		Long : $scope.activeResults.Long,
                       		Service: "",
               			};
               			$scope.createGeoMarker(sr, false);
                    });

                $scope.createGeoMarker = function(sr, onPageLoad) {

                		//ng-click for a button inside a google map marker
                		//https://forum.ionicframework.com/t/ng-click-in-google-maps-infowindow/5537/3

            		var infoWindowContentHtml = '<div class="info-window"><h2>' + sr.Name + '</h2><br/>' +
					 	'<b>Address: </b>'+'<a href="https://www.google.com/maps?q=' + sr.Address + '" target="_blank">' + sr.Address + '</a>'+
					 	'<br/><b>Hours: </b>'+ sr.Hours +'<br/>'+
					 	'<b>Phone: </b>' + sr.Phone + '<br/>'+
					 	'<b>Website: </b>'+'<a href="' + sr.WebSite + '" target="_blank">' + sr.WebSite + '</a>'+
					 	'<br/><button class="btn btn-default" data-toggle="modal" data-target="#service-info" ng-click="changeActiveMarker(' + sr.Index + ')" data-keyboard="true">More</button></div>';

                	  var compiled =  $compile(infoWindowContentHtml)($scope);
                	  var marker = new google.maps.Marker({
                        map: onPageLoad ? $scope.map : $scope.map2,
                        position: new google.maps.LatLng(sr.Lat, sr.Long),
                        title: sr.Name,
                        animation: google.maps.Animation.DROP,
                        fit:true,
                        content: compiled[0]
                      });

	                  google.maps.event.addListener(marker, 'click', function(){

					      infoWindow.setContent(this.content)
	                	  infoWindow.open($scope.map, marker);
	                  });
	                  return marker;
                };

                //info window-content
                $scope.showOnMap = function(sr, hideInfoWindow) {

                	google.maps.event.trigger(sr.Marker, 'click');

                	if (hideInfoWindow) {
                		infoWindow.close($scope.map,sr.Marker);
                		// to hide marker InfoWindow
                	}
                };

    //on select view info window
    var infoWindow = new google.maps.InfoWindow();
    $scope.getFilteredData("", "", "");
});

