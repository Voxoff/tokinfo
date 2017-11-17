google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Date');
      data.addColumn('number', 'Price');

      data.addRows([
        [0, 0],   [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
        [6, 11],  [7, 27],  [8, Math.floor(Math.random() * 31) + 20],  [9, Math.floor(Math.random() * 31) + 20],  [10, Math.floor(Math.random() * 31) + 20], [11, Math.floor(Math.random() * 31) + 20],
        [12, Math.floor(Math.random() * 31) + 20], [13, Math.floor(Math.random() * 31) + 20], [14, Math.floor(Math.random() * 31) + 20], [15, Math.floor(Math.random() * 31) + 20], [16, Math.floor(Math.random() * 31) + 20], [17, 48],
        [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
        [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
        [30, Math.floor(Math.random() * 11) + 50], [31, Math.floor(Math.random() * 11) + 50], [32, Math.floor(Math.random() * 11) + 50], [33, Math.floor(Math.random() * 11) + 50], [34, Math.floor(Math.random() * 11) + 50], [35, Math.floor(Math.random() * 11) + 50],
        [36, Math.floor(Math.random() * 11) + 50], [37, Math.floor(Math.random() * 11) + 50], [38, Math.floor(Math.random() * 11) + 50], [39, 61], [40, 64], [41, 65],
        [42, 63], [43, 66], [44, 67], [45, 69], [46, 69], [47, 70],
        [48, 72], [49, 68], [50, 66], [51, 65], [52, Math.floor(Math.random() * 31) + 50], [53, 70],
        [54, Math.floor(Math.random() * 31) + 50], [55, Math.floor(Math.random() * 31) + 50], [56, Math.floor(Math.random() * 31) + 50], [57, Math.floor(Math.random() * 31) + 50], [58, 70], [59, 68],
        [60, Math.floor(Math.random() * 31) + 50], [61, Math.floor(Math.random() * 31) + 50], [62, Math.floor(Math.random() * 31) + 50], [63, Math.floor(Math.random() * 31) + 50], [64, Math.floor(Math.random() * 31) + 50], [65, Math.floor(Math.random() * 31) + 50],
        [66, Math.floor(Math.random() * 31) + 50], [67, Math.floor(Math.random() * 31) + 50], [68, Math.floor(Math.random() * 31) + 50], [69, Math.floor(Math.random() * 31) + 50]
      ]);

      var options = {'title':'Price over Time',
                       'width':680,
                       'height':300,
                       hAxis: {
                          title: 'Date'
                        },
                        vAxis: {
                          title: 'Price'
                        }
                     };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
