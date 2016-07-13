//Executes when the page First Loads
$(document)
		.ready(
				function() {

					var FirstTimeVisit = localStorage.getItem("firsttimevisit");

					if (FirstTimeVisit === null) {
						$("#IntroductionMessage").collapse("show");
					}

					localStorage.setItem("firsttimevisit", "no");

					// Load Provider Data for Advanced Search
					var providerData = [];

					$.when(getSearchProviders()).done(function() {
						$(".search-providers").select2({
							data : providerData,
							tags : false,
							placeholder : 'Providers',
							closeOnSelect : false,
							allowClear : true,
							multiple : true
						});
					});

					function getSearchProviders() {
						var dfr = $.Deferred();
						$.ajax({
							url : "json/providerlistJSON.cfm",
							dataType : 'json',
							timeout : 3000,
							success : function(results) {
								for (var i = 0; i < results.ROWCOUNT; i++) {
									providerData.push({
										id : results.DATA.ID[i],
										text : results.DATA.NAME[i]
									});
								}
								dfr.resolve();
							},
							error : function(req, status, error) {
								console.log("get Provider data failed!");

							}
						});
						return dfr.promise();
					}
					;

					// Load Services Data for Advanced Search
					var serviceData = [];

					$.when(getSearchServices()).done(function() {
						$(".search-services").select2({
							data : serviceData,
							tags : false,
							placeholder : 'Services',
							closeOnSelect : false,
							allowClear : true,
							multiple : true
						});
					});

					function getSearchServices() {
						var dfr = $.Deferred();
						$.ajax({
							url : "json/servicelistJSON.cfm",
							dataType : 'json',
							timeout : 3000,
							success : function(results) {
								for (var i = 0; i < results.ROWCOUNT; i++) {
									serviceData.push({
										id : results.DATA.ID[i],
										text : results.DATA.NAME[i]
									});
								}
								dfr.resolve();
							},
							error : function(req, status, error) {
								console.log("get Service data failed!");
							}
						});
						return dfr.promise();
					}
					;

					$("#btnSearch")
							.on(
									"click",
									function() {

										$("#advancedSearch").collapse("hide");

										var searchterms = $('.search-terms')
												.val();
										var searchProviders = [];

										var searchProvidersData = $(
												'.search-providers').select2(
												'data');
										if (searchProvidersData.length > 0) {

											for (var i = 0; i < searchProvidersData.length; i++) {
												searchProviders
														.push(searchProvidersData[i].id);
											}
										}

										var searchServices = [];
										var searchServicesData = $(
												'.search-services').select2(
												'data');
										if (searchServicesData.length > 0) {

											for (var i = 0; i < searchServicesData.length; i++) {
												searchServices
														.push(searchServicesData[i].id);
											}
										}

										angular.element($('#myCtrlDiv'))
												.scope().getFilteredData(
														searchterms,
														searchProviders
																.join(','),
														searchServices
																.join(','));
									});

				});