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
	<div class="col-xs-10  col-sm-5 col-sm-offset-2 " id="SearchBar" style="padding-bottom:0px;" >
		<form>
			<div id="BasicSearch" class="input-group " style="margin:0px;" >
				<input class="form-control search-terms" placeholder="Search" type="text" autofocus="autofocus" />
				<div class="input-group-btn">
					<button type="button" class="btn btn-default" data-toggle="collapse" data-target="#advancedSearch" id="AdvToggle"   >
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

