<%-- 
    Document   : _categories
    Created on : 6 juin 2013, 15:33:49
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
    <h1>Ajouter une Catégorie</h1>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="action" value="insertElement"/>
        Catégorie : <input type="text" name="categorie" /><br/>
        <input type="submit" value="Insérer Catégorie"/>
    </form>
</article>

<table>
    <tr>
        <td>Catégorie</td>
        <td>Modifier</td>
        <td>Supprimer</td>
    </tr>
    <%ResultSet rsCategorie = (ResultSet) request.getAttribute("rsCategorie");
        String fragment = "_categories";
        while (rsCategorie.next()) {

            out.print("<tr>");
            for (int i = 2; i < 3; i++) {
                out.print("<td>");
                out.print(rsCategorie.getObject(i).toString());
                out.print("</td>");
            }
            out.print("<td><form action=\"/tppariscope/ControleurBackOffElements?id=" + rsCategorie.getInt(1) + "\" method=\"post\">"
                    + "<input type=\"hidden\" name=\"page\" value=\"modifElement\"/>"
                    + "<input type=\"submit\" value=\"Modifier\"/></form></td>");
            out.print("<td><form action=\"/tppariscope/ControleurBackOffElements?id=" + rsCategorie.getInt(1) + "\" method=\"post\">"
                    + "<input type=\"hidden\" name=\"action\" value=\"suppElement\"/>"
                    + "<input type=\"hidden\" name=\"table\" value=\"categories\"/>"
                    + "<input type=\"hidden\" name=\"fragment\" value=\"" + fragment + "\"/>"
                    + "<input type=\"submit\" value=\"Supprimer\"/></form></td>");
            out.print("</tr>");
        }
    %>
</table>