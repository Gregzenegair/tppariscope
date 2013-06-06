<%-- 
    Document   : _artistes
    Created on : 6 juin 2013, 15:33:35
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
    String nomArtiste = "";
    String prenom = "";
    String instrument = "";
    String sValue = "insertElement";
    String sBoutonValue = "Insérer Artiste";
    int idArtiste = 0;
    if (request.getAttribute("rsElement") != null) {
        actionTitre = "Modifier";
        ResultSet rsArtisteModif = (ResultSet) request.getAttribute("rsElement");
        rsArtisteModif.next();
        nomArtiste = rsArtisteModif.getString(2);
        prenom = rsArtisteModif.getString(3);
        instrument = rsArtisteModif.getString(4);
        sValue = "updateElement";
        sBoutonValue = "Modifier Artiste";
        idArtiste = rsArtisteModif.getInt(1);
    }
%>

<h1><%=actionTitre%> un Artiste</h1>
<article id="formulaire">
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_artistes"/>
        <input type="hidden" name="action" value="<%=sValue%>"/>
        <input type="hidden" name="id" value="<%=idArtiste%>"/>
        Nom : <input type="text" name="nomArtiste" value="<%=nomArtiste%>"/><br/>
        Prénom : <input type="text" name="prenom" value="<%=prenom%>"/><br/>
        Instrument : <input type="text" name="instrument" value="<%=instrument%>"/><br/>
        <input type="submit" value="<%=sBoutonValue%>"/>
    </form>
    <%
        if (request.getAttribute("rsElement") != null) {
    %>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_artistes"/>
        <input type="submit" value="Annuler"/>
    </form>
    <%        }
    %>
</article>

<table>
    <tr>
        <td>Nom</td>
        <td>Prénom</td>
        <td>Instrument</td>
        <td>Modifier</td>
        <td>Supprimer</td>
    </tr>
    <%ResultSet rsArtiste = (ResultSet) request.getAttribute("rsArtiste");
        String fragment = "_artistes";
        while (rsArtiste.next()) {

            out.print("<tr>");
            for (int i = 2; i <= 4; i++) {
                out.print("<td>");
                out.print(rsArtiste.getObject(i).toString());
                out.print("</td>");
            }
            out.print("<td><form action=\"/tppariscope/ControleurBackOffElements?id=" + rsArtiste.getInt(1) + "\" method=\"post\">"
                    + "<input type=\"hidden\" name=\"fragment\" value=\"" + fragment + "\"/>"
                    + "<input type=\"hidden\" name=\"table\" value=\"artistes\"/>"
                    + "<input type=\"hidden\" name=\"action\" value=\"modifElement\"/>"
                    + "<input type=\"submit\" value=\"Modifier\"/></form></td>");
            out.print("<td><form action=\"/tppariscope/ControleurBackOffElements?id=" + rsArtiste.getInt(1) + "\" method=\"post\">"
                    + "<input type=\"hidden\" name=\"action\" value=\"suppElement\"/>"
                    + "<input type=\"hidden\" name=\"table\" value=\"artistes\"/>"
                    + "<input type=\"hidden\" name=\"fragment\" value=\"" + fragment + "\"/>"
                    + "<input type=\"submit\" value=\"Supprimer\"/></form></td>");
            out.print("</tr>");
        }
    %>
</table>