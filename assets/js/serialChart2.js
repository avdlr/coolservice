var chart3 = AmCharts.makeChart("chartdiv", {
	"type" : "serial",
	"language":"es",
	"hideCredits" : true,
	"legend": {
		"position": "top",
		"useGraphSettings" : true,
	    "periodValueText": "totales [[value.sum]]",
	    "valueWidth": 100,//sepearacion despues del valor
	    "equalWidths": false,//el que hace que los valores esten pegados a la descripcion
	    "valueAlign": "left",
	  },
	"dataProvider" : graficaStack,
	"synchronizeGrid" : true,
	"valueAxes" : [ {
		"id" : "v1",
		"axisColor" : "#000000",
		"axisThickness" : 2,
		"axisAlpha" : 1,
		"position" : "left"

	} ],
	"graphs" : [ {
		"valueAxis" : "v1", 
		"lineColor" : "#f4fa58",
		"bullet" : "round",
		"bulletBorderThickness" : 1,
		"hideBulletsCount" : 30,
		"title" : "Pendientes",
		"valueField" : "pen",
		"fillAlphas" : 0
	}, {
		"valueAxis" : "v21",
		"lineColor" : "#58e85a",
		"bullet" : "square",
		"bulletBorderThickness" : 1,
		"hideBulletsCount" : 30,
		"title" : "Asignadas",
		"valueField" : "asi",
		"fillAlphas" : 0
	}, {
		"valueAxis" : "v1",
		"lineColor" : "#75bcfd",
		"bullet" : "triangleUp",
		"bulletBorderThickness" : 1,
		"hideBulletsCount" : 30,
		"title" : "Despachadas",
		"valueField" : "des",
		"fillAlphas" : 0
	}, {
		"valueAxis" : "v21",
		"lineColor" : "#858585",
		"bullet" : "triangleDown",
		"bulletBorderThickness" : 1,
		"hideBulletsCount" : 30,
		"title" : "Objetadas",
		"valueField" : "obj",
		"fillAlphas" : 0
	} ],
	"chartScrollbar" : {},
	"chartCursor" : {
		"cursorPosition" : "mouse"
	},
	"categoryField" : "cope",
	"categoryAxis" : { 
		"parseDates" : false,
		"axisColor" : "#000000",
		"minorGridEnabled" : true
	},
	"export" : {
		"enabled" : true,
		"position" : "bottom-right"
	}
});

chart3.addListener("dataUpdated", zoomChart);
zoomChart();

function zoomChart() {
	chart3.zoomToIndexes(chart3.dataProvider.length - 20,
			chart3.dataProvider.length - 1);
}
