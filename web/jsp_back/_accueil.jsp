<%-- 
    Document   : _accueil
    Created on : 4 juin 2013, 13:38:26
    Author     : Cyrius
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<article>
    BIENVENUE  sur le back off de pariscope
    <br>
    <%
        String lsContexte = request.getContextPath();
        String lsURL = lsContexte + "/ControleurBackOff?action=_inserer&id=";

        if (request.getAttribute("resultset") != null) {
            ResultSet lrs = (ResultSet) request.getAttribute("resultset");

            out.print("<table>");


            while (lrs.next()) {
                out.print("<tr>");
                out.print("<td>");
                out.print("<a href='" + lsURL);
                out.print(lrs.getString(1));
                out.print("'>Modifier</a>");
                out.print("</td>");

                out.print("<td>");
                out.print(lrs.getString(4));
                out.print("</td>");

                out.print("<td>");
                out.print(lrs.getString(5));
                out.print("</td>");

                out.print("<td>");
                out.print(lrs.getString(6));
                out.print("</td>");

                out.print("<td>");
                out.print(lrs.getString(7));
                out.print("</td>");
                out.print("</tr>");
            }



            out.print("</table>");

        } else {
            out.print("erreur attribut resulset inexistant");
        }
    %>
<br>
</article>
