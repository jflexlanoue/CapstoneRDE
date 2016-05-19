<cfheader name="Content-Type" value="application/json">


<cftry>
	<cfquery name = "ListProviders" dataSource = "capstoneDB">
				Select id, name FROM  Provider
	</cfquery>

	<cfoutput>
		#SerializeJSON(ListProviders,true)#
	</cfoutput>

	<cfcatch>

	</cfcatch>
</cftry>