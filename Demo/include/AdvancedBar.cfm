<!--- Advanced Tab Drop Down --->
<div class="row collapse" id="advancedSearch" style="padding-bottom:0px; " >
	<div class="col-xs-10 col-xs-offset-1 col-sm-5 col-sm-offset-3" style="">
		<div class="panel panel-default" style="padding-bottom:0px; margin-top:5px;margin-bottom:0px;">
			<div class="panel-heading">
				<h4 class="panel-title" style="margin:0px" >
					Advanced Filters
				</h4>
			</div>
			<div class="panel-body">
				<form>
					<div class="form-group" >
						<label for="ProviderSearch">
							Any of these Providers:
						</label>
						<select class="search-providers form-control selectpicker js-example-responsive" style="width:78%"  multiple="multiple" id="ProviderSearch" onchange="FixLayout();ChangeAdvSearch();">
						</select>
						<button type="button" class="btn btn-danger btn-sm pull-right" style=" vertical-align:top;"  ng-click="ClearAdvProviders()">
							Clear
						</button>
					</div>
					<div class="form-group" >
						<label for="ServiceSearch">
							Any of these Services:
						</label>
						<select class="search-services form-control selectpicker js-example-responsive" style="width:78%" multiple="multiple" id="ServiceSearch" onchange="FixLayout();ChangeAdvSearch();" >
						</select>
						<button type="button" class="btn btn-danger btn-sm pull-right" style="  vertical-align:top;"  ng-click="ClearAdvServices()">
							Clear
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
