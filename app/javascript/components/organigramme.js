import React, { useEffect } from 'react';

const Organigramme = ({ data }) => {
  useEffect(() => {
    // Chargement de l'API Google Charts
    window.google.charts.load('current', {packages:["orgchart"]});
    window.google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      // Création des données
      var chartData = [];
      data.forEach(entreprise => {
        chartData.push([{v:entreprise.id, f:entreprise.nom}, entreprise.entreprise_mere_id, entreprise.taux_detention]);
      });

      var dataTable = window.google.visualization.arrayToDataTable([
        [{label: 'Name', type: 'string'}, {label: 'Manager', type: 'string'}, {label: 'Taux de Detention', type: 'string'}],
        ...chartData
      ]);

      // Création du graphique
      var chart = new window.google.visualization.OrgChart(document.getElementById('organigramme'));
      chart.draw(dataTable, {allowHtml:true});
    }
  }, [data]);

  return <div id="organigramme"></div>;
};

export default Organigramme;
