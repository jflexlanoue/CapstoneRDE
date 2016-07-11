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
		<script src="js/src.js"></script>
		<script type="text/javascript">


//Executes when the page First Loads
            $(document).ready(function () {

                var FirstTimeVisit = localStorage.getItem("firsttimevisit");

                if (FirstTimeVisit === null) {
                    $("#IntroductionMessage").collapse("show");
                }

                localStorage.setItem("firsttimevisit", "no");

//Load Provider Data for Advanced Search
                var providerData = [];

                $.when(getSearchProviders()).done(function () {
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
                        timeout: 3000,
                        success: function (results) {
                            for (var i = 0; i < results.ROWCOUNT; i++) {
                                providerData.push({
                                    id: results.DATA.ID[i],
                                    text: results.DATA.NAME[i]
                                });
                            }
                            dfr.resolve();
                        },
                        error: function (req, status, error) {
                            console.log("get Provider data failed!");

                        }
                    });
                    return dfr.promise();
                }
                ;

//Load Services Data for Advanced Search
                var serviceData = [];

                $.when(getSearchServices()).done(function () {
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
                        timeout: 3000,
                        success: function (results) {
                            for (var i = 0; i < results.ROWCOUNT; i++) {
                                serviceData.push({
                                    id: results.DATA.ID[i],
                                    text: results.DATA.NAME[i]
                                });
                            }
                            dfr.resolve();
                        },
                        error: function (req, status, error) {
                            console.log("get Service data failed!");
                        }
                    });
                    return dfr.promise();
                }
                ;


                $("#btnSearch").on("click", function () {

                    $("#advancedSearch").collapse("hide");


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

                    angular.element($('#myCtrlDiv')).scope().getFilteredData(searchterms, searchProviders.join(','), searchServices.join(','));
                });


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


        </script>
	</head>


	<body ng-app="myModule" onresize="FixLayout()">
		<div class="container-fluid" ng-class="{'BodyDesktop' : desktop}" style="height:100% ; " ng-controller="myController" id="myCtrlDiv" name="myCtrlDiv"  >

			<table style="height:100%; width:100%;"  >
				<tbody style="height:100%">
					<!---  	____________
						|||||||||||||
						|||||||||||||
						|	        |
						|	        |
						|	        |
						|	        |
						|	        |
						--->
					<tr style="height:80px;" id="TopSearchBar">
						<td colspan="2" style="background: url(img/nycskyline.jpg) no-repeat ; padding-bottom:10px; height:80px;">
							<cfinclude template="include/TopBar.cfm">
						</td>
					</tr>
					<tr style="height:0px;" Id="IntroMsgRow"  >
						<td colspan="2"   >
							<cfinclude template="include/WelcomeAlert.cfm">
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
		</div>
		</div>
	</body>
</html>
