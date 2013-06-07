<%-- 
    Document   : _lieux
    Created on : 6 juin 2013, 15:32:49
    Author     : Cyrius
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String actionTitre = "Ajouter";
    if (request.getAttribute("suppOK") != null) {
        actionTitre = "Supprimer";
        out.print(request.getAttribute("suppOK").toString());
    }
    String adresseLieu = "";
    String nomLieu = "";
    String sValue = "insertElement";
    String sBoutonValue = "Insérer Lieu";
    int idLieu = 0;
    if (request.getAttribute("rsElement") != null) {
        actionTitre = "Modifier";
        ResultSet rsLieuModif = (ResultSet) request.getAttribute("rsElement");
        rsLieuModif.next();
        nomLieu = rsLieuModif.getString(3);
        adresseLieu = rsLieuModif.getString(2);
        sValue = "updateElement";
        sBoutonValue = "Modifier Lieu";
        idLieu = rsLieuModif.getInt(1);
    }

%>
<h1><%=actionTitre%> un lieu</h1>
<article id="formulaire">
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_lieux"/>
        <input type="hidden" name="action" value="<%=sValue%>"/>
        <input type="hidden" name="id" value="<%=idLieu%>"/>
        Nom : <input type="text" name="nomLieu" value="<%=nomLieu%>"/><br/>
        Adresse : <input type="text" name="adresse" value="<%=adresseLieu%>"/><br/>
        <input type="submit" value="<%=sBoutonValue%>"/>
    </form>
    <%
        if (request.getAttribute("rsElement") != null) {
    %>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_lieux"/>
        <input type="submit" value="Annuler"/>
    </form>
    <%        }
    %>
</article>


<table>
    <tr>
        <td>Adresse</td>
        <td>Nom</td>
        <td>Modifier</td>
        <td>Supprimer</td>
    </tr>
    <%ResultSet rsLieu = (ResultSet) request.getAttribute("rsLieux");
        String fragment = "_lieux";
        while (rsLieu.next()) {

            out.print("<tr>");
            for (int i = 2; i <= 3; i++) {
                out.print("<td>");
                out.print(rsLieu.getObject(i).toString());
                out.print("</td>");
            }
            out.print("<td><form action=\"/tppariscope/ControleurBackOffElements?id=" + rsLieu.getInt(1) + "\" method=\"post\">"
                    + "<input type=\"hidden\" name=\"fragment\" value=\"" + fragment + "\"/>"
                    + "<input type=\"hidden\" name=\"table\" value=\"lieux\"/>"
                    + "<input type=\"hidden\" name=\"action\" value=\"modifElement\"/>"
                    + "<input type=\"submit\" value=\"Modifier\"/></form></td>");
            out.print("<td><form action=\"/tppariscope/ControleurBackOffElements?id=" + rsLieu.getInt(1) + "\" method=\"post\">"
                    + "<input type=\"hidden\" name=\"action\" value=\"suppElement\"/>"
                    + "<input type=\"hidden\" name=\"nom\" value=\""+rsLieu.getString(3)+"\"/>"
                    + "<input type=\"hidden\" name=\"table\" value=\"lieux\"/>"
                    + "<input type=\"hidden\" name=\"fragment\" value=\"" + fragment + "\"/>"
                    + "<input type=\"submit\" value=\"Supprimer\"/></form></td>");
            out.print("</tr>");
        }
    %>
</table>


