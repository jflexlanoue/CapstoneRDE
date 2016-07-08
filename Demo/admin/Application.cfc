

<cfcomponent>


	<cfset This.name = "Orders">
	<cfset This.Sessionmanagement="True">
	<cfset This.loginstorage="session">

	<cffunction name="OnRequestStart">
		<cfargument name = "request" required="true"/>
		<cfif IsDefined("Form.logout")>
			<cflogout>
		</cfif>
		<cflogin>
			<cfif NOT IsDefined("cflogin")>
				<cfinclude template="loginform.cfm">
				<cfabort>
			<cfelse>
				
				<cfset loginhash = Hash(cflogin.password & "kdh", "SHA") >
				<cfif cflogin.name Eq "admin" AND loginhash Eq "86ac557d4dafda96ae43dbdbf19a865c4e6fab40">
					<cfloginuser name="#cflogin.name#" Password = "#loginhash#" Roles="admin">
				<cfelse>
					<cfoutput>
						<cfinclude template="loginform.cfm">
						
						<div class="alert alert-danger center-block" style="width:350px;">
							
							Your login information is not valid.
							
						</div>
						
					</cfoutput>
					
					<cfabort>
				</cfif>
			</cfif>
		</cflogin>
	</cffunction>


</cfcomponent>
