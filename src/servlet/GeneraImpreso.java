package servlet;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.xhtmlrenderer.pdf.ITextRenderer;
import org.xhtmlrenderer.resource.FSEntityResolver;
import org.xml.sax.SAXException;


//import com.itextpdf.text.DocumentException;

import bean.Conexion;
import bean.XPathUtils;


public class GeneraImpreso extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATA = "CSOrden";
    private static final String BASE_XPATH = "/CSOrden";

    
    String sourceImg = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String htmlGen = "";
        String idOrden = request.getParameter("idOrden") != null ? request.getParameter("idOrden") : "";
        String folioOrden = request.getParameter("folioOrden") != null ? request.getParameter("folioOrden") : "";
        String nombrePDF = "Impreso_Orden_" + folioOrden;

        htmlGen = obtieneXMLOrden(request, idOrden);

        response.setHeader("Cache-Control", "no-cache");

        String html = htmlGen
                .replaceAll("<META http-equiv=\\\"Content-Type\\\" content=\\\"text/html; charset=UTF-8\\\">",
                        "<META http-equiv=\\\"Content-Type\\\" content=\\\"text/html; charset=UTF-8\\\"/>")
                .replaceAll(
                        "<img height=\\\"100%\\\" width=\\\"100%\\\" alt=\\\"\\\" src=\\\"http://localhost:8080/CoolService_Security_WEB/xsl/coolservicelogo_trans1.png\\\">",
                        "<img height=\\\"100%\\\" width=\\\"100%\\\" alt=\\\"\\\" src=\\\"http://localhost:8080/CoolService_Security_WEB/xsl/coolservicelogo_trans1.png\\\"/>");

        if (sourceImg == null || "".equals(sourceImg.trim()) || "null".equals(sourceImg.trim())) {
            html = html.replaceAll("<img width=\\\"auto\\\" height=\\\"50px\\\" src=\\\"\\\">",
                    "<img id=\\\"firma\\\" width=\\\"auto\\\" height=\\\"50px\\\" src=\\\"data:" + sourceImg + "\\\"/>");
        } else {
            html = html.replace("<img width=\"auto\" height=\"50px\" src=\"" + sourceImg + "\">",
                    "<img id=\"firma\" width=\"auto\" height=\"50px\" src=\"data:" + sourceImg + "\"/>");
        }

        System.err.println(html);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + nombrePDF);
        response.setHeader("Cache-Control", "no-cache");

        OutputStream os = response.getOutputStream();

        try {
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            DocumentBuilder builder = builderFactory.newDocumentBuilder();
            builder.setEntityResolver(FSEntityResolver.instance());
            org.w3c.dom.Document document = builder.parse(new ByteArrayInputStream(html.getBytes()));

            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocument(document, null);
            renderer.layout();
            renderer.createPDF(os, true);
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } /*catch (DocumentException e) {
            e.printStackTrace();
        }*/

        os.flush();
        os.close();
    }

    private String obtieneXMLOrden(HttpServletRequest request, String idOrden) {
        String xml = "";
        PreparedStatement ps = null;
        Conexion conexion = Conexion.instance();
        ResultSet rs = null;
        Connection conn = null;
        Document doc = null;
        String html = "";

        try {
            conn = conexion.getConnection();

            if (conn != null) {
                doc = DocumentHelper.createDocument(DocumentHelper.createElement(DATA));

                StringBuffer query = new StringBuffer(
                        "select IdTipoOrden, FechaCita, substr(HoraCita,1,8) as HoraCita, "
                                + "substr(FHRegistro,1,19) as FechaRegistro, substr(HoraReporte,1,8) as HoraReporte, "
                                + "concat(FechaEntrada,' ',substr(HoraEntrada,1,8)) as HoraEntrada, "
                                + "concat(FechaSalida,' ',substr(HoraSalida,1,8)) as HoraSalida, "
                                + "(select concat(NombreEmpresa,' (',NombreCortoEmpresa,')') from coolservicedb.csempresas where idCSEmpresas=IdEmpresa) as empresa, "
                                + "(select NombreSucursal from coolservicedb.cssucursales where idCSSucursales=IdSucursal) as sucursal, "
                                + "(select domicilio from coolservicedb.cssucursales where idCSSucursales=IdSucursal) as direccion, "
                                + "(select ciudad from coolservicedb.cssucursales where idCSSucursales=IdSucursal) as ciudad, "
                                + "MarcaEquipo, NumeroSerieEquipo, ModeloEquipo, VoltajeEquipo, AmperesEquipo, "
                                + "RazonServicio, ServicioRealizado, ComentariosTecnico, "
                                + "concat(CondOperaAmperes1,'   psi') as CondOperaAmperes1, "
                                + "concat(CondOperaAmperes2,'   psi') as CondOperaAmperes2, "
                                + "concat(CondOperaTemperatura,'   ',UnidadTemperatura) as CondOperaTemperatura, "
                                + "CondOperaAmperes, CondOperaVoltaje, "
                                + "(select NombreUsuario from coolservicedb.csusuarios where cveCSUsuarios=CveTecnicoAsignado) as usuario, "
                                + "FolioOrden, RecibidoPorNombre, FirmaElectronica "
                                + "from coolservicedb.csorden where idCSOrden=?");

                ps = conn.prepareStatement(query.toString());
                ps.setInt(1, Integer.parseInt(idOrden));
                rs = ps.executeQuery();

                if (rs.next()) {
                    addElementToParent(doc, prependBase("/tipoOrden"), rs.getString("IdTipoOrden"));
                    addElementToParent(doc, prependBase("/fechaCita"), rs.getString("FechaCita"));
                    addElementToParent(doc, prependBase("/horaCita"), rs.getString("HoraCita"));
                    addElementToParent(doc, prependBase("/fecha"), rs.getString("FechaRegistro"));
                    addElementToParent(doc, prependBase("/horaReporte"), rs.getString("HoraReporte"));
                    addElementToParent(doc, prependBase("/horaEntrada"), rs.getString("HoraEntrada"));
                    addElementToParent(doc, prependBase("/horaSalida"), rs.getString("HoraSalida"));
                    addElementToParent(doc, prependBase("/empresa"), rs.getString("empresa"));
                    addElementToParent(doc, prependBase("/sucursal"), rs.getString("sucursal"));
                    addElementToParent(doc, prependBase("/direccion"), rs.getString("direccion"));
                    addElementToParent(doc, prependBase("/ciudad"), rs.getString("ciudad"));
                    addElementToParent(doc, prependBase("/marca"), rs.getString("MarcaEquipo"));
                    addElementToParent(doc, prependBase("/serie"), rs.getString("NumeroSerieEquipo"));
                    addElementToParent(doc, prependBase("/modelo"), rs.getString("ModeloEquipo"));
                    addElementToParent(doc, prependBase("/voltaje"), rs.getString("VoltajeEquipo"));
                    addElementToParent(doc, prependBase("/amperes"), rs.getString("AmperesEquipo"));
                    addElementToParent(doc, prependBase("/razonServicio"), rs.getString("RazonServicio"));
                    addElementToParent(doc, prependBase("/servicioRealizado"), rs.getString("ServicioRealizado"));
                    addElementToParent(doc, prependBase("/comentarios"), rs.getString("ComentariosTecnico"));
                    addElementToParent(doc, prependBase("/conOpeAmp1"), rs.getString("CondOperaAmperes1"));
                    addElementToParent(doc, prependBase("/conOpeAmp2"), rs.getString("CondOperaAmperes2"));
                    addElementToParent(doc, prependBase("/conOpeTemp"), rs.getString("CondOperaTemperatura"));
                    addElementToParent(doc, prependBase("/conOpeAmp"), rs.getString("CondOperaAmperes"));
                    addElementToParent(doc, prependBase("/conOpeVolt"), rs.getString("CondOperaVoltaje"));
                    addElementToParent(doc, prependBase("/usuario"), rs.getString("usuario"));
                    addElementToParent(doc, prependBase("/folioOrden"), rs.getString("FolioOrden"));
                    addElementToParent(doc, prependBase("/recibidoPorNombre"), rs.getString("RecibidoPorNombre"));
                    addElementToParent(doc, prependBase("/firmaElectronica"), rs.getString("FirmaElectronica"));
                    sourceImg = rs.getString("FirmaElectronica");
                }

                xml = printDoc(doc);
                html = xmlToHTML(request, xml);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                rs = null;
            }
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception e) {
                ps = null;
            }
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception e) {
                conn = null;
            }
        }

        return html;
    }

    private String xmlToHTML(HttpServletRequest request, String xml) {
        Source xmlSource = null;
        Source xslSource = null;
        String html = "";
        String xsl = "xsl/ImpresionCS.xsl";

        try {
            xmlSource = new StreamSource(new StringReader(xml));
            xslSource = new StreamSource(
                    new File(String.valueOf(request.getSession().getServletContext().getRealPath("/")) + xsl));
            html = convertXMLToHTML(xmlSource, xslSource);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return html;
    }

    public String convertXMLToHTML(Source xmlSource, Source xslSource) throws IOException {
        StringWriter writer = new StringWriter();

        try {
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(xslSource);
            transformer.transform(xmlSource, new StreamResult(writer));
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerFactoryConfigurationError e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        }

        return writer.toString();
    }

    private Node addElementToParent(Document doc, String xpath, String value) {
        String childElementName = XPathUtils.getChildElementName(xpath);
        String parentXPath = XPathUtils.getParentXPath(xpath);
        Node parentNode = doc.selectSingleNode(parentXPath);

        if (parentNode == null) {
            parentNode = addElementToParent(doc, parentXPath, null);
        }

        Integer childIndex = XPathUtils.getChildElementIndex(xpath);
        if (childIndex.intValue() > 1) {
            java.util.List<?> nodes = doc.selectNodes(XPathUtils.createPositionXpath(xpath, childIndex));
            int nodesToCreate = childIndex.intValue() - nodes.size() - 1;
            for (int i = 0; i < nodesToCreate; i++) {
                ((Element) parentNode).addElement(childElementName);
            }
        }

        Element child = ((Element) parentNode).addElement(childElementName);
        if (value != null) {
            child.addCDATA(value);
        }

        return child;
    }

    private String prependBase(String xpath) {
        return BASE_XPATH + xpath;
    }

    private String printDoc(Document doc) {
        String xml = "";
        OutputFormat format = OutputFormat.createPrettyPrint();
        format.setEncoding("ISO-8859-1");
        StringWriter writer = new StringWriter();

        try {
            XMLWriter xmlWriter = new XMLWriter(writer, format);
            xmlWriter.write(doc);
            xml = writer.getBuffer().toString().trim();
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }

        return xml;
    }
}
