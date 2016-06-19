<script src="js/editproviders.js"></script>

<table id="ProviderTable"  style="width:100%;height:90%"  ng-app="AdminPanel">
	<tr ng-controller="ProviderListController" style="">
		<td style="vertical-align:top; width:300px;">
			<!---
				Confirmation Messages
				--->
			<div id="DeleteLocation" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								&times;
							</button>
							<h4 class="modal-title">
								Delete Location
							</h4>
						</div>
						<div class="modal-body">
							Are you sure you want to delete this location: {{sLocation.Address}}
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" ng-click="DeleteLocation()">
								Yes
							</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">
								No
							</button>
						</div>
					</div>
				</div>
			</div>
			<div id="DeleteProvider" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								&times;
							</button>
							<h4 class="modal-title">
								Delete Provider
							</h4>
						</div>
						<div class="modal-body">
							Are you sure you want to delete this Provider: {{sProvider.Name}} </br> And its {{sProvider.Locations.length}} locations
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" ng-click="DeleteProvider()">
								Yes
							</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">
								No
							</button>
						</div>
					</div>
				</div>
			</div>
			<!---
				--->
			<div class="panel panel-default" style="height:100%">
				<div class="panel-heading" >
					Providers
					<span ng-bind="Providers.length" class="label label-pill label-default">
					</span>
					<button type="button" class="btn btn-info pull-right btn-xs"  id="BtnNewProvider" ng-click="NewProvider()"  >
						<span class="glyphicon glyphicon-file" >
						</span>
						New
					</button>
				</div>
				<div class="panel-body">
					<div class="list-group" style="overflow:scroll;height:900px;">
						<div ng-class="{active : sProvider.ArrayIndex == prov.ArrayIndex}" ng-click="SelectProvider(prov.ArrayIndex)" class="list-group-item" ng-repeat="prov in Providers" style="cursor:pointer;">
							{{prov.Name}} ({{prov.LocCount}})
						</div>
					</div>
				</div>
			</div>
		</td>
		<td style="vertical-align:top;">
			<div id="ProviderContainer">
				<div class="panel panel-default" style="">
					<div class="panel-heading" >
						Provider Info
						<button type="button" class="btn btn-danger pull-right btn-xs"  id="BtnDeleteProvider" style="margin-left:20px;"  data-toggle="modal" data-target="#DeleteProvider" >
							<span class="glyphicon glyphicon-trash" >
							</span>
							Delete
						</button>
						<button type="button" class="btn btn-success pull-right btn-xs"  id="BtnSaveProvider" ng-click="SaveProvider()" >
							<span class="glyphicon glyphicon-save" style="">
							</span>
							Save
						</button>
					</div>
					<div class="panel-body">
						<div id="ProviderSaveResult">
						</div>
						<table style="width:100%">
							<tr>
								<td style="width:100px;">
									<label for="ProviderName">
										Name:
									</label>
								</td>
								<td>
									<input type="text" class="form-control" ng-model="sProvider.Name" id="ProviderName" style="" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="ProviderWebsite">
										Website:
									</label>
								</td>
								<td>
									<input type="text" class="form-control" ng-model="sProvider.Website" id="ProviderWebsite" style="" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="ProviderDesc">
										Description:
									</label>
								</td>
								<td>
									<input type="text" class="form-control" ng-model="sProvider.Description" id="ProviderDesc" style="" />
								</td>
							</tr>
							<tr ng-class="{hidden : sProvider.Id == -1}">
								<td>
									<label for="LocationList">
										Locations:
									</label>
								</td>
								<td>
									<div class="input-group" style="">
										<select class="form-control" id="LocationList" ng-options='loc.Address for loc in sProvider.Locations' ng-model="sLocation" ng-change="SelectLocation()">
										</select>
										<div class="input-group-btn">
											<button type="button" class="btn btn-info"  id="BtnNewLocation" ng-click="NewLocation()" >
												<span class="glyphicon glyphicon-file">
												</span>
												New
											</button>
										</div>
									</div>
								</td>
							</tr>
							<tr ng-class="{hidden : sProvider.Id == -1}">
								<td>
								</td>
								<td>
									<div class="" id="LocationContainer" >
										<div class="panel panel-default" style="margin-left:20px;margin-top:20px;">
											<div class="panel-heading" >
												Location Info
												<button type="button" class="btn btn-danger pull-right btn-xs "  id="BtnDeleteLocation" style="margin-left:20px;" data-toggle="modal" data-target="#DeleteLocation"  >
													<span class="glyphicon glyphicon-trash" >
													</span>
													Delete
												</button>
												<button type="button" class="btn btn-success pull-right btn-xs "  id="BtnSaveLocation" ng-click="SaveLocation()" >
													<span class="glyphicon glyphicon-save" style="">
													</span>
													Save
												</button>
											</div>
											<div class="panel-body">
												<div id="LocationSaveResult">
												</div>
												<table>
													<tr>
														<td>
															<label for="LocationAddr">
																Address:
															</label>
														</td>
														<td >
															<div class="input-group" style="width:100%">
																<input type="text" class="form-control" ng-model="sLocation.Address" id="LocationAddr" style="" />
																<div class="input-group-btn">
																	<button type="button" class="btn btn-success pull-right"  id="BtnGeoLocate" ng-click="GeoLocate()" >
																		<span class="glyphicon glyphicon-map-marker" style="">
																		</span>
																		GeoLocate
																	</button>
																</div>
															</div>
														</td>
													</tr>
													<tr id="GeoLocationTool">
														<td>
														</td>
														<td>
															<div id="LocationMap" style="height:200px;width:400px;">
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<label for="LocationGeoLat">
																GeoLocation:
															</label>
														</td>
														<td>
															<div style="">
																<span class="input-group" style="float:left;">
																	<div class="input-group-addon">
																		Lat
																	</div>
																	<input type="text" class="form-control" ng-model="sLocation.Geo_Lat" id="LocationGeoLat" style="width:120px;" />
																</span>
																<span class="input-group" style="padding-left:20px;" >
																	<div class="input-group-addon">
																		Lng
																	</div>
																	<input type="text" class="form-control" ng-model="sLocation.Geo_Lng" id="LocationGeoLng" style="width:115px;" />
																</span>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<label for="LocationPhone">
																Phone:
															</label>
														</td>
														<td>
															<input type="text" class="form-control" ng-model="sLocation.Phone" id="LocationPhone" style="" />
														</td>
													</tr>
													<tr>
														<td>
															<label for="LocationHours">
																Hours:
															</label>
														</td>
														<td>
															<textarea class="form-control" rows="5" id="LocationHours" ng-model="sLocation.Hours">
															</textarea>
														</td>
													</tr>
													<tr ng-class="{hidden : sLocation.Id == -1}">
														<td>
															<label for="LocationServices">
																Services:
															</label>
														</td>
														<td>
															<div class="input-group" style="">
																<select class="form-control" id="ServiceList" ng-options='serv.Name for serv in sLocation.Services' ng-model="sService" ng-change="SelectService()">
																</select>
																<div class="input-group-btn">
																	<button type="button" class="btn btn-danger pull-right disabled"  id="BtnDeleteService">
																		<span class="glyphicon glyphicon-trash " style="">
																		</span>
																		Remove
																	</button>
																</div>
															</div>
															<div class="input-group" style="">
																<input type="text" class="form-control" id="" style="" />
																<div class="input-group-btn">
																	<button type="button" class="btn btn-info pull-right disabled"  id="BtnCreateService" >
																		<span class="glyphicon glyphicon-file " style="">
																		</span>
																		New
																	</button>
																</div>
															</div>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</td>
	</tr>
</table>
