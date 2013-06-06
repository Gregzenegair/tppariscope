<%-- 
    Document   : _modifRedac
    Created on : 5 juin 2013, 12:34:36
    Author     : Cyrius
--%>

<%@page import="java.sql.ResultSet"%>

<%
    ResultSet rsUtilisateurs = (ResultSet) request.getAttribute("tout_utilisateurs");

    if (request.getAttribute("suppOK") != null) {
        out.print(request.getAttribute("suppOK"));
    }
     if (request.getAttribute("updateOK") != null) {
        out.print(request.getAttribute("updateOK"));
    }
%>

<article>
    <h1>Modifier Rédacteur</h1>
    <table>
        <tr>
            <td>Id Utilisateur</td>
            <td>Login</td>
            <td>Mot de passe</td>
            <td>Administrateur</td>
            <td>Modifier</td>
            <td>Supprimer</td>
        </tr>
        <%
            while (rsUtilisateurs.next()) {
                out.print("<tr>");
                for (int i = 1; i <= 4; i++) {
                    out.print("<td>");
                    out.print(rsUtilisateurs.getObject(i).toString());
                    out.print("</td>");
                }
                out.print("<td><form action=\"/tppariscope/ControleurAdmin?id="+rsUtilisateurs.getInt(1)+"\" method=\"post\"><input type=\"hidden\" name=\"page\" value=\"_modifUnRedac\"/><input type=\"submit\" value=\"Modifier\"/></form></td>");
                out.print("<td><form action=\"/tppariscope/ControleurAdmin?name="+rsUtilisateurs.getString(2)+"\" method=\"post\"><input type=\"hidden\" name=\"action\" value=\"suppUtilisateur\"/><input type=\"submit\" value=\"Supprimer\"/></form></td>");
                out.print("</tr>");
            }
        %>
    </table>
</article>