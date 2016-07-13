<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		<link href="lib/select2/4.0.2/css/select2.min.css" rel="stylesheet" />


		<link rel="stylesheet" type="text/css" href="css/main.css">


		<title>
			HIV Resource Guide
		</title>
		<script src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
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


//Executes when the page First Loads
            $(document).ready(function () {

				$(".collapse").on('shown.bs.collapse', function(){
			        FixLayout();
			    });

				$(".collapse").on('hidden.bs.collapse', function(){
			        FixLayout();
			    });

			    $(".collapse").on('hide.bs.collapse', function(){
			        $("#srDiv").height("100%");
					$("#SearchMap").height("100%");
			    });

				FixLayout();

            });


			function refreshPage(){
				window.location = ".";
			};

			function FixLayout(){
				console.log("Fixed Layout");
				var WindowH = window.innerHeight;

				var TopBannerH = $("#TopSearchBar").height();
				var IntroMessageH = $("#IntroMsgRow").height();

				var NewH = WindowH;
				NewH -= TopBannerH ;
				NewH -= 6;
				NewH -= IntroMessageH;

				$("#srDiv").height(NewH);
				$("#SearchMap").height(NewH);
			};

			function ChangeAdvSearch (){

				var AdvProvCount = $('.search-providers').val();

				var AdvServCount = $('.search-services').val();

				if(AdvProvCount != null || AdvServCount != null) {

					$('#AdvToggle').addClass("btn-info");

				} else{
					$('#AdvToggle').removeClass("btn-info");

				}
			};

        </script>
	</head>


	<body ng-app="myModule" onresize="FixLayout()">
		<div class="container-fluid" ng-class="{'BodyDesktop' : desktop}" style="height:100% ; " ng-controller="myController" id="myCtrlDiv" name="myCtrlDiv"  >

			<table style="height:100%; width:100%;"  >
				<tbody style="height:100%">

					<tr style="height:80px;" id="TopSearchBar">
						<td colspan="2" style="background: url(img/nycskyline.jpg) no-repeat ; padding-bottom:10px; height:80px;">
							<cfinclude template="include/SearchBar.cfm">
							<cfinclude template="include/AdvancedBar.cfm">
						</td>
					</tr>
					<tr style="height:0px;" Id="IntroMsgRow"  >
						<td colspan="2"   >

						</td>
					</tr>
					<tr id="SearchBody" >
						<td style="width:350px; padding-top:5px; padding-right:5px; height:100%; vertical-align:top;" >
							<!---  Full Screen Modal View  --->
							<cfinclude template="include/InfoModal.cfm">
							<cfinclude template="include/SearchCards.cfm">
						</td>
						<td style="height:80%; padding-top:5px; vertical-align:top;" ng-show="desktop" >
							<cfinclude template="include/SearchMap.cfm">
						</td>
					</tr>
				</tbody>
			</table>

			<div  style="position:fixed;  bottom:0px; right:20px;  width:345px; z-index:20;" Id="IntroMsgRow"  >
					<cfinclude template="include/WelcomeAlert.cfm">
			</div>
		</div>
	</body>
</html>
