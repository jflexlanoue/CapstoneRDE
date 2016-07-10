<div class="modal fade" id="service-info" tabindex='-1'  >
	<div class="modal-dialog modal-lg center-block" style="">
		<div class="modal-content" >
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">
					&times;
				</button>
				<h4>
					{{activeResults.Name}}
				</h4>
			</div>
			<div class="modal-body" >
				<div class="row">
					<div class="col-sm-5">
						<div class="panel panel-primary center-block" style="max-width:350px;">
							<div class="panel-heading">
								Information
							</div>
							<div class="panel-body list-group">
								<div class="list-group-item" style="cursor:pointer;">
									<a ng-href="https://www.google.com/maps?q={{activeResults.Address}}" target="_blank">
										<span class="glyphicon glyphicon-map-marker">
										</span>
										{{ activeResults.Address}}
									</a>
								</div>
								<div class="list-group-item">
									<div style="float:left;">
										<span class="glyphicon glyphicon-calendar">
										</span>
									</div>
									<div ng-bind-html='activeResults.Hours'>
									</div>
								</div>
								<div class="list-group-item">
									<span class="glyphicon glyphicon-earphone">
									</span>
									{{ activeResults.Phone}}
								</div>
								<div class="list-group-item">
									<a ng-href="{{activeResults.WebSite}}" target="_blank">
										<span class="glyphicon glyphicon-home">
										</span>
										Homepage
									</a>
								</div>
							</div>
						</div>
						<div class="panel panel-success center-block" style="max-width:350px;" >
							<div class="panel-heading">
								Location
							</div>
							<div class="panel-body">
								<div id="map2" class="img-responsive" >
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="panel panel-info" >
							<div class="panel-heading">
								Services
								<span class="badge">
									{{activeResults.Service.length}}
								</span>
							</div>
							<div class="panel-body list-group" style="">
								<li class="list-group-item" ng-repeat="name in activeResults.Service">
									{{name}}
								</li>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger pull-right" data-dismiss="modal">
					Close
				</button>
			</div>
		</div>
	</div>
</div>
