var chart = AmCharts.makeChart(
				"chartdiv0",
				{
					"hideCredits":true,
					"type" : "pie",
					"theme" : "light",
					"titles" : [ {
						"text" : " ",
						"size" : 15
					} ],
					"dataProvider" : graficaDona,

					"colorField" : "color",
					"valueField" : "num",
					"titleField" : "estado",
					"startEffect" : "elastic",
					"startDuration" : 3,
					"labelRadius" : 15,
					"labelText" : "[[title]]:[[value]]",
					"innerRadius" : "50%",
					"depth3D" : 15,
					"balloonText" : "[[title]]<br><span style='font-size:13px'><b>[[value]]</b></span>",
					"angle" : 30,
					"export" : {
						"enabled" : true
					}
				});

