<html>
	<head>
	</head>
	<body>
		<a href="search.cfm">Search Test</a>
	</br>
	</br>


	<cfquery name = "ViewResult" dataSource = "capstoneDB">
	    SELECT COUNT( DISTINCT loc.id) AS LocationCount, COUNT( DISTINCT locser.Service_ID) AS ServiceCount, prov.ID, prov.name
	    FROM Provider AS prov , Location AS loc, Loc_Service as locser
	    WHERE 	loc.Provider_ID = prov.ID AND locser.Location_ID = loc.ID
		GROUP BY prov.ID ,  prov.name
	</cfquery>



<table width="1000px">
	<tr>
		<td>ID</td>
		<td>Name</td>
		<td># Locations</td>
		<td># Services</td>
	</tr>


<cfoutput query = "ViewResult">
	<tr>
	<td>#ID#</td>
	<td>#name#</td>
	<td>#LocationCount#</td>
	<td>#ServiceCount#</td>
	</tr>
</cfoutput>

</table>


	</body>
</html>