<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		<link href="lib/select2/4.0.2/css/select2.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/mainNew2.css">
		<title>
			HIV Resource Guide
		</title>
		
		<script src="https://maps.googleapis.com/maps/api/js?libraries=geometry,places&sensor=false"></script>
		
		<script src="lib/angularjs/1.4.8/angular.min.js"></script>
		<script src="lib/angularjs/1.5.0-beta.2/angular-sanitize.js"></script>
		<script src="lib/angular-ui/0.4.0/angular-ui.min.js"></script>
		<script src="lib/angular-media-queries/match-media.js"></script>
		<script src="lib/dirPagination.js"></script>
		<script src="lib/jquery/1.12.2/jquery.min.js"></script>
		<script src="lib/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script src="lib/bootstrap/ui-bootstrap-tpls-0.12.1.min.js" data-require="ui-bootstrap@*" data-semver="0.12.1" ></script>
		<script src="lib/bootstrap/ui-bootstrap-tpls-0.10.0.js"></script>
		<script src="lib/select2/4.0.2/js/select2.min.js"></script>

		<script src="js/AngularSrc.js"></script>
		<script src="js/Common.js"></script>

		<script type="text/javascript">


			function refreshPage(){
				window.location = ".";
			};


			function ChangeAdvSearch (){

				var AdvProvCount = $('.search-providers').val();
				var AdvServCount = $('.search-services').val();
				
				var AdvRadSearch = $("#RadialSearchBox").prop("checked");

				
				if(AdvProvCount != null || AdvServCount != null || AdvRadSearch) {

					$('#AdvToggle').addClass("btn-info");

				} else{
					$('#AdvToggle').removeClass("btn-info");
				}
			};
			
        </script>
	</head>
	<body ng-app="myModule" >
		<div class="container-fluid" ng-class="{'BodyDesktop' : desktop}" style="height:100%;width:100%; " ng-controller="myController" id="myCtrlDiv" name="myCtrlDiv"  >

			<cfinclude template="include/InfoModal.cfm">
			<cfinclude template="include/AdvancedModal.cfm">


			<div style="height:80px; position:relative; z-index:15; float:left;width:100%; min-width:345px;" id="TopSearchBar">
				<div style="background: url(img/nycskyline.jpg) no-repeat ; height:80px; ">
					<cfinclude template="include/SearchBar2.cfm">
				</div>
			</div>
			<div style="position:fixed;  bottom:0px; right:15px;  width:325px; z-index:20;" Id="IntroMsgRow"  >
					<cfinclude template="include/WelcomeAlert.cfm">
			</div>


			<div id="SearchBody" style="height:100%; width:100%;  padding-top:5px;  top:0px; padding-top:85px;"  >

				<div class="center-block" style="width:350px;  height:100%; vertical-align:top; " ng-class="{'DivSearchCards' : desktop}" >
					<cfinclude template="include/SearchCards.cfm">
				</div>
				<div style="height:100%; width:100%; z-index:0;  padding-left:355px; " ng-show="desktop" >
					<cfinclude template="include/SearchMap.cfm">
				</div>
			</div>
		</div>
	</body>
</html>
