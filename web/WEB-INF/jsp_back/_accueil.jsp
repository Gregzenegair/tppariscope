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
        String lsTri = lsContexte + "/ControleurBackOff?action=_accueil";
        String lsURL = lsContexte + "/ControleurBackOff?action=_inserer&id=";
        String lsSupp = lsContexte + "/ControleurBackOff?action=_supprimer&id=";
        String tri = "";

        if (request.getAttribute("tri") != null) {
            tri = request.getAttribute("tri").toString();
        }

        if (request.getAttribute("resultset") != null) {
            ResultSet lrs = (ResultSet) request.getAttribute("resultset");


            out.print("<table>");
            out.print("<tr>");


            if (tri.equals("asc")) {

                out.print("<td>");
                //td vide
                out.print("</td>");

                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=categorie'>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=titre'>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=date_concert'>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=li.nom'>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=prix'>a -> z</a>");
                out.print("</td>");
            } else {
                out.print("<td>");
                //td vide
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=categorie''>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=titre''>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=date_concert''>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=li.nom''>a -> z</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=prix''>a -> z</a>");
                out.print("</td>");
            }

            out.print("</tr>");

            while (lrs.next()) {
                out.print("<tr>");
                out.print("<td>");
                out.print("<a href='" + lsURL);
                out.print(lrs.getString(7));
                out.print("'>Modifier</a>");
                out.print("</td>");

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
                out.print(lrs.getString(9));
                out.print("</td>");

                out.print("<td>");
                out.print(lrs.getString(6));
                out.print("</td>");

                out.print("<td>");
                out.print("<a href='" + lsSupp);
                out.print(lrs.getString(7));
                if (lrs.getInt(8)!=0) {
                    out.print("'>Suppression Demandée</a>");
                } else {
                    out.print("'>Demande de Suppression</a>");
                }
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
