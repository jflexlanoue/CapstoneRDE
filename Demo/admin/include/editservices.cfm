<script src="js/editservices.js"></script>
<table id="ServiceTable"  style="width:100%;height:90%"  ng-app="AdminPanel">
	<tr ng-controller="ServiceListController" style="">
		<td>
			<div id="DeleteService" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								&times;
							</button>
							<h4 class="modal-title">
								Delete Service
							</h4>
						</div>
						<div class="modal-body">
							Are you sure you want to delete this Service: {{sService.Name}} </br> Assigned To {{sService.LocCount}} locations
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="DeleteService()">
								Yes
							</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">
								No
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default" style="height:100%">
				<div class="panel-heading" >
					Services <span ng-bind="Services.length" class="label label-pill label-default"></span>
				</div>
				<div class="panel-body">
					<div class="list-group" style="overflow:scroll;height:700px;">
						<div class="list-group-item" ng-repeat="serv in Services" style="cursor:pointer;" ng-click="SelectService(serv)"  ng-class="{active : sService.ArrayIndex == serv.ArrayIndex }" >
							<h4 ng-class="{hidden : sService.Id == serv.Id }" >
								{{serv.Name}}
								<span class="label label-primary label-pill ">ID: {{serv.Id}}</span>
							</h4>

							<div class="input-group" style="width:500px;" ng-class="{hidden : sService.ArrayIndex != serv.ArrayIndex }">
								<input type="text" ng-model="sService.Name"  class="form-control" id="ServiceName" />
								<div class="input-group-btn">
									<button type="button" class="btn btn-success  "  id="BtnSaveService" ng-click="SaveService()" >
										<span class="glyphicon glyphicon-save" style="">
										</span>
										Save
									</button>

									<button type="button" class="btn btn-danger"  id="BtnDeleteService"   data-toggle="modal" data-target="#DeleteService" >
										<span class="glyphicon glyphicon-trash" >
										</span>
										Delete
									</button>
								</div>
							</div>
							<small>
								Locations:
								<span class="label label-pill label-default">{{serv.LocCount}}</span>
							</small>
						</div>
					</div>
				</div>
			</div>
		</td>
	</tr>
</table>
