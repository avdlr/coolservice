<%@page import="org.json.JSONObject" %>
<%@page import="org.json.JSONArray" %>
<%@page import="bean.GestionTareasReabrirIncidencia" %>
<%@ page language="java" contentType="application/json; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
        String orden = request.getParameter("orden");
        String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario") : "";
        String estatus = request.getParameter("estatus");
        String actualestatus = request.getParameter("actualestatus") != null ? request.getParameter("actualestatus") : "";
        String idaccion = request.getParameter("idaccion");

        JSONArray respuesta = new JSONArray();

        try {
                if (orden == null || orden.trim().isEmpty()) {
                        JSONObject error = new JSONObject();
                        error.put("resp", "ERROR");
                        error.put("mensaje", "Identificador de orden no proporcionado.");
                        respuesta.put(error);
                } else {
                        if (estatus == null || estatus.trim().isEmpty()) {
                                estatus = "2";
                        }
                        if (idaccion == null || idaccion.trim().isEmpty()) {
                                idaccion = "REANUDAR";
                        }

                        GestionTareasReabrirIncidencia gestion = new GestionTareasReabrirIncidencia();
                        respuesta = gestion.reanudarTarea(orden, estatus);
                }
        } catch (Exception ex) {
                JSONObject error = new JSONObject();
                error.put("resp", "ERROR");
                error.put("mensaje", ex.getMessage() != null ? ex.getMessage() : "Error al reabrir la incidencia.");
                respuesta = new JSONArray();
                respuesta.put(error);
        }

        out.print(respuesta.toString());
%>
