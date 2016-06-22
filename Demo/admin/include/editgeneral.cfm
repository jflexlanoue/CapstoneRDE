<cfset Settings.DataSource = "CapstoneNJITSummer2016_data" >
<cfquery name="QueryProviderCount" datasource = "#Settings.DataSource#" >
				SELECT COUNT(Id) as provcount FROM provider
</cfquery>
<cfquery name="QueryLocationCount" datasource = "#Settings.DataSource#" >
				SELECT COUNT(Id) as loccount FROM location
</cfquery>
<cfquery name="QueryServiceCount" datasource = "#Settings.DataSource#" >
				SELECT COUNT(Id) as servcount FROM service
</cfquery>



<cfquery name="QueryProvidersNoLocation" datasource = "#Settings.DataSource#" >
			SELECT COUNT(prov.Id) as provcount FROM provider as prov
			WHERE prov.Id NOT IN (SELECT provider_ID FROM Location)
</cfquery>

<cfquery name="QueryServicesNoLocation" datasource = "#Settings.DataSource#" >
			SELECT COUNT(serv.Id) as servcount FROM service as serv
			WHERE serv.Id NOT IN (SELECT service_ID FROM Loc_Service)
</cfquery>

<cfquery name="QueryLocationsNoServices" datasource = "#Settings.DataSource#" >
			SELECT COUNT(loc.Id) as loccount FROM location as loc
			WHERE loc.Id NOT IN (SELECT Location_ID FROM Loc_Service)
</cfquery>


<cfquery name="QueryServLocOrphan" datasource = "#Settings.DataSource#" >
			SELECT COUNT(*) as locservcount FROM Loc_Service as locserv
			WHERE locserv.Location_ID NOT IN (SELECT ID FROM Location)
				OR locserv.Service_ID NOt IN (SELECT ID FROM Service)
</cfquery>



<cfquery name="QueryProvidersMostLocation" datasource = "#Settings.DataSource#" >
			SELECT top 10 prov.Id, prov.Name, COUNT(loc.ID) as loccount FROM provider as prov, location as loc
			WHERE loc.Provider_ID = prov.ID
			Group BY prov.ID, Prov.Name
			ORDER BY COUNT(loc.ID) DESC
</cfquery>
<cfquery name="QueryServicesMostLocation" datasource = "#Settings.DataSource#" >
			SELECT top 10 serv.Id, serv.Name, COUNT(locserv.Location_ID) as loccount FROM service as serv, Loc_Service as locserv
			WHERE locserv.Service_ID = serv.ID
			Group BY serv.ID, serv.Name
			ORDER BY COUNT(locserv.Location_ID) DESC
</cfquery>

<cfquery name="QueryLocationsMostServices" datasource = "#Settings.DataSource#" >
			SELECT top 10 loc.Provider_ID, loc.Address, COUNT(locserv.Service_ID) as servcount FROM location as loc, Loc_Service as locserv
			WHERE locserv.Location_ID = loc.ID
			Group BY loc.ID, loc.Address, loc.Provider_ID
			ORDER BY COUNT(locserv.Service_ID) DESC
</cfquery>


<table id="GeneralTable"  style="width:100%;height:90%">
	<tr>
		<td style="width:200px;"></td>
		<td style="width:200px;"></td>
		<td style="width:200px;"></td>
		<td style="width:200px;"></td>
		<td style="width:200px;"></td>
		<td style="width:200px;"></td>
	</tr>
	<tr style="vertical-align:top">
		<td>
			<div class="panel panel-default" style="height:100%; width:200px;" >
				<div class="panel-heading" >
					Stats
				</div>
				<div class="panel-body">
					<div class="list-group" >
						<div class="list-group-item" >
							Providers:
							<cfoutput>
								#QueryProviderCount.provcount#
							</cfoutput>
						</div>
						<div class="list-group-item" >
							Locations:
							<cfoutput>
								#QueryLocationCount.loccount#
							</cfoutput>
						</div>
						<div class="list-group-item" >
							Services:
							<cfoutput>
								#QueryServiceCount.servcount#
							</cfoutput>
						</div>
					</div>
				</div>
			</div>
		</td>
		<td>
			<div class="panel panel-default" style="height:100%; width:200px;" >
				<div class="panel-heading" >
					Orphans
				</div>
				<div class="panel-body">
					<div class="list-group" >
						<div class="list-group-item" >
							Providers without Location:
							<cfoutput>
								#QueryProvidersNoLocation.provcount#
							</cfoutput>
						</div>
						<div class="list-group-item" >
							Locations without Service:
							<cfoutput>
								#QueryLocationsNoServices.loccount#
							</cfoutput>
						</div>
						<div class="list-group-item" >
							Services without Location:
							<cfoutput>
								#QueryServicesNoLocation.servcount#
							</cfoutput>
						</div>

						<div class="list-group-item" >
							Location_serv Orphans:
							<cfoutput>
								#QueryServLocOrphan.locservcount#
							</cfoutput>
						</div>
					</div>
				</div>
			</div>
		</td>
	</tr>
	<tr style="vertical-align:top;">
		<td style="width:200px;">
			<div class="panel panel-default" style="height:100%; width:200px;" >
				<div class="panel-heading" >
					Providers with most Locations
				</div>
				<div class="panel-body">
					<div class="list-group" >
						<cfoutput query="QueryProvidersMostLocation">
							<div class="list-group-item" >
								<a href="./?p=providers&provid=#ID#">
									#Name# (#loccount#)
								</a>
							</div>
						</cfoutput>
					</div>
				</div>
			</div>
		</td>
		<td>
			<div class="panel panel-default" style="height:100%; width:200px;" >
				<div class="panel-heading" >
					Services with most Locations
				</div>
				<div class="panel-body">
					<div class="list-group" >
						<cfoutput query="QueryServicesMostLocation">
							<div class="list-group-item" >
									#Name# (#loccount#)
							</div>
						</cfoutput>
					</div>
				</div>
			</div>
		</td>

				<td>
			<div class="panel panel-default" style="height:100%; width:200px;" >
				<div class="panel-heading" >
					Locations with Most Services
				</div>
				<div class="panel-body">
					<div class="list-group" >
						<cfoutput query="QueryLocationsMostServices">
							<div class="list-group-item" >
								<a href="./?p=providers&provid=#Provider_ID#">#Address# (#servcount#)</a>
							</div>
						</cfoutput>
					</div>
				</div>
			</div>
		</td>
	</tr>
</table>
