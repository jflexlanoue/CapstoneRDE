<cfsetting showDebugOutput="No">
<cfif NOT isDefined("url.req")>
	<cfthrow message="req GET Data Not Found">
</cfif>


<cfset Req = url.req >







<cfif Req EQ "getallproviders">
	<cfinvoke component="dbQueries" method="GetAllProviders" returnvariable="Allproviders">
	</cfinvoke>

	<cfoutput>
		#SerializeJSON(Allproviders,true)#
	</cfoutput>

<cfelseif Req EQ "getprovider">


	<cfif NOT isDefined("form.provid")>
		<cfthrow message="POST Data provid Not Found">
	</cfif>


	<cfset NewProviderID = form.provid >
	<cfinvoke component="dbQueries" method="GetProvider" returnvariable="Provider">
		<cfinvokeargument name="ProviderId" value="#NewProviderID#">
	</cfinvoke>


	<cfoutput>
		#SerializeJSON(Provider,true)#
	</cfoutput>

<cfelseif Req EQ "getlocation" >

	<cfif NOT isDefined("form.locid")>
		<cfthrow message="POST Data locid Not Found">
	</cfif>
	<cfset NewLocationID = form.locid >


	<cfinvoke component="dbQueries" method="GetLocation" returnvariable="Location">
		<cfinvokeargument name="LocationId" value="#NewLocationID#">
	</cfinvoke>


	<cfoutput>
		#SerializeJSON(Location,true)#
	</cfoutput>


<cfelseif Req EQ "savelocation">

		<cfif (NOT isDefined("form.id")) OR (NOT isDefined("form.addr") ) OR (NOT isDefined("form.phone") ) OR (NOT isDefined("form.geolat") ) OR (NOT isDefined("form.geolng") ) OR (NOT isDefined("form.hours") )  >
			<cfthrow message="POST Data missing">
		</cfif>

		<cfset ID =form.id >
		<cfset Address = form.addr>
		<cfset Phone =form.phone>
		<cfset GeoLat =form.geolat>
		<cfset GeoLng =form.geolng>
		<cfset Hours =form.hours>

		<cfif ID Eq -1>
			<cfset ProviderId = form.provid>

			<cfinvoke component="dbQueries" method="CreateLocation" >
				<cfinvokeargument name="ProviderID" value="#ProviderId#">
				<cfinvokeargument name="Address" value="#Address#">
				<cfinvokeargument name="Phone" value="#Phone#">
				<cfinvokeargument name="GeoLat" value="#GeoLat#">
				<cfinvokeargument name="GeoLng" value="#GeoLng#">
				<cfinvokeargument name="Hours" value="#Hours#">
			</cfinvoke>
		<cfelse>

			<cfinvoke component="dbQueries" method="SaveLocation" >
				<cfinvokeargument name="LocationID" value="#ID#">
				<cfinvokeargument name="Address" value="#Address#">
				<cfinvokeargument name="Phone" value="#Phone#">
				<cfinvokeargument name="GeoLat" value="#GeoLat#">
				<cfinvokeargument name="GeoLng" value="#GeoLng#">
				<cfinvokeargument name="Hours" value="#Hours#">
			</cfinvoke>

		</cfif>



	<cfoutput>Success</cfoutput>

<cfelseif Req EQ "saveprovider">

	<cfif NOT isDefined("form.id")>
		<cfthrow>
	</cfif>

	<cfset ProvID = form.id >
	<cfset ProvName = form.name>
	<cfset ProvWebsite = form.website>
	<cfset ProvDesc = form.desc >

	<cfif ProvID Eq -1>

		<cfinvoke component="dbQueries" method="CreateProvider" >
			<cfinvokeargument name="Name" value="#ProvName#">
			<cfinvokeargument name="Website" value="#ProvWebsite#">
			<cfinvokeargument name="Description" value="#ProvDesc#">
		</cfinvoke>

	<cfelse>
		<cfinvoke component="dbQueries" method="SaveProvider" returnvariable="SaveProvider">
			<cfinvokeargument name="ProviderId" value="#ProvID#">
			<cfinvokeargument name="Name" value="#ProvName#">
			<cfinvokeargument name="Website" value="#ProvWebsite#">
			<cfinvokeargument name="Description" value="#ProvDesc#">
		</cfinvoke>
		<cfoutput>Success</cfoutput>

	</cfif>



<cfelseif Req EQ "getallservices">

	<cfinvoke component="dbQueries" method="GetAllServices" returnvariable="AllServices"></cfinvoke>

	<cfoutput>
		#SerializeJSON(AllServices,true)#
	</cfoutput>

<cfelseif Req EQ "saveservice">

		<cfif NOT isDefined("form.id")>
			<cfthrow>
		</cfif>

		<cfset ServID =form.id >
		<cfset ServName =form.name>


	<cfinvoke component="dbQueries" method="SaveService">
		<cfinvokeargument name="ServiceId" value="#ServID#">
		<cfinvokeargument name="Name" value="#ServName#">
	</cfinvoke>

<cfelseif Req EQ "deletelocation">

		<cfif NOT isDefined("form.id")>
			<cfthrow>
		</cfif>

		<cfset LocId =form.id >

	<cfinvoke component="dbQueries" method="DeleteLocation">
		<cfinvokeargument name="LocationId" value="#LocId#">

	</cfinvoke>


<cfelseif Req EQ "deleteprovider">

		<cfif NOT isDefined("form.id")>
			<cfthrow>
		</cfif>

		<cfset ProvId =form.id >

	<cfinvoke component="dbQueries" method="DeleteProvider">
		<cfinvokeargument name="ProviderId" value="#ProvId#">
	</cfinvoke>


<cfelse>

	<cfthrow message="Invalid req GET Data">

</cfif>
