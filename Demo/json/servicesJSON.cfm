

<cfheader name="Content-Type" value="application/json">

<CFIF NOT IsDefined("url.locid")>
	<cfexit>
</CFIF>


<cfset locID = url.locid>

<cftry>


<cfquery name = "LocServices" dataSource = "CapstoneNJITSummer2016_data">
			Select serv.name
			FROM Loc_Service as locserv, Service as serv
			WHERE locserv.Location_ID = <cfqueryPARAM value = "#locID#" CFSQLType = 'CF_SQL_BIGINT'>
				AND serv.ID =locserv.Service_ID
					ORDER BY serv.name
</cfquery>

<cfoutput>
	#SerializeJSON(LocServices,true)#
</cfoutput>

	<cfcatch>

	</cfcatch>
</cftry>