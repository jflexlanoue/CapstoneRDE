

<cffunction name="findLatLong"  output="false" returntype="struct">
	<cfargument name="address" type="string" required="true" >
	<cfset VARIABLES.urladdress="#address#">
	<cftry>
		<cfhttp result="geocode" url="http://maps.googleapis.com/maps/api/geocode/xml?address=#urladdress#&sensor=false" method="get">
			<cfhttpparam type="header" name="Content-Type" value="text/xml">
		</cfhttp>
		<cfset VARIABLES.gcode = "#xmlparse(geocode.filecontent)#">
		<cfif VARIABLES.gcode.geocoderesponse.status.xmltext EQ "OK">
			<cfset VARIABLES.newlat = "#VARIABLES.gcode.geocoderesponse.result.geometry.location.lat.xmltext#">
			<cfset VARIABLES.newlon = "#VARIABLES.gcode.geocoderesponse.result.geometry.location.lng.xmltext#">
			<cfset VARIABLES.gcodefail = 0>
		<cfelse>
			<cfset VARIABLES.newlat = "0">
			<cfset VARIABLES.newlon = "0">
			<cfset VARIABLES.gcodefail = 1>
		</cfif>
		<cfcatch>
			<cfdump var="#cfcatch#">
			<cfset VARIABLES.newlat = "0">
			<cfset VARIABLES.newlon = "0">
			<cfset VARIABLES.gcodefail = 1>
		</cfcatch>
	</cftry>
	<cfset VARIABLES.locationstruct=structNew()>
	<cfset VARIABLES.locationstruct.latitude=newlat>
	<cfset VARIABLES.locationstruct.longitude=newlon>
	<cfset VARIABLES.locationstruct.gcodefail=gcodefail>
	<cfreturn VARIABLES.locationstruct>
</cffunction>

<cfif NOT isDefined("form.address")>
	<cfthrow message="POST argument missing address">
</cfif>

<cfset georesult = #findLatLong(#form.address#)# >

<cfoutput>
	|Success|#georesult.latitude#|#georesult.longitude#|
</cfoutput>
