
<cfheader name="Content-Type" value="application/json">


<cftry>


	<cfquery name = "ListServices" dataSource = "capstoneDB">
				Select id, name FROM  Service as serv
	</cfquery>


	<cfoutput>
		#SerializeJSON(ListServices,true)#
	</cfoutput>

	<cfcatch>

	</cfcatch>
</cftry>