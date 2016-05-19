


<cfset SearchTerm = "">

<cfif IsDefined("Form.SearchText")>
	<cfset SearchTerm = "#Form.SearchText#">

</cfif>

	<cfform name="SearchForm">
		<cfinput type = "Text" name = "SearchText"
	        message = "Please Enter a Search Term" value="#SearchTerm#" required = "Yes">
		<cfinput type = "submit" name = "submit" value = "Search">
	</cfform>


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

<cfoutput query = "SearchResult">

	<div>
		<h1>#name#</h1>
		<p>#address#</p>
		#hours# </br>
		#phone# </br>
		<a href="#website#">Website</a>

		<cfquery name = "LocServices" dataSource = "capstoneDB">
			Select *
			FROM Loc_Service as locserv, Service as serv
			WHERE locserv.Location_ID = <cfqueryPARAM value = "#ID#" CFSQLType = 'CF_SQL_BIGINT'>
				AND serv.ID =locserv.Service_ID
					ORDER BY serv.name
		</cfquery>
		<ul>
		<cfloop query = "LocServices">

			<li>#name#</li>
		</cfloop>
	</ul>
	</div>
</cfoutput>


