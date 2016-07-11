

<div id="srDiv" style="height:100%; " ng-class="{'srDivDesktop' : desktop}"    >
	<div ng-show="mobile" id="ResultsFound" style="padding-bottom:5px;width:300px;" class="center-block">
		Results
		<span class="badge" id="resultcountXS">
			0
		</span>
	</div>
	<div class="alert alert-danger hidden center-block" id="serverError" style="max-width:350px;" >
		<strong>
			Error!
		</strong>
		Server Connection Failed
	</div>
	<div class="alert alert-warning hidden center-block" style="max-width:350px;" id="NoResultsWarning" >
		No Search Results Found
	</div>
	<div style="margin-bottom:5px; max-width:350px;" class="panel panel-default search-results center-block" dir-paginate ="sr in searchResults | itemsPerPage: 4" current-page="currentPage"   >
		<div class="panel-heading" ng-click="showOnMap(sr, false)" style="cursor:pointer;">
			<h4 class="" style="margin:0px">
				{{ sr.Name}}
			</h4>
		</div>
		<div class="panel-body list-group"  style="border-top: 0px none; padding:5px;">
			<div class="list-group-item" style="cursor:pointer;">
				<a ng-href="https://www.google.com/maps?q={{sr.Address}}" target="_blank">
					<span class="glyphicon glyphicon-map-marker">
					</span>
					{{ sr.Address}}
				</a>
			</div>
			<div class="list-group-item" style="padding-top:5px;">
				<div style="float:left;">
					<span class="glyphicon glyphicon-calendar">
					</span>
				</div>
				<div ng-bind-html='sr.Hours'>
				</div>
			</div>
			<div class="list-group-item">
				<span class="glyphicon glyphicon-earphone">
				</span>
				{{ sr.Phone}}
			</div>
			<div class="list-group-item" style="border-bottom: 0 none;">
				<a ng-href="{{sr.WebSite}}" target="_blank">
					<span class="glyphicon glyphicon-home">
					</span>
					Homepage
				</a>
				<button class="btn btn-info pull-right btn-xs" data-toggle="modal" data-target="#service-info" ng-click="changeActiveMarker(sr.Index)" data-keyboard="true">
					More
				</button>
			</div>
		</div>
		<div class="panel-footer text-muted " style="font-size:small;" >
			{{ sr.ServiceMatch}} services matched your search
		</div>
	</div>
	<div align="middle">
		<dir-pagination-controls
			max-size="6"
			direction-links="true"
			auto-hide ="true"
			boundary-links="false"
			on-page-change="pageChanged()"
			>
		</dir-pagination-controls>
	</div>
</div>
