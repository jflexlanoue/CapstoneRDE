<!-- Jay Suthar
Functionality:
1. link to Google Maps for directions for each location
2. Basic Search: type any keyword
	-Matches services & locations
	-Results: all locations matched by keyword, all locations that serve services matched by keyword
3. Click on the address, link to the map/ link to google map along with user's location and the destination address
     - In desktop, the map is visible all the time / mobile view - map is only visible in modal window
4. Click on map should show you full listing / clicking on marker will show info window
		- Click on location in search results should bring you to the pin on the map / clicking on the service brings to pin on the map
5. Bootstrap Modal with Angularjs
6. Implement select2-jquery
7. Server Side searching/filtering/pagination
-->


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width,minimum-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/css/select2.min.css" rel="stylesheet" />
<style type="text/css">
	body {
    max-width: auto;
    overflow-x: hidden;
	position: relative;
}
  #map {
  	 height:550px;
     width:100%;
  }
 #map2 {
  	 height:300px;
     width:450px;
  }
  .search-results { list-style-type:none !important; }

::-webkit-scrollbar
{
    width:0px;
}
::-webkit-scrollbar-track-piece
{
    background-coor:transparent;
}

</style>
<title></title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.min.js"> </script>
<script src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.2/angular-sanitize.js"></script>
<script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.10.0.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.min.js"></script>
<script type="text/javascript" src="lib/angular-media-queries/match-media.js" ></script>
<script src="lib/dirPagination.js" type="text/javascript"></script>
<script src="js/src.js"></script>
<script type="text/javascript">

	//Executes when the page First Loads
	$(document).ready(function() {

		//Load Provider Data for Advanced Search
		var providerData = [];

		$.when(getSearchProviders()).done(function() {
			$(".search-providers").select2({
			  data: providerData,
			  tags: false,
			  placeholder: 'Providers',
			  closeOnSelect: false,
			  allowClear: true,
			  multiple: true
			});
		});

		function getSearchProviders() {
			var dfr = $.Deferred();
			$.ajax({
				url: "json/providerlistJSON.cfm",
			    dataType: 'json',
			    success : function(results) {
					for (var i =0; i < results.ROWCOUNT; i++) {
						providerData.push({
							id : results.DATA.ID[i],
							text : results.DATA.NAME[i]
						});
					}
					dfr.resolve();
			    },
			    error : function(req, status, error) { console.log("get Provider data failed!"); }
			});
			return dfr.promise();
		};

		//Load Services Data for Advanced Search
		var serviceData = [];

		$.when(getSearchServices()).done(function() {
			$(".search-services").select2({
			  data: serviceData,
			  tags: false,
			  placeholder: 'Services',
			  closeOnSelect: false,
			  allowClear: true,
			  multiple: true
			});
		});

		function getSearchServices() {
			var dfr = $.Deferred();
			$.ajax({
				url: "json/servicelistJSON.cfm",
			    dataType: 'json',
			    success : function(results) {
					for (var i =0; i < results.ROWCOUNT; i++) {
						serviceData.push({
							id : results.DATA.ID[i],
							text : results.DATA.NAME[i]
						});
					}
					dfr.resolve();
			    },
			    error : function(req, status, error) { console.log("get Service data failed!"); }
			});
			return dfr.promise();
		};


		$("#btnSearch").on("click", function() {

			var searchterms = $('.search-terms').val();
			var searchProviders = [];

			var searchProvidersData = $('.search-providers').select2('data');
			if (searchProvidersData.length > 0) {

				for (var i = 0; i < searchProvidersData.length; i++) {
					searchProviders.push(searchProvidersData[i].id);
				}
			}

			var searchServices = [];
			var searchServicesData = $('.search-services').select2('data');
			if (searchServicesData.length > 0) {

				for (var i = 0; i < searchServicesData.length; i++) {
					searchServices.push(searchServicesData[i].id);
				}
			}
			angular.element(document.getElementById('myCtrlDiv')).scope().getFilteredData(searchterms, searchProviders.join(','), searchServices.join(','));
		});
	});

</script>
</head>
<body ng-app="myModule">
<div class="container-fluid">
<div class="row">
<div class="col-sm-4">
	<div name="MainSearch">
		<div id="BasicSearch" style="width:auto;">
			<h2>Basic Search</h2>
				<input class="form-control search-terms" placeholder="Search" type="text" autofocus="autofocus" />
				<button type="button" class="btn btn-default"  id="btnSearch" >
	  				<span class="glyphicon glyphicon-search"></span>
				</button>
		</div>
		<div name="AdvancedSearch" style="width:auto;">
			<h2>Advanced Search</h2>
			<h3>Providers</h3>
			<select class="search-providers form-control selectpicker"  multiple="multiple"></select>
			<h3>Services</h3>
			<select class="search-services form-control selectpicker"  multiple="multiple"></select>
		</div>
	</div>
</div>
</div>
	<div ng-controller="myController" id="myCtrlDiv" name="myCtrlDiv">
		<h2>Search Results</h2>
		<div class="modal fade" id="service-info" tabindex='-1'>
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
							{{$scope.activeResults.Name}}
						<h2>{{activeResults.Name}}</h2>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-5">
								<ul>
									<li style="cursor:pointer;"><strong>Address:</strong>
									<a ng-href="https://www.google.com/maps?q={{activeResults.Address}}" target="_blank">{{ activeResults.Address }}</a> </li>
									<li><strong>Hours: </strong><div ng-bind-html='activeResults.Hours'></div> </li>
									<li><strong>Phone: </strong> {{ activeResults.Phone }} </li>
									<li><strong>Website: </strong><a ng-href="{{activeResults.WebSite}}" target="_blank">{{ activeResults.WebSite }}</a></li>
								</ul>
							</div>
							<div class="col-sm-7">

			                <div id="map2" class="img-responsive" ng-show="mobile"> </div>

							<div>
								<h2 class="lead" align="center"><b> Services </b></h2>

							</div>
								<ul class="list-group">
									<li class="list-group-item"><div ng-bind-html ='activeResults.Service'></div></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						  <button class="btn btn-danger pull-right" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5" style="height:550px; width:400px; overflow:hidden;">
			<div style="height:550px; width:auto; overflow:auto; padding-right: 34px; margin:auto;">
			 	<ul dir-paginate ="sr in searchResults | itemsPerPage: 4" class="search-results">
				   <li ng-click="showOnMap(sr, false)" style="cursor:pointer;"><h2>{{ sr.Name}}</h2></li>
	               <li style="cursor:pointer;"><a ng-href="https://www.google.com/maps?q={{sr.Address}}" target="_blank">{{ sr.Address }}</a> </li>
				   <li><div ng-bind-html='sr.Hours'></div> </li>
	               <li> {{ sr.Phone }} </li>
	               <li><a ng-href="{{sr.WebSite}}" target="_blank">{{ sr.WebSite }}</a></li>
	               <li><button class="btn btn-default" data-toggle="modal" data-target="#service-info" ng-click="changeActiveMarker(sr.Index)" data-keyboard="true">More</button> </li>
				</ul>
				<div align="middle">
				<dir-pagination-controls
			       max-size="4"
			       direction-links="true"
			       auto-hide ="true"
			       boundary-links="true">
    			</dir-pagination-controls>
				</div>
				</div>
		      </div>
		     <div class="col-sm-7">
				<div id="map" ng-show="desktop" ></div>
			 </div>
		   </div>
	     </div>
		</div>
		</div>
</div>
</body>
</html>