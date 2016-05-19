<!-- Jay Suthar
Functionality:
1. link to Google Maps for directions for each location
2. Basic Search: type any keyword
	-Matches services & locations
	-Results: all locations matched by keyword, all locations that serve services matched by keyword
3. Click on the address, link to the map/ link to google map along with user's location and the destination address
     - In desktop, the map is visible all the time
4. Click on map should show you full listing / clicking on marker will show info window
		- Click on location in search results should bring you to the pin on the map / clicking on the service brings to pin on the map
5. Paging
-->


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style type="text/css">
  #map {
  	 height:550px;
     width:100%;
  }
  .search-results { list-style-type:none !important; }
</style>
<title></title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script data-require="angular.js@*" data-semver="1.3.15" src="https://code.angularjs.org/1.3.15/angular.js"></script>
<script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.min.js"> </script>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.2/angular-sanitize.js"></script>
<script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.10.0.js" type="text/javascript"></script>
<script src="dirPagination.js" type="text/javascript"></script>
<script src="src.js"></script>
</head>
<body ng-app="myModule"><br/>
<div class="input-group col-md-offset-4" style="width:35%;">
<input class="form-control" ng-model="searchMapa" placeholder="Search" type="text" ng-change="filter()" /> <span class="input-group-addon">
<span class="glyphicon glyphicon-search"></span>
</span>
</div>
<br/>
<div class="container-fluid">
<div ng-controller="myController">
		<div class="row">
			<div class="col-sm-4" style="height:550px; overflow-y:scroll;">
			 	<ul dir-paginate ="sr in searchResults | filter:searchMapa | itemsPerPage: 4" class="search-results">
				   <li ng-click="showOnMap(sr, false)" style="cursor:pointer;"><h2>{{ sr.Name}}</h2></li>
	               <li style="cursor:pointer;"><a ng-href="https://www.google.com/maps?saddr=My+Location&daddr={{sr.Lat}}+{{sr.Long}}" target="_blank"> {{ sr.Address }}</a> </li>
				   <li> <div ng-bind-html='sr.Hours'></div> </li>
	               <li> {{ sr.Phone }} </li>
	               <li><a ng-href="{{sr.WebSite}}" target="_blank">{{ sr.WebSite }}</a></li>
				</ul><div align="middle">
				<dir-pagination-controls
			       max-size="10"
			       direction-links="true"
			       boundary-links="true" >
    			</dir-pagination-controls>
			</div>
	      </div>
	     <div class="col-sm-8">
		<div id="map"></div>
	   </div>
     </div>
</div>
</div>
</body>
</html>













