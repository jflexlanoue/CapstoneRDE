<html>
	<head>
	</head>
	<body>


<div>

	<cftry>
			<cfinclude template="tables.cfm">

		<cfcatch type = "Database">

		<cfoutput>
			Error Setting up tables.</br></br>
			#CFCATCH.DETAIL#
		</cfoutput>
</cfcatch>
	</cftry>
</div>

</br>
<div>

	<cftry>

		<cfinclude template="providers.cfm">
	<cfcatch type = "Database">

		<cfoutput>
			Error Inserting Providers</br></br>
			#CFCATCH.DETAIL#
		</cfoutput>
	</cfcatch>
	</cftry>
</div>

</br>
<div>
	<cftry>

		<cfinclude template="services.cfm">
		<cfcatch type = "Database">
			<cfoutput>
				Error Inserting Services </br></br>
				#CFCATCH.DETAIL#
			</cfoutput>
		</cfcatch>
	</cftry>

</div>

</br>
<div>

	<cftry>

			<cfinclude template="locations.cfm">

		<cfcatch type = "Database">

		<cfoutput>
			Error inserting Locations.</br></br>
			#CFCATCH.DETAIL#
		</cfoutput>
</cfcatch>
	</cftry>
</div>
</br>
<div>

	<cftry>

		<cfinclude template="loc_serv.cfm">
	<cfcatch type = "Database">

		<cfoutput>
			Error Inserting Loc_Service</br></br>
			#CFCATCH.DETAIL#
		</cfoutput>
	</cfcatch>
	</cftry>
</div>




	</body>
</html>