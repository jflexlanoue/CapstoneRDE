<!-- >
Geocoding with Google Map API and ColdFusion
https://coldfusionexperts.wordpress.com/2013/11/11/geocoding-with-google-map-api-and-coldfusion/

Modified to accept full address string as Argument
<-->

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


	<cfquery name = "emptyGeos" datasource="capstoneDB">
		SELECT TOP 20 * FROM Location WHERE geo_lat = 0 OR geo_lng = 0;
	</cfquery>

	<cfoutput query = "emptyGeos">

		<cfset georesult = #findLatLong(#address#)# >
(#ID#):
			#address#
	   	 	GeoCode: #georesult.latitude#  , #georesult.longitude#
	</br>
	</br>
		<cfquery dataSource = "capstoneDB">
			UPDATE Location SET geo_lat = <cfqueryPARAM value = "#georesult.latitude#" CFSQLType = 'CF_SQL_FLOAT'>,
								geo_lng = <cfqueryPARAM value = "#georesult.longitude#" CFSQLType = 'CF_SQL_FLOAT'>
							WHERE ID = <cfqueryPARAM value = "#ID#" CFSQLType = 'CF_SQL_BIGINT'>;
		</cfquery>


	</cfoutput>


Locations GeoLocated
