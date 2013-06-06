<%-- 
    Document   : _categories
    Created on : 6 juin 2013, 15:33:49
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

    String categorie = "";
    String sValue = "insertElement";
    String sBoutonValue = "Insérer Catégorie";
    int idCategorie = 0;
    if (request.getAttribute("rsElement") != null) {
        actionTitre = "Modifier";
        ResultSet rsCategorieModif = (ResultSet) request.getAttribute("rsElement");
        rsCategorieModif.next();
        categorie = rsCategorieModif.getString(2);
        sValue = "updateElement";
        sBoutonValue = "Modifier Categorie";
        idCategorie = rsCategorieModif.getInt(1);
    }
%>
<h1><%=actionTitre%> une Catégorie</h1>
<article id="formulaire">
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_categories"/>
        <input type="hidden" name="action" value="<%=sValue%>"/>
        <input type="hidden" name="id" value="<%=idCategorie%>"/>
        Catégorie : <input type="text" name="categorie" value="<%=categorie%>"/><br/>
        <input type="submit" value="<%=sBoutonValue%>"/>
    </form>
    <%
        if (request.getAttribute("rsElement") != null) {
    %>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_categories"/>
        <input type="submit" value="Annuler"/>
    </form>
    <%        }
    %>
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
                    + "<input type=\"hidden\" name=\"fragment\" value=\"" + fragment + "\"/>"
                    + "<input type=\"hidden\" name=\"table\" value=\"categories\"/>"
                    + "<input type=\"hidden\" name=\"action\" value=\"modifElement\"/>"
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