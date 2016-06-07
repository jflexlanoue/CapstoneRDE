
<cfheader name="Content-Type" value="application/json">
<cfsetting showDebugOutput="No">


<CFIF (NOT IsDefined("form.terms")) OR (NOT IsDefined("form.providers")) OR (NOT IsDefined("form.services"))>
	<cfexit>
</CFIF>

	<cfset SearchTerm = form.terms>
	<cfset SearchProviders = form.providers>
	<cfset SearchServices = form.services>


	<cfquery name = "SearchResult" dataSource = "capstoneDB">
	    SELECT DISTINCT prov.name, prov.website,
						loc.*
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
		ORDER BY prov.name
	</cfquery>


	<cfset Services = ArrayNew(1)>
	<cfset ServicesMatch = ArrayNew(1)>


	<cfoutput query = "SearchResult">

			<cfquery name = "LocServices" dataSource = "capstoneDB">
				Select name
				FROM Loc_Service as locserv, Service as serv
				WHERE locserv.Location_ID = <cfqueryPARAM value = "#ID#" CFSQLType = 'CF_SQL_BIGINT'>
					AND serv.ID =locserv.Service_ID
						ORDER BY serv.name
			</cfquery>

			<cfset LocationServices = ArrayNew(1)>

			<cfset Match = 0>

			<cfloop query = "LocServices">


					<cfif (Find(LCase(SearchTerm), LCase(#name#)) gt 0)>
						<cfset Match = Match+1>
					</cfif>


				<cfset ArrayAppend(LocationServices, #name#)>

			</cfloop>




			<cfset listformat = ArrayToList(LocationServices, "|")>

			<cfset ArrayAppend(Services, listformat)>

			<cfset ArrayAppend(ServicesMatch, Match)>

	</cfoutput>

	<cfset QueryAddColumn(SearchResult, "services", "VarChar", Services)>

	<cfset QueryAddColumn(SearchResult, "servicesMatch", "BIGINT", ServicesMatch)>

	<cfoutput>
		#SerializeJSON(SearchResult,true)#
	</cfoutput>

