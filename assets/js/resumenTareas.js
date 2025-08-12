(function(global){
  if (typeof global.realizaTERMINAR !== 'function') {
    global.realizaTERMINAR = function(idorden, orden, sigestatus, actualestatus, idaccion) {
      var user = global.usuarioAccion || '';
      var base = '../jsp/';
      var page = (global.innerWidth < 780) ? 'formTerminarMovil.jsp' : 'formTerminar.jsp';
      var url = base + page + '?usuario=' + encodeURIComponent(user) +
        '&accion=TERMINAR&idorden=' + encodeURIComponent(idorden) +
        '&orden=' + encodeURIComponent(orden) +
        '&estatus=' + encodeURIComponent(sigestatus) +
        '&actualestatus=' + encodeURIComponent(actualestatus) +
        '&idaccion=' + encodeURIComponent(idaccion);
      if (global.$ && global.$('#dialog').length && global.$.fn.dialog) {
        var w = global.innerWidth;
        var h = global.innerHeight;
        global.$('#dialog').dialog({
          autoOpen: false,
          modal: true,
          title: 'Terminar Trabajo',
          width: w - 30,
          height: (w < 600) ? h : 700,
          buttons: [{
            text: 'Cerrar',
            click: function(){ global.$(this).dialog('close'); }
          }]
        });
        global.$('#dialog').load(url);
        global.$('#dialog').dialog('open');
      } else {
        global.open(url, '_blank');
      }
    };
  }

  if (typeof global.realizaSUSPENDER !== 'function') {
    global.realizaSUSPENDER = function(idorden, orden, sigestatus, actualestatus, idaccion) {
      var user = global.usuarioAccion || '';
      var base = '../jsp/';
      var page = (global.innerWidth < 780) ? 'formSuspenderMovil.jsp' : 'formSuspender.jsp';
      var url = base + page + '?usuario=' + encodeURIComponent(user) +
        '&accion=SUSPENDER&idorden=' + encodeURIComponent(idorden) +
        '&orden=' + encodeURIComponent(orden) +
        '&estatus=' + encodeURIComponent(sigestatus) +
        '&actualestatus=' + encodeURIComponent(actualestatus) +
        '&idaccion=' + encodeURIComponent(idaccion);
      if (global.$ && global.$('#dialog').length && global.$.fn.dialog) {
        var w = global.innerWidth;
        var h = global.innerHeight;
        global.$('#dialog').dialog({
          autoOpen: false,
          modal: true,
          title: 'Suspender Trabajo',
          width: w - 30,
          height: (w < 600) ? h : 400,
          buttons: [{
            text: 'Cerrar',
            click: function(){ global.$(this).dialog('close'); }
          }]
        });
        global.$('#dialog').load(url);
        global.$('#dialog').dialog('open');
      } else {
        global.open(url, '_blank');
      }
    };
  }

  if (typeof global.realizaDETALLE !== 'function') {
    global.realizaDETALLE = function(idorden, orden, sigestatus, actualestatus, idaccion) {
      var base = '../jsp/';
      var page = (global.innerWidth < 800) ? 'detalleMovil.jsp' : 'detalle.jsp';
      var url = base + page + '?orden=' + encodeURIComponent(orden) +
        '&idorden=' + encodeURIComponent(idorden);
      if (global.$ && global.$('#dialog').length && global.$.fn.dialog) {
        var w = global.innerWidth;
        var h = global.innerHeight;
        global.$('#dialog').dialog({
          autoOpen: false,
          modal: true,
          title: 'Detalle de Orden: ' + orden,
          width: w - 30,
          height: (w < 600) ? h : 700,
          buttons: [{
            text: 'Cerrar',
            click: function(){ global.$(this).dialog('close'); }
          }]
        });
        global.$('#dialog').load(url);
        global.$('#dialog').dialog('open');
      } else {
        global.open(url, '_blank');
      }
    };
  }
})(this);
