var chart2 = AmCharts
		.makeChart(
				"chartdiv",
				{
					"hideCredits" : true,
					"type" : "serial",
					"theme" : "none",
					"legend" : {
						"horizontalGap" : 10,
						"maxColumns" : 1,
						"position" : "left",
						"useGraphSettings" : true,
						"markerSize" : 10,

					},
					"dataProvider" : graficaStack,

					"valueAxes" : [ {
						"stackType" : "regular",
						"axisAlpha" : 0.5,
						"gridAlpha" : 0
					} ],
					"graphs" : [
							{
								"balloonText" : "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
								"fillAlphas" : 0.8,
								"fillColors" : "#f4fa58",
								"labelText" : "[[value]]",
								"lineAlpha" : 0.3,
								"title" : "Pendiente",
								"type" : "column",
								"color" : "#000000",
								"valueField" : "pen"
							},
							{
								"balloonText" : "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
								"fillAlphas" : 0.8,
								"fillColors" : "#58e85a",
								"labelText" : "[[value]]",
								"lineAlpha" : 0.3,
								"title" : "Asignada",
								"type" : "column",
								"color" : "#000000",
								"valueField" : "asi"
							},
							{
								"balloonText" : "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
								"fillAlphas" : 0.8,
								"fillColors" : "#75bcfd",
								"labelText" : "[[value]]",
								"lineAlpha" : 0.3,
								"title" : "Despachada",
								"type" : "column",
								"color" : "#000000",
								"valueField" : "des"
							},
							{
								"balloonText" : "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
								"fillAlphas" : 0.8,
								"fillColors" : "#858585",
								"labelText" : "[[value]]",
								"lineAlpha" : 0.3,
								"title" : "Objetada",
								"type" : "column",
								"color" : "#000000",
								"valueField" : "obj"
							}],

					"rotate" : true,
					"depth3D" : 15,
					"angle" : 30,
					"categoryField" : "cope",
					"categoryAxis" : {
						"gridPosition" : "start",
						"axisAlpha" : 0,
						"gridAlpha" : 0,
						"position" : "left"
					},
					"export" : {
						"enabled" : true
					}
				});