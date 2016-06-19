<cfcomponent displayname="dbQueries" hint="db access for Admins">

	<cfset Settings.DataSource = "CapstoneNJITSummer2016_data" >

	<cffunction name="GetAllProviders" hint="Gets all customer from the database" returntype="query" output="no">
		<cfquery name="QueryAllProviders" datasource = "#Settings.DataSource#" >


				SELECT prov.id, prov.name, (SELECT COUNT(loc.ID) FROM location as loc WHERE loc.Provider_ID = prov.ID ) as locationcount FROM provider as prov

				ORDER BY prov.name asc
				<!---		OFFSET  50 ROWS
							FETCH NEXT 5 ROWS ONLY--->
		</cfquery>
		<cfreturn QueryAllProviders>
	</cffunction>


	<cffunction name="GetAllServices" hint="Gets all services from the database" returntype="query">
		<cfquery name="GetAllServices" datasource = "#Settings.DataSource#" >

				SELECT serv.id, serv.name, COUNT(servloc.Location_ID) as locationcount FROM service as serv , Loc_Service as servloc
					WHERE servloc.Service_ID = serv.ID
				GROUP BY serv.id , serv.name

		</cfquery>
		<cfreturn GetAllServices>
	</cffunction>


	<cffunction name="GetProvider" hint="Gets provider from the database" returntype="query">
		<cfargument name="ProviderId" type="int" required="yes">
		<cfquery name="SelectProvider" datasource = "#Settings.DataSource#" >
				SELECT TOP 1 * FROM provider as prov
				WHERE ID = <cfqueryPARAM value = "#ProviderId#" CFSQLType = 'CF_SQL_BIGINT'>

		</cfquery>
		<cfquery name="SelectLocations" datasource = "#Settings.DataSource#" >
				SELECT ID, Address FROM Location as loc
				WHERE Provider_ID = <cfqueryPARAM value = "#ProviderId#" CFSQLType = 'CF_SQL_BIGINT'>

		</cfquery>
		<cfset LocationsID = ArrayNew(1)>
		<cfset LocationsID[1] = ValueList(SelectLocations.ID,"|")>
		<cfset LocationsAddress = ArrayNew(1)>
		<cfset LocationsAddress[1] = ValueList(SelectLocations.Address,"|")>
		<cfset QueryAddColumn(SelectProvider, "LocationsID", "VarChar", LocationsID)>
		<cfset QueryAddColumn(SelectProvider, "LocationsAddress", "VarChar", LocationsAddress)>
		<cfreturn SelectProvider>
	</cffunction>


	<cffunction name="GetLocation" hint="Gets location from the database" returntype="query">
		<cfargument name="LocationId" type="int" required="yes">
		<cfquery name="SelectLocation" datasource = "#Settings.DataSource#" >
				SELECT TOP 1 * FROM Location as loc
				WHERE loc.ID = <cfqueryPARAM value = "#LocationId#" CFSQLType = 'CF_SQL_BIGINT'>

		</cfquery>
		<cfquery name="LocationServices" datasource = "#Settings.DataSource#">
            SELECT serv.ID, serv.name FROM Location as loc, Service as serv, Loc_Service as servloc
            WHERE loc.ID = <cfqueryPARAM value = "#LocationId#" CFSQLType = 'CF_SQL_BIGINT'>
				  AND servloc.Location_ID = loc.ID
				  AND servloc.Service_ID = serv.ID
		</cfquery>
		<cfset ServicesID = ArrayNew(1)>
		<cfset ServicesID[1] = ValueList(LocationServices.ID,"|")>
		<cfset ServicesName = ArrayNew(1)>
		<cfset ServicesName[1] = ValueList(LocationServices.Name,"|")>
		<cfset QueryAddColumn(SelectLocation, "ServicesID", "VarChar", ServicesId)>
		<cfset QueryAddColumn(SelectLocation, "ServicesName", "VarChar", ServicesName)>
		<cfreturn SelectLocation>
	</cffunction>


	<cffunction name="SaveLocation" hint="Saves existing location to the database" >
		<cfargument name="LocationId" type="int" required="yes">
		<cfargument name="Address" type="string" required="yes">
		<cfargument name="Phone" type="string" required="yes">
		<cfargument name="GeoLat" type="string" required="yes">
		<cfargument name="GeoLng" type="float" required="yes">
		<cfargument name="Hours" type="string" required="yes">
		<cfquery name = "UpdateLocation" dataSource = "#Settings.DataSource#" >
				UPDATE location
					SET address = <cfqueryPARAM value = '#Address#' CFSQLType = 'CF_SQL_VARCHAR' >,
						phone = <cfqueryPARAM value = '#Phone#' CFSQLType = 'CF_SQL_VARCHAR' >,
						hours = <cfqueryPARAM value = '#Hours#' CFSQLType = 'CF_SQL_VARCHAR' >,
						geo_lat = <cfqueryPARAM value = "#GeoLat#" CFSQLType = 'CF_SQL_FLOAT'>,
						geo_lng = <cfqueryPARAM value = "#GeoLng#" CFSQLType = 'CF_SQL_FLOAT'>
					WHERE ID = <cfqueryPARAM value = '#LocationId#' CFSQLType = 'CF_SQL_BIGINT' >
		</cfquery>
	</cffunction>


	<cffunction name="SaveProvider" hint="Saves existing provider to the database" >
		<cfargument name="ProviderId" type="int" required="yes">
		<cfargument name="Name" type="string" required="yes">
		<cfargument name="Website" type="string" required="yes">
		<cfargument name="Description" type="string" required="yes">
		<cfquery name = "UpdateProvider" dataSource = "#Settings.DataSource#">

				UPDATE provider
					SET name = <cfqueryPARAM value = '#Name#' CFSQLType = 'CF_SQL_VARCHAR' >,
						website = <cfqueryPARAM value = '#Website#' CFSQLType = 'CF_SQL_VARCHAR' >,
						description = <cfqueryPARAM value = '#Description#' CFSQLType = 'CF_SQL_VARCHAR' >
					WHERE ID = <cfqueryPARAM value = '#ProviderId#' CFSQLType = 'CF_SQL_BIGINT' >
		</cfquery>
	</cffunction>


	<cffunction name="SaveService" hint="Saves existing service to the database" >
		<cfargument name="ServiceId" type="int" required="yes">
		<cfargument name="Name" type="string" required="yes">
		<cfquery name = "UpdateService" dataSource = "#Settings.DataSource#">

					UPDATE Service
					SET name = <cfqueryPARAM value = '#Name#' CFSQLType = 'CF_SQL_VARCHAR' >

					WHERE ID = <cfqueryPARAM value = '#ServiceId#' CFSQLType = 'CF_SQL_BIGINT' >
			</cfquery>
	</cffunction>


	<cffunction name="CreateLocation" hint="Create new location " >
		<cfargument name="ProviderId" type="string" required="yes">
		<cfargument name="Address" type="string" required="yes">
		<cfargument name="Phone" type="string" required="yes">
		<cfargument name="GeoLat" type="string" required="yes">
		<cfargument name="GeoLng" type="float" required="yes">
		<cfargument name="Hours" type="string" required="yes">
		<cfquery name = "CreateLocationQuery" dataSource = "#Settings.DataSource#" >

				INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES
				( 	<cfqueryPARAM value = '#ProviderId#' CFSQLType = 'CF_SQL_BIGINT' >,
					<cfqueryPARAM value = '#Address#' CFSQLType = 'CF_SQL_VARCHAR' >,
					<cfqueryPARAM value = '#Hours#' CFSQLType = 'CF_SQL_VARCHAR' >,
					<cfqueryPARAM value = '#Phone#' CFSQLType = 'CF_SQL_VARCHAR' > ,
					<cfqueryPARAM value = "#GeoLat#" CFSQLType = 'CF_SQL_FLOAT'>,
					<cfqueryPARAM value = "#GeoLng#" CFSQLType = 'CF_SQL_FLOAT'>
				);
		</cfquery>
	</cffunction>

	<cffunction name="DeleteLocation" hint="Delete location from the database" >
		<cfargument name="LocationId" type="int" required="yes">
		<cfquery dataSource = "#Settings.DataSource#" >
				DELETE FROM Location WHERE id= <cfqueryPARAM value = '#LocationId#' CFSQLType = 'CF_SQL_BIGINT' >;
				DELETE FROM Loc_Service WHERE Location_ID = <cfqueryPARAM value = '#LocationId#' CFSQLType = 'CF_SQL_BIGINT' >;
			</cfquery>
	</cffunction>

	<cffunction name="CreateProvider" hint="Create new provider " >
		<cfargument name="Name" type="string" required="yes">
		<cfargument name="Website" type="string" required="yes">
		<cfargument name="Description" type="string" required="yes">
		<cfquery name = "CreateProviderQuery" dataSource = "#Settings.DataSource#" >

				INSERT INTO Provider (name, website, description) VALUES
					(	<cfqueryPARAM value = '#Name#' CFSQLType = 'CF_SQL_VARCHAR' > ,
						<cfqueryPARAM value = '#Website#' CFSQLType = 'CF_SQL_VARCHAR' >,
						<cfqueryPARAM value = '#Description#' CFSQLType = 'CF_SQL_VARCHAR' >
					);

		</cfquery>
	</cffunction>


	<cffunction name="DeleteProvider" hint="Delete provider from the database" >
		<cfargument name="ProviderId" type="int" required="yes">
		<cfquery dataSource = "#Settings.DataSource#" >

				DELETE FROM Provider WHERE id= <cfqueryPARAM value = '#ProviderId#' CFSQLType = 'CF_SQL_BIGINT' >;
				DELETE FROM Loc_service WHERE Location_ID IN
						(SELECT ID FROM Location Where Provider_ID = <cfqueryPARAM value = '#ProviderId#' CFSQLType = 'CF_SQL_BIGINT' >);

				DELETE FROM Location WHERE Provider_ID = <cfqueryPARAM value = '#ProviderId#' CFSQLType = 'CF_SQL_BIGINT' >;

		</cfquery>
	</cffunction>



</cfcomponent>
