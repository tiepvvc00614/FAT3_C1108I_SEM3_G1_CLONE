$(document).ready(function () {
    $("#show-income").on('submit', function (evt) {
        evt.preventDefault();
        
    });
});

function showIncome(dataDownloaded) 
{
    

}

var charts =
	{
	    init: function () {

	        // init simple chart
	        //this.chart_simple.init();

	        // init lines chart with fill & without points
	        this.chart_lines_fill_nopoints.init();

	        // init ordered bars chart
	        //this.chart_ordered_bars.init();

	        // init donut chart
	        //this.chart_donut.init();

	        // init stacked bars chart
	        //this.chart_stacked_bars.init();

	        // init pie chart
	        //this.chart_pie.init();

	        // init horizontal bars chart
	        //this.chart_horizontal_bars.init();

	        // init live chart
	        //this.chart_live.init();
	    },
	    utility:
		{
		    chartColors: ["#37a6cd", "#444", "#777", "#999", "#DDD", "#EEE"],
		    chartBackgroundColors: ["#fff", "#fff"],

		    applyStyle: function (that) {
		        that.options.colors = charts.utility.chartColors;
		        that.options.grid.backgroundColor = { colors: charts.utility.chartBackgroundColors };
		        that.options.grid.borderColor = charts.utility.chartColors[0];
		        that.options.grid.color = charts.utility.chartColors[0];
		    },

		    randNum: function () {
		        return Math.floor((Math.random() * 50) + 1);
		    }
		},
	    chart_lines_fill_nopoints:
		{
		    // chart data
		    data:
			{
			    d1: []
			},

		    // will hold the chart object
		    plot: null,

		    // chart options
		    options:
			{
			    grid: {
			        show: true,
			        aboveData: true,
			        color: "#3f3f3f",
			        labelMargin: 5,
			        axisMargin: 0,
			        borderWidth: 0,
			        borderColor: null,
			        minBorderMargin: 5,
			        clickable: true,
			        hoverable: true,
			        autoHighlight: true,
			        mouseActiveRadius: 20,
			        backgroundColor: {}
			    },
			    series: {
			        grow: { active: false },
			        lines: {
			            show: true,
			            fill: true,
			            lineWidth: 2,
			            steps: false
			        },
			        points: { show: true }
			    },
			    legend: { position: "nw" },
			    yaxis: { min: 0 },
			    xaxis: {
			        ticks: 30,
			        mode: "time",
			        timeformat: "%m/%d",
			        minTickSize: [1, "day"]
			    },
			    colors: [],
			    shadowSize: 1,
			    tooltip: true,
			    tooltipOpts: {
			        content: "%s : %y.0",
			        shifts: {
			            x: -30,
			            y: -50
			        },
			        defaultTheme: false
			    }
			},

		    // initialize
		    init: function () {
		        // apply styling
		        charts.utility.applyStyle(this);

		        // generate some data
		        this.data.d1 = [[1207038652000, 15], [1207125052000, 35], [1207211452000, 17], [1207297852000, 55], [1207384252000, 105], [1207470652000, 49], [1207557052000, 22], [1207643452000, 40], [1207729852000, 68]];
		        //this.data.d2 = [[1, charts.utility.randNum()-5], [2, charts.utility.randNum()-4], [3, charts.utility.randNum()-4], [4, charts.utility.randNum()],[5, 4+charts.utility.randNum()],[6, 4+charts.utility.randNum()],[7, 5+charts.utility.randNum()],[8, 5+charts.utility.randNum()],[9, 6+charts.utility.randNum()],[10, 6+charts.utility.randNum()],[11, 6+charts.utility.randNum()],[12, 2+charts.utility.randNum()],[13, 3+charts.utility.randNum()],[14, 4+charts.utility.randNum()],[15, 4+charts.utility.randNum()],[16, 4+charts.utility.randNum()],[17, 5+charts.utility.randNum()],[18, 5+charts.utility.randNum()],[19, 2+charts.utility.randNum()],[20, 2+charts.utility.randNum()],[21, 3+charts.utility.randNum()],[22, 3+charts.utility.randNum()],[23, 3+charts.utility.randNum()],[24, 2+charts.utility.randNum()],[25, 4+charts.utility.randNum()],[26, 4+charts.utility.randNum()],[27,5+charts.utility.randNum()],[28, 2+charts.utility.randNum()],[29, 2+charts.utility.randNum()], [30, 3+charts.utility.randNum()]];
		        console.log((new Date(2012, 6, 1, 0, 0, 0, 0)).getTime());
		        // make chart
		        this.plot = $.plot(
					'#chart_lines_fill_nopoints',
					[{
					    label: "Income",
					    data: this.data.d1,
					    lines: { fillColor: "#fff8f2" },
					    points: { fillColor: "#88bbc8" }
					}],
             		this.options);
		    }
		}
	};
$(function () {
    // initialize charts
    charts.init();
});

