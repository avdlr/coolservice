var Script = function () {

    //morris chart

    $(function () {
      // data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type



      Morris.Area({
        element: 'hero-area',
        data: [
          {period: '2015 Q1', Emitidas: 2666, Pagadas: 2987, Canceladas: 2647, Siniestros: 1857, PorRenovar: 2458},
          {period: '2015 Q2', Emitidas: 2778, Pagadas: 2294, Canceladas: 2441, Siniestros: 1857, PorRenovar: 2458},
          {period: '2015 Q3', Emitidas: 4912, Pagadas: 1969, Canceladas: 2501, Siniestros: 1857, PorRenovar: 2458},
          {period: '2015 Q4', Emitidas: 3767, Pagadas: 3597, Canceladas: 5689, Siniestros: 1857, PorRenovar: 2458},
          {period: '2016 Q1', Emitidas: 6810, Pagadas: 1914, Canceladas: 2293, Siniestros: 1857, PorRenovar: 2458},
          {period: '2016 Q2', Emitidas: 5670, Pagadas: 4293, Canceladas: 1881, Siniestros: 1857, PorRenovar: 2458},
          {period: '2016 Q3', Emitidas: 4820, Pagadas: 3795, Canceladas: 1588, Siniestros: 1857, PorRenovar: 2458},
          {period: '2016 Q4', Emitidas: 15073, Pagadas: 5967, Canceladas: 5175, Siniestros: 1857, PorRenovar: 2458},
          {period: '2017 Q1', Emitidas: 10687, Pagadas: 4460, Canceladas: 2028, Siniestros: 1857, PorRenovar: 2458},
          {period: '2017 Q2', Emitidas: 8432, Pagadas: 5713, Canceladas: 1791, Siniestros: 1857, PorRenovar: 2458}
        ],

          xkey: 'period',
          ykeys: ['Emitidas', 'Pagadas', 'Canceladas', 'Siniestros', 'PorRenovar'],
          labels: ['Emitidas', 'Pagadas', 'Canceladas', 'Siniestros', 'Por Renovar'],
          hideHover: 'auto',
          lineWidth: 1,
          pointSize: 5,
          lineColors: ['#a9d86e', '#4a8bc2', '#ff6c60', '#000000', '#ffd777'],
          fillOpacity: 0.5,
          smooth: true
      });





      $('.code-example').each(function (index, el) {
        eval($(el).text());
      });
    });

}();




