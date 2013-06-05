<%-- 
    Document   : _validerSupp
    Created on : 5 juin 2013, 12:35:26
    Author     : Cyrius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<article>
    <h1>Valider demande de suppression</h1>
    <br> 
    <%
        String lsContexte = request.getContextPath();
        String lsSupp = lsContexte + "/ControleurAdmin?action=supprimerValider&id=";
        String lsAnn = lsContexte + "/ControleurAdmin?action=supprimerAnnuler&id=";

        if (request.getAttribute("resultset") != null) {
            ResultSet lrs = (ResultSet) request.getAttribute("resultset");


            out.print("<table>");

            while (lrs.next()) {
                out.print("<tr>");

                out.print("<td>");
                out.print(lrs.getString(2));
                out.print("</td>");

                out.print("<td>");
                out.print(lrs.getString(3));
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
                out.print("<a href='" + lsSupp);
                out.print(lrs.getString(7));
                out.print("'>Supprimer</a>");
                out.print("</td>");
                
                out.print("<td>");
                out.print("<a href='" + lsAnn);
                out.print(lrs.getString(7));
                out.print("'>Annuler la demande</a>");
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
