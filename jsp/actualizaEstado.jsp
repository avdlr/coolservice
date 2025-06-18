<%@ page import="bean.ActualizaEstadoTarea"%>

<%
ActualizaEstadoTarea actualiza = new ActualizaEstadoTarea();
String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo"): "";
String estado = request.getParameter("estado") != null ? request.getParameter("estado"): "";
String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
String expediente = request.getParameter("expediente") != null ? request.getParameter("expediente"): "";
String nombre = request.getParameter("nombre") != null ? request.getParameter("nombre"): "";
String accion = request.getParameter("accion") != null ? request.getParameter("accion"): "";
if(!nombre.equals(""))
{
	nombre = nombre.split("-")[1];
}
String resp="";
if(tipo.equals("ASIGNADA"))
{
	resp = actualiza.cambiaEstatusAsignada(accion, folioplex, foliopisa, expediente, nombre, estado, lbr);
}
else if(tipo.equals("DESPACHADA"))
{
	resp = actualiza.cambiaEstatusdespachada(folioplex, foliopisa, estado, lbr);
}
else if(tipo.equals("COMPLETE"))
{
	resp= actualiza.cambiaEstatusLiquidada(folioplex, foliopisa, estado, lbr);
}
%>

<%=resp%>