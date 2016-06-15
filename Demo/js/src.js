var app = angular.module("myModule", ['angularUtils.directives.dirPagination','ngSanitize','ui.bootstrap','matchMedia']);
 app.controller("myController", function ($scope, $http, $timeout, $compile, screenSize) {


	$scope.currentPage = 1;

	 if (screenSize.is('sm, md, lg')) {
	 	$scope.desktop = true;
	 	$scope.mobile = false;
	 } else{
	 	 $scope.mobile = true;
	 	 $scope.desktop = false;
	 }
	 
	setLayoutSize();


	  $scope.pageChanged = function() {
	  		
	     	$('#srDiv').scrollTop(0);
	     	$('body').scrollTop(0);
	     	
	     	
	  };
  
  
  
	 $scope.desktop = screenSize.on('sm, md, lg', function(match){
		    $scope.desktop = match;
		     setLayoutSize();
		});
	$scope.mobile = screenSize.on('xs', function(match){
		    $scope.mobile = match;
		    
		    setLayoutSize();
		   
		});

		function setLayoutSize(){
		 
			 if($scope.mobile){
			 	$("#srDiv").css({"overflow":"hidden","height":"auto"})
			 	
			 } else{
			  	$("#srDiv").css({"overflow":"auto","height":"100%"});
			  	
			 }
		}
		

/*
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
*/ 
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
	       		 $scope.currentPage = 1;
	       		 
	       		 $('#srDiv').scrollTop(0);
       		 }


       		 $scope.getFilteredData = function(searchTerms, searchProviders, searchServices) {


       			 console.log("Requesting Data For Search: Term=" + searchTerms + " Services=" + searchServices + " Providers=" + searchProviders);


       			    //Uses $.param function from NodeJS to send POST data http://stackoverflow.com/a/31475710
       			$http({
       						method: 'POST',
        					url: 'json/searchJSON.cfm',
        					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        					timeout: 3000,
        					data: $.param({ terms : searchTerms,
        									providers : searchProviders,
        									services : searchServices })
       				})
            	.success(function(data,status,header,config){

						$scope.clearResults();
						
						$scope.map.setOptions(mapOptions);
						
						//Settings Google Maps view based on results http://stackoverflow.com/a/22712105
						
						var bounds = new google.maps.LatLngBounds();
						
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
	                            		Service: data.DATA.SERVICES[i].split("|"),
	                            		ServiceMatch: data.DATA.SERVICESMATCH[i]
	                    			};
	
								
	                    		sr.Marker = $scope.createGeoMarker(sr, true);
	                    		$scope.searchResults.push(sr);
	                    		
	                    		bounds.extend(new google.maps.LatLng(sr.Lat,sr.Long));
	                    }
                    	
                    	$("#resultcount").text(data.ROWCOUNT);
  						$("#resultcountXS").text(data.ROWCOUNT);
  					
                    if(data.ROWCOUNT == 0){
                    	$("#NoResultsWarning").removeClass('hidden');
                    }
                    else{
                    	$("#NoResultsWarning").addClass('hidden');
                    	
                    	google.maps.event.addListenerOnce($scope.map, 'bounds_changed', function(event) {
							  if (this.getZoom() > 15) {
							    this.setZoom(15);
							  }
							  if (this.getZoom() < 3) {
							    this.setZoom(3);
							  }
						});
						$scope.map.fitBounds(bounds);
                    }

            	})
            	.error(function(data,status,header,config){
            		$("#serverError").removeClass('hidden')
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
                    var center = $scope.map.getCenter();
                    google.maps.event.trigger($scope.map, 'resize',{});
                    $scope.map.setCenter(center);
                    
                });


                $scope.map2 = new google.maps.Map(document.getElementById('map2'), mapOptions2);
                jQuery('#service-info')
                .on('shown.bs.modal',
                     function(){
                	   
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

            		var infoWindowContentHtml = 
            			
            					'<div class="info-window ">'+
            			
            						'<h4>' + sr.Name + '</h4>' +
					 				'<div><span class="glyphicon glyphicon-map-marker"></span>'+'<a href="https://www.google.com/maps?q=' + sr.Address + '" target="_blank">' + sr.Address + '</a></div>'+
					 				'<div><span class="glyphicon glyphicon-calendar" style="float:left;"></span> '+ sr.Hours + '</div>' + 
					 				'<div><span class="glyphicon glyphicon-earphone"></span> ' + sr.Phone + '</div>' +
					 				'<div><span class="glyphicon glyphicon-home"> </span>' + '<a href="' + sr.WebSite + '" target="_blank"> Homepage</a></div>'+
					 				'<button class="btn btn-default" style="float:right;" data-toggle="modal" data-target="#service-info" ng-click="changeActiveMarker(' + sr.Index + ')" data-keyboard="true">More</button>'+
					 			'</div>';

                	  var marker = new google.maps.Marker({
                        map: onPageLoad ? $scope.map : $scope.map2,
                        position: new google.maps.LatLng(sr.Lat, sr.Long),
                        title: sr.Name,
                        animation: google.maps.Animation.DROP,
                        fit:true,
                        content: onPageLoad ? $compile(infoWindowContentHtml)($scope)[0] : null 
                      });
                	  
                	  
                	  
                	  if(onPageLoad){
		                  google.maps.event.addListener(marker, 'click', function(){
	
						      infoWindow.setContent(this.content)
		                	  infoWindow.open($scope.map, marker);
		                  });
                	  }
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

