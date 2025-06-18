<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<div id="general">
<head>
</head>
<xsl:for-each select="CSOrden">
<div>
<table style="height: 170px; width: 100%; border-collapse: collapse;" height="150" border="0">
<tbody>
<tr style="height: 170px;">
<td style="width: 15%; height: 170px;"><img src="http://localhost:8080/CoolService_Security_WEB/xsl/coolservicelogo_trans1.png" alt="" width="100%" height="100%"></img></td>
<td style="width: 45%; height: 170px;">
<table style="height: 100px; width: 100%; border-collapse: collapse;" border="0">
<tbody>
<tr style="height: 15px;">
<td style="width: 100%; height: 15px; text-align: center;"><span style="font-size: 12px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: #696969;">TEL. OFICINA: 379-14-34</span></strong></span></span></td>
</tr>
<tr style="height: 15px;">
<td style="width: 100%; height: 15px; text-align: center;"><span style="font-size: 12px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: #696969;">CEL. 664 375-44-16</span></strong></span></span></td>
</tr>
<tr style="height: 15px;">
<td style="width: 100%; height: 15px; text-align: center;"><span style="font-size: 12px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: #696969;">NEXTEL: 42*15*217482</span></strong></span></span></td>
</tr>
<tr style="height: 15px;">
<td style="width: 100%; height: 15px; text-align: center;"><span style="font-size: 12px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: #696969;">E-MAIL: Bentor_87@hotmail.com</span></strong></span></span></td>
</tr>
<tr style="height: 15px;">
<td style="width: 100%; height: 15px; text-align: center;"><span style="font-size: 12px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: #696969;">AV. SAN CRISTOBAL #12556-4</span></strong></span></span></td>
</tr>
<tr style="height: 15px;">
<td style="width: 100%; height: 15px; text-align: center;"><span style="font-size: 12px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: #696969;">LOMAS DE SAN MARTIN</span></strong></span></span></td>
</tr>
<tr style="height: 15px;">
<td style="width: 100%; height: 15px; text-align: center;"><span style="font-size: 12px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: #696969;">TIJUANA, B.C.</span></strong></span></span></td>
</tr>
</tbody>
</table>
</td>
<td style="width: 40%; height: 170px;">
<table style="height: 133px; width: 100%; border-collapse: collapse;" border="1" bordercolor="gray">
<tbody>
<tr style="height: 50px;">
<td style="width: 100%; text-align: center; height: 43px;"><span style="font-size: 14px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>ORDEN/REPORTE DE SERVICIO</strong></span></span></span></td>
</tr>
<tr style="height: 90px;">
<td style="width: 100%; text-align: center; height: 90px;">
<table style="width: 100%; border-collapse: collapse;" border="0">
<xsl:if test="tipoOrden ='1'">
<tbody>
<tr>
<td style="width: 100%; text-align: center; height: 43px;"><span style="font-size: 12px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>MANTENIMIENTO CORRECTIVO</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 100%; height: 30px; text-align: center;"><span style="font-size: 10px; background-color: #808080;"><span style="color: #ffffff;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>ORDEN DE SERVICIO:	</strong></span></span></span><span style="font-size: 10px;"><span style="color: #ffffff;"><span style="font-family: tahoma, geneva, sans-serif; background-color: #808080;"><xsl:value-of select="folioOrden"/></span></span></span></td>
</tr>
</tbody>
</xsl:if>
<xsl:if test="tipoOrden ='2'">
<tbody>
<tr>
<td style="width: 100%; text-align: center; height: 43px;"><span style="font-size: 12px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>MANTENIMIENTO PREVENTIVO</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 100%; height: 30px; text-align: center;"><span style="font-size: 10px; background-color: #808080;"><span style="color: #ffffff;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>ORDEN DE SERVICIO:	</strong></span></span></span><span style="font-size: 10px; background-color: #808080;"><span style="color: #ffffff;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="folioOrden"/></span></span></span></td>
</tr>
</tbody>
</xsl:if>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</xsl:for-each>
<xsl:for-each select="CSOrden">
<div style="margin:30px auto;">
<table style="border-collapse: collapse; width: 100%;" height="150" border="1" bordercolor="gray">
<tbody>
<tr>
<td style="width: 16.6667%;">
<table style="width: 100%; height: 100%;">
<tbody>
<tr>
<td style="width: 100%; height: 30%; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Fecha de Cita:</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 135px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="fechaCita"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
<td style="width: 16.6667%;">
<table style="width: 100%; height: 100%;">
<tbody>
<tr>
<td style="width: 100%; height: 30%; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Hora de Cita:</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 135px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="horaCita"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
<td style="width: 16.6667%;">
<table style="width: 100%; height: 100%;">
<tbody>
<tr>
<td style="width: 100%; height: 30%; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Fecha:</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 135px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="fecha"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
<td style="width: 16.6667%;">
<table style="width: 100%; height: 100%;">
<tbody>
<tr>
<td style="width: 100%; height: 30%; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Hora de Reporte:</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 135px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="horaReporte"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
<td style="width: 16.6667%;">
<table style="width: 100%; height: 100%;">
<tbody>
<tr>
<td style="width: 100%; height: 30%; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Hora de Entrada:</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 135px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="horaEntrada"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
<td style="width: 16.6667%;">
<table style="width: 100%; height: 100%;">
<tbody>
<tr>
<td style="width: 100%; height: 30%; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Hora de Salida:</strong></span></span></span></td>
</tr>
<tr>
<td style="width: 135px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="horaSalida"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</xsl:for-each>
<xsl:for-each select="CSOrden">
<div>
<table style="border-collapse: collapse; width: 100%;" border="1" bordercolor="gray">
<tbody>
<tr style="height: 30px;">
<td style="width: 100%; height: 30px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Cliente:	</strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="empresa"/></span></span></span></td>
</tr>
<tr style="height: 30px;">
<td style="width: 100%; height: 30px;">
<table style="border-collapse: collapse; width: 100%; height: 30px;" border="0">
<tbody>
<tr>
<td style="width: 50%; height: 30px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Direccion:	</strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="direccion"/></span></span></span></td>
<td style="width: 50%; height: 30px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Ciudad:	</strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="ciudad"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style="height: 30px;">
<td style="width: 100%; height: 30px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Sucursal:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="sucursal"/></span></span></span></td>
</tr>
<tr style="height: 30px;">
<td style="width: 100%; height: 30px;">
<table style="border-collapse: collapse; width: 100%; height: 30px;" border="0">
<tbody>
<tr>
<td style="width: 50%; height: 30px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Marca:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="marca"/></span></span></span></td>
<td style="width: 50%; height: 30px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong># Serie:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="serie"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style="height: 30px;">
<td style="width: 100%; height: 30px;">
<table style="border-collapse: collapse; width: 100%; height: 30px;" border="0">
<tbody>
<tr>
<td style="width: 33.3333%; height: 30px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Modelo:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="modelo"/></span></span></span></td>
<td style="width: 33.3333%; height: 30px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Voltaje:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="voltaje"/></span></span></span></td>
<td style="width: 33.3333%; height: 30px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Amperes:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="amperes"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style="height: 90px;">
<td style="width: 100%; height: 90px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Razon del Servicio:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="razonServicio"/></span></span></span></td>
</tr>
<tr style="height: 90px;">
<td style="width: 100%; height: 90px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Servicio Realizado:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="servicioRealizado"/></span></span></span></td>
</tr>
<tr style="height: 90px;">
<td style="width: 100%; height: 90px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Comentarios:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="comentarios"/></span></span></span></td>
</tr>
<tr style="height: 30px;">
<td style="width: 100%; height: 30px;">
<table style="border-collapse: collapse; width: 100%; height: 30px;" border="0">
<tbody>
<tr>
<td style="width: 33.3333%; height: 30px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Condiciones de Operacion (psi):</strong></span></span></span></td>
<td style="width: 33.3333%; height: 30px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="conOpeAmp1"/></span></span></span></td>
<td style="width: 33.3333%; height: 30px; text-align: center;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="conOpeAmp2"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style="height: 30px;" border="0">
<td style="width: 100%; height: 30px;">
<table style="border-collapse: collapse; width: 100%; height: 30px;" border="0">
<tbody>
<tr>
<td style="width: 33.3333%; height: 30px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Temperatura de Operacion:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="conOpeTemp"/></span></span></span></td>
<td style="width: 33.3333%; height: 30px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Voltaje:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="conOpeVolt"/></span></span></span></td>
<td style="width: 33.3333%; height: 30px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Amperes:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="conOpeAmp"/></span></span></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style="height: 150px;">
<td style="width: 100%; height: 150px;">
<table style="border-collapse: collapse; width: 100%;" border="0">
<tbody>
<tr style="height: 150px;">
<td style="width: 50%; height: 150px; padding-left: 5px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Tecnico en Servicio:   </strong></span></span></span><span style="font-size: 10px; padding-left: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><xsl:value-of select="usuario"/></span></span></span></td>
<td style="width: 50%; height: 150px;"><span style="font-size: 10px;"><span style="color: #696969;"><span style="font-family: tahoma, geneva, sans-serif;"><strong>Recibido por:   </strong></span></span></span><span style=" padding-left: 25px;"><img height="50px" width="auto">
<xsl:attribute name="src">
        <xsl:value-of select="firmaElectronica"/>
    </xsl:attribute>

</img></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</xsl:for-each>
</div>
</html>
</xsl:template>
</xsl:stylesheet>