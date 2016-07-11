<div class="row" >
	<div class="col-xs-offset-1"  >
		<h2 style="color:white; padding:0px; padding-right:15px; margin:0px; margin-top:5px;"  >
			<span style="cursor:pointer;" onclick="refreshPage();">
				HIV Resource Guide
			</span>
		</h2>
	</div>
</div>
<!--- Main Search Bar --->
<div class="row" >
	<div class="col-xs-1 " style="padding:0px; margin:0px; padding-left:18px;  top: 15px;  font-size: 1.5em;" >
		<a style="cursor:pointer; color:white"  data-toggle="collapse" data-target="#IntroductionMessage" >
			<span  aria-label="What is this?" class="glyphicon glyphicon-question-sign" >
			</span>
		</a>
	</div>
	<div class="col-xs-10  col-sm-5 col-sm-offset-2" style="padding-bottom:0px; " >
		<form>
			<div id="BasicSearch" class="input-group " style="margin:0px;" >
				<input class="form-control search-terms" placeholder="Search" type="text" autofocus="autofocus" />
				<div class="input-group-btn">
					<button type="button" class="btn btn-default" data-toggle="collapse" data-target="#advancedSearch"  >
						<span class="caret" >
						</span>
					</button>
					<button type="submit" class="btn btn-default"  id="btnSearch" >
						<span class="glyphicon glyphicon-search">
						</span>
						Search
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!--- Advanced Tab Drop Down --->
<div class="row collapse" id="advancedSearch" style="padding-bottom:0px;" >
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
						<select class="search-providers form-control selectpicker js-example-responsive" style="width:90%"  multiple="multiple" id="ProviderSearch" onchange="FixLayout()">
						</select>
					</div>
					<div class="form-group" >
						<label for="ServiceSearch">
							Any of these Services:
						</label>
						<select class="search-services form-control selectpicker js-example-responsive" style="width:90%" multiple="multiple" id="ServiceSearch" onchange="FixLayout()">
						</select>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
