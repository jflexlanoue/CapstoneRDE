		
		
		
		var getUsrLoc;
		var ipGetAdd;
		
		
		function GeoStuff(searchterms, searchProviders, searchServices){
			
			var geocoder = new google.maps.Geocoder();
                var address = document.getElementById("cityZip").value;
                var miles =  0;
                var userLoc;
				
				if (document.getElementById("box").checked == true) {
                	miles =  parseInt(document.getElementById("miles").value);

                	if (typeof(getUsrLoc) != "undefined") {
                		angular.element($('#myCtrlDiv')).scope().getFilteredData(searchterms, searchProviders.join(','), searchServices.join(','),getUsrLoc,miles);
                	}
                	else {
	                	geocoder.geocode({ 'address': address }, function (results, status) {
	                    	if (status == google.maps.GeocoderStatus.OK) {
	                  		userLoc = new google.maps.LatLng(results[0].geometry.location.lat(),results[0].geometry.location.lng());
					angular.element($('#myCtrlDiv')).scope().getFilteredData(searchterms, searchProviders.join(','), searchServices.join(','),userLoc,miles);
	                    	}
	                    	else {
	                  		angular.element($('#myCtrlDiv')).scope().getFilteredData(searchterms, searchProviders.join(','), searchServices.join(','),ipGetAdd,miles);
	                    	}
	                	});
                	}
			   	}
				else {
                    angular.element($('#myCtrlDiv')).scope().getFilteredData(searchterms, searchProviders.join(','), searchServices.join(','),userLoc,miles);
               	}
			
			
		}
		
		
		
		
		$(function(){
		$("#box").change(function(){
			var ck = this.checked;
			if(ck){
			$("#miles,#cityZip,#geoButton").prop("disabled",false);

			}else{
			$("#miles,#cityZip,#geoButton").prop("disabled",true);
			}
		});
		});
		
		function getLocation() {
		    if (navigator.geolocation) {
		        navigator.geolocation.watchPosition(showPosition);
		    } else {
		        alert("Geolocation is not supported by this browser.");
		    }
		}

		function showPosition(position) {
			 getUsrLoc = (new google.maps.LatLng(position.coords.latitude,position.coords.longitude));
			
		}

		function refreshPage(){
				window.location = ".";
			}

		function calcDistance(p1, p2) {
	 			return (google.maps.geometry.spherical.computeDistanceBetween(p1, p2)*0.000621371192).toFixed(2);
			}

		//getting location through IP address of the user

		$.get("http://ipinfo.io", function(response) {
		      ipGetAdd = (new google.maps.LatLng(response.loc.split(',')[0],response.loc.split(',')[1]));
		}, "jsonp");