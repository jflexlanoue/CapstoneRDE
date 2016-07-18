<div class="modal fade" id="Advanced-Search" tabindex='-1'  >
	<div class="modal-dialog modal-md center-block">
		<div class="modal-content" >
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">
					&times;
				</button>
				<h4>
					Advanced Filters
				</h4>
			</div>
			<div class="modal-body" >
				<form>
					<fieldset class="form-group" style="">
						<label for="ProviderSearch">
							Any of these Providers:
						</label>
						<div class="input-group" style="width:100%;">
							<select class="search-providers form-control selectpicker js-example-responsive" style=" width:78%; "  multiple="multiple" id="ProviderSearch" onchange="ChangeAdvSearch()" >
							</select>
							<button type="button" class="btn btn-danger btn-sm " style=" margin-left:5px; vertical-align:top;"  ng-click="ClearAdvProviders()">
								Clear
							</button>
						</div>
					</fieldset>
					<hr>
					<fieldset class="form-group" style="">
						<label for="ServiceSearch">
							Any of these Services:
						</label>
						<div class="input-group" style="width:100%">
								<select class="search-services form-control selectpicker js-example-responsive" style="width:78%; max-width:78%;overflow:hidden;" multiple="multiple" id="ServiceSearch" onchange="ChangeAdvSearch()">
								</select>
								<button type="button" class="btn btn-danger btn-sm" style=" margin-left:5px; vertical-align:top;"  ng-click="ClearAdvServices()">
									Clear
								</button>
						</div>
					</fieldset>
					<hr>
					
					
					<fieldset class="form-group">
						<label>
							<input type="checkbox" id="RadialSearchBox" onchange="ChangeAdvSearch();" ng-model="UseRadialSearch" ng-value="true" ng-change="GetLocation()">
							Radial Search
						</label>
							
						<div class="panel panel-default" >
							<div class="panel-body">
							
							
								<table style="width:100%">
									<tr >
										<td >
											<label for="distanceInMiles" style="vertical-align:middle;">Within</label>
											<label for="SearchMiles" style="vertical-align:middle;">
											
											
											
												<select class="form-control" id="SearchMiles" ng-disabled="!UseRadialSearch" ng-model="WithinMiles" ng-options="option.value as option.name for option in MilesChoices" >

												</select>
											</label>
											<label for="zip" style="vertical-align:middle;">Of</label>
										</td>
										<td style="padding-left:20px; border-left:1px solid black;">
											<div class="radio" >
												<label>
													<input type="radio" id="RadioUserLoc" name="RadioLoc" checked="checked" ng-disabled="!UseRadialSearch" ng-model="UseUserLocation" ng-value="true" ng-change="GetLocation()" >
													My Location
												</label>
											</div>
											<hr>
											<div class="radio" style="vertical-align:middle" >
												<label>
													<input type="radio" id="RadioCustomLoc" name="RadioLoc" value="Custom" ng-disabled="!UseRadialSearch" ng-model="UseUserLocation" ng-value="false">
													
													<input type="text" class="form-control" id="UserLocation" style="width:100%" placeholder="Address" ng-disabled="(UseUserLocation || !UseRadialSearch)" ng-model="CustomAddress" ng-blur="FindAddress()">
													
													</input>
												</label>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default pull-right" data-dismiss="modal">
					Close
				</button>
			</div>
		</div>
	</div>
</div>
