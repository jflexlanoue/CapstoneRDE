<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
		
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		
		
		<style type="text/css">
			body {height:100vh;} #map2 { height:300px; width:450px; } .search-results { list-style-type:none !important; } td { padding-bottom:15px; padding-right:15px; } input { }
		</style>
		<title>
			Resource Guide - Login
		</title>
		
		
		<script src="../lib/angularjs/1.4.8/angular.min.js"></script>
		<script src="../lib/jquery/1.12.2/jquery.min.js"></script>
		<script src="../lib/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>

	</head>
	<cfset PageReq = "">
	<cfif isDefined("url.p")>
		<cfset PageReq = url.p>
	</cfif>

	<body style="background-color:#DDDDDD ;  min-width:1000px" >
		<div class="container-fluid"  >
			<nav class="navbar navbar-inverse" >
				<div class="container-fluid" >
					<a href="?p=general">
						<div class="navbar-header">
							<span class="navbar-brand" style="cursor:pointer;" onclick="" >
								Resource Guide Admin Panel
							</span>
						</div>
					</a>
					<ul class="nav navbar-nav" >
						<li id="ProvidersTab" >
							<a href="?p=providers">
								Providers
							</a>
						</li>
						<li  id="ServicesTab">
							<a href="?p=services">
								Services
							</a>
						</li>
					</ul>
					<ul class="nav navbar-nav pull-right" >
						<li >
							<div style="padding-top: 5px;">
								<form action="" method="Post">
									<input class="form-control" type="submit" Name="Logout" value="Logout">
								</form>
							</div>
						</li>
					</ul>
				</div>
			</nav>
			<div id="AdminPageGeneral">
				<cfif PageReq Eq "providers" >
					<cfset ActiveTab = "ProvidersTab">
					<cfinclude template="include/editproviders.cfm">
				<cfelseif PageReq Eq "services">
					<cfset ActiveTab = "Services">
					<cfinclude template="include/editservices.cfm">
				<cfelseif PageReq Eq "general">
					<cfinclude template="include/editgeneral.cfm">
				<cfelse>
					<cfinclude template="include/editproviders.cfm">
				</cfif>
			</div>
		</div>
	</body>
</html>
