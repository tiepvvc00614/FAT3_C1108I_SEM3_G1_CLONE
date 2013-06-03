$(document).ready(function () {
    $("#show-income").on('submit', function (evt) {
        evt.preventDefault();
        $.ajax({
            url: "Ajax/IncomeLoader.aspx",
            type: "GET",
            data: {
                fromDate: $("#dateRangeFrom").val(),
                toDate: $("#dateRangeTo").val()
            },
            success: function (msg) {
                showIncome(msg);
            }
        });
    });
    
    /** ============= INIT CHART WHEN LOAD ============= **/
    $.ajax({
        url: "Ajax/IncomeLoader.aspx",
        type: "GET",
        data: {
    },
    success: function (msg) {
        showIncome(msg);
    }
    });
});

function showIncome(dataDownloaded) 
{
    var charts =
	{
	    init: function () {
	        this.chart_lines_fill_nopoints.init();
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
			        ticks: dataDownloaded.length,
			        mode: "time",
			        timeformat: "%m/%d",
			        minTickSize: [1, "day"]
			    },
			    colors: [],
			    shadowSize: 1,
			    tooltip: true,
			    tooltipOpts: {
			        content: "%s : $%y.0",
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
		        this.data.d1 = dataDownloaded.data;
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
    charts.init();

}


