


<cfset SearchTerm = "nj">




<cfquery name = "SearchResult" dataSource = "capstoneDB">
    SELECT DISTINCT prov.name, prov.website,
					loc.*
    FROM Location AS loc, Provider AS prov, Service as serv, Loc_Service as servloc
    WHERE prov.ID = loc.Provider_ID
		AND loc.ID = servloc.Location_ID
		AND serv.ID = servloc.Service_ID
		AND (	loc.address like <cfqueryPARAM value = "%#SearchTerm#%" CFSQLType = 'CF_SQL_VARCHAR'>
				OR
				serv.name like <cfqueryPARAM value = "%#SearchTerm#%" CFSQLType = 'CF_SQL_VARCHAR'>
				OR
				prov.name like <cfqueryPARAM value = "%#SearchTerm#%" CFSQLType = 'CF_SQL_VARCHAR'>
			)
	ORDER BY prov.name
</cfquery>

<cfoutput>
	#SearchResult.RecordCount# Results
</cfoutput>


<cfdump var = "#SearchResult#">

</cfdump>



		<cfquery name = "LocServices" dataSource = "capstoneDB">
			Select *
			FROM Loc_Service as locserv, Service as serv
			WHERE locserv.Location_ID = <cfqueryPARAM value = "5" CFSQLType = 'CF_SQL_BIGINT'>
				AND serv.ID =locserv.Service_ID
					ORDER BY serv.name
		</cfquery>


<h1>Each Location also gets a query that return the set of Services</h1>



<cfdump var = "#LocServices#">

</cfdump>


<h1>JSON For the First Query</h1>

<cfoutput>
	#SerializeJSON(SearchResult,true)#
</cfoutput>



<h1>JSON For the Second Query</h1>
<cfoutput>
	#SerializeJSON(LocServices,true)#
</cfoutput>





