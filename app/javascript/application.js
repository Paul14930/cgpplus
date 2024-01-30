// Entry point for the build script in your package.json

document.addEventListener('turbolinks:load', function() {
  if (document.getElementById('organigramme')) {
    google.charts.load('current', {packages:["orgchart"]});
    google.charts.setOnLoadCallback(drawChart);
  }

  function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('string', 'Manager');
    data.addColumn('string', 'ToolTip');

    // Les données seront injectées ici depuis la vue Rails.
    var chartData = JSON.parse(document.getElementById('organigramme').dataset.entreprises);
console.log(chartData);
    data.addRows(chartData.map(entreprise => [
      {v: entreprise.v, f: entreprise.f}, entreprise.parent, ''
    ]));

    var chart = new google.visualization.OrgChart(document.getElementById('organigramme'));
    chart.draw(data, {allowHtml:true});
  }
});
