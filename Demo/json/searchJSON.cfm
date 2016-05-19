<cfheader name="Content-Type" value="application/json">

<CFIF NOT IsDefined("url.term")>
	<cfexit>
</CFIF>


<cftry>
	<cfset SearchTerm = url.term>



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
		#SerializeJSON(SearchResult,true)#
	</cfoutput>

<cfcatch>

	</cfcatch>
</cftry>
