<script src="js/editservices.js"></script>
<table id="ServiceTable"  style="width:100%;height:90%"  ng-app="AdminPanel">
	<tr ng-controller="ServiceListController" style="">
		<td>
			<div class="panel panel-default" style="height:100%">
				<div class="panel-heading" >
					Services <span ng-bind="Services.length" class="label label-pill label-default"></span>
				</div>
				<div class="panel-body">
					<div class="list-group" style="overflow:scroll;height:700px;">
						<div class="list-group-item" ng-repeat="serv in Services" style="cursor:pointer;" ng-click="SelectService(serv)"  ng-class="{active : sService.ArrayIndex == serv.ArrayIndex }" >
							<h4 ng-class="{hidden : sService.ArrayIndex == serv.ArrayIndex }" >
								{{serv.Name}}
							</h4>

							<div class="input-group" style="width:500px;" ng-class="{hidden : sService.ArrayIndex != serv.ArrayIndex }">
								<input type="text" ng-model="sService.Name"  class="form-control" id="ServiceName" />
								<div class="input-group-btn">
									<button type="button" class="btn btn-success  "  id="BtnSaveService" ng-click="SaveService()" >
										<span class="glyphicon glyphicon-save" style="">
										</span>
										Save
									</button>

									<button type="button" class="btn btn-danger disabled"  id="BtnDeleteService" style="" >
										<span class="glyphicon glyphicon-trash" >
										</span>
										Delete
									</button>
								</div>
							</div>
							<small>
								Locations:
								<span class="label label-pill label-default">
									{{serv.LocCount}}
								</span>
							</small>
						</div>
					</div>
				</div>
			</div>
		</td>
	</tr>
</table>
