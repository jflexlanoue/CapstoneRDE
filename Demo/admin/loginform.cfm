<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
		
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		
		
		<style type="text/css">
			body {height:100vh;}   td { padding-bottom:15px; padding-right:15px; }
		</style>
		<title>
			Resource Guide - Admin Panel
		</title>

		<script src="../lib/jquery/1.12.2/jquery.min.js"></script>
		<script src="../lib/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		
	</head>

	
	<body style="background-color:#DDDDDD ;  min-width:1000px" >
		<div class="container-fluid"  >
			<nav class="navbar navbar-inverse" >
				<div class="container-fluid" >
					<a >
						<div class="navbar-header">
							<span class="navbar-brand" style="cursor:pointer;" onclick="" >
								Resource Guide Admin Panel
							</span>
						</div>
					</a>

				</div>
			</nav>
			<div id="AdminPageGeneral" class="center-block" style="width:350px;">
				<div class="panel panel-default "  style="width:350px">
				
					<div class="panel-heading">
						<h4>Admin Login</h4>
					</div>
					
					<div class="panel-body" >
						<cfoutput>
							<form action="#CGI.script_name#?#CGI.query_string#" method="Post">

								<table>
									<tr>
										<td><label>Username:</label></td>
										<td><input class="form-control" type="text" name="j_username"></td>
									</tr>
									<tr>
										<td><label>Password:</label></td>
										<td><input class="form-control" type="password" name="j_password"></td>
									</tr>
								</table>
								
								<input class="btn btn-default pull-right" type="submit" value="Log In">
							</form>
						</cfoutput>
					</div>
				</div>
				
			</div>
		</div>
	</body>
</html>
