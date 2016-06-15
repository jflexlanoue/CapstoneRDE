<cfheader name="Content-Type" value="application/json">


<cftry>
	<cfquery name = "ListProviders" dataSource = "CapstoneNJITSummer2016_data">
				Select id, name FROM  Provider
	</cfquery>

	<cfoutput>
		#SerializeJSON(ListProviders,true)#
	</cfoutput>

	<cfcatch>

	</cfcatch>
</cftry>