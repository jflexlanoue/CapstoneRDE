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
							<button type="button" class="btn btn-danger btn-sm " style=" margin-left:15px; vertical-align:top;"  ng-click="ClearAdvProviders()">
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
								<select class="search-services form-control selectpicker js-example-responsive" style="width:78%;" multiple="multiple" id="ServiceSearch" onchange="ChangeAdvSearch()">
								</select>
								<button type="button" class="btn btn-danger btn-sm" style=" margin-left:15px; vertical-align:top;"  ng-click="ClearAdvServices()">
									Clear
								</button>
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
