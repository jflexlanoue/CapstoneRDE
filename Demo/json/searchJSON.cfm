
<cfheader name="Content-Type" value="application/json">
<cfsetting showDebugOutput="No">


<CFIF (NOT IsDefined("form.terms")) OR (NOT IsDefined("form.providers")) OR (NOT IsDefined("form.services"))>
	<cfexit>
</CFIF>

	<cfset SearchTerm = form.terms>
	<cfset SearchProviders = form.providers>
	<cfset SearchServices = form.services>


<cfquery name = "SearchResult" dataSource = "capstoneDB">
	    SELECT  COUNT(serv.ID) as servicesMatch, prov.name, prov.website,
						loc.*,
						(STUFF((SELECT CAST('| ' + [name] AS VARCHAR(MAX))
         							FROM Service, Loc_Service
         							WHERE 	Service.id = Loc_Service.Service_ID
										AND Loc_Service.Location_ID = loc.ID
         							FOR XML PATH ('')), 1, 2, '')) AS services

	    FROM Location AS loc, Provider AS prov, Service as serv, Loc_Service as servloc
	    WHERE prov.ID = loc.Provider_ID
			AND loc.ID = servloc.Location_ID
			AND serv.ID = servloc.Service_ID

			<cfloop index = "SearchToken" list = #SearchTerm# delimiters = " ">
				AND (	loc.address like <cfqueryPARAM value = "%#SearchToken#%" CFSQLType = 'CF_SQL_VARCHAR'>
						OR
						serv.name like <cfqueryPARAM value = "%#SearchToken#%" CFSQLType = 'CF_SQL_VARCHAR'>
						OR
						prov.name like <cfqueryPARAM value = "%#SearchToken#%" CFSQLType = 'CF_SQL_VARCHAR'>
					)
			</cfloop>

			<cfif len((trim(SearchProviders)))>

				AND prov.ID IN ( <cfqueryPARAM value = '#SearchProviders#' CFSQLType = 'CF_SQL_BIGINT' LIST='true' >)
			</cfif>

			<cfif len((trim(SearchServices)))>
				AND serv.ID IN ( <cfqueryPARAM value = '#SearchServices#' CFSQLType = 'CF_SQL_BIGINT' LIST='true' >)
			</cfif>
		Group BY prov.name, prov.website, loc.id, loc.provider_id, loc.address, loc.hours, loc.phone, loc.geo_lat, loc.geo_lng
		ORDER BY COUNT(serv.ID) desc
	</cfquery>
	<cfoutput>
		#SerializeJSON(SearchResult,true)#
	</cfoutput>

