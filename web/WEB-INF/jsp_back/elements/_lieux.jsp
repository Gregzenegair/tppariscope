<%-- 
    Document   : _lieux
    Created on : 6 juin 2013, 15:32:49
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
    <h1>Ajouter un lieu</h1>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="action" value="insertElement"/>
        Nom : <input type="text" name="nomLieu" /><br/>
        Adresse : <input type="text" name="adresse" /><br/>
        <input type="submit" value="Insérer Lieu"/>
    </form>
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
                    + "<input type=\"hidden\" name=\"adresse\" value=\""+rsLieu.getString(2)+"\"/>"
                    + "<input type=\"hidden\" name=\"nom\" value=\""+rsLieu.getString(3)+"\"/>"
                     + "<input type=\"hidden\" name=\"fragment\" value=\"modifElement\"/>"
                    + "<input type=\"hidden\" name=\"page\" value=\"modifElement\"/>"
                    + "<input type=\"submit\" value=\"Modifier\"/></form></td>");
            out.print("<td><form action=\"/tppariscope/ControleurBackOffElements?id=" + rsLieu.getInt(1) + "\" method=\"post\">"
                    + "<input type=\"hidden\" name=\"action\" value=\"suppElement\"/>"
                    + "<input type=\"hidden\" name=\"table\" value=\"lieux\"/>"
                    + "<input type=\"hidden\" name=\"fragment\" value=\"" + fragment + "\"/>"
                    + "<input type=\"submit\" value=\"Supprimer\"/></form></td>");
            out.print("</tr>");
        }
    %>
</table>


