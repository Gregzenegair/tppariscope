<%-- 
    Document   : _artistes
    Created on : 6 juin 2013, 15:33:35
    Author     : Cyrius
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getAttribute("suppOK") != null) {
        out.print(request.getAttribute("suppOK").toString());
    }
%>
<article>
    <h1>Ajouter un Artiste</h1>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="action" value="insertElement"/>
        Nom : <input type="text" name="nomArtiste" /><br/>
        Prénom : <input type="text" name="prenom" /><br/>
        Instrument : <input type="text" name="instrument" /><br/>
        <input type="submit" value="Insérer Artiste"/>
    </form>
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
                    + "<input type=\"hidden\" name=\"page\" value=\"modifElement\"/>"
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