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
                out.print("<a href='" + lsTri + "&tri=desc&colonne=categorie'>v</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=titre'>v</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=date_concert'>v</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=lieu'>v</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=desc&colonne=prix'>v</a>");
                out.print("</td>");
            } else {
                out.print("<td>");
                //td vide
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=categorie'>^</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=titre'>^</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=date_concert'>^</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=lieu'>^</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href='" + lsTri + "&tri=asc&colonne=prix'>^</a>");
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
                out.print(lrs.getString(5));
                out.print("</td>");

                out.print("<td>");
                out.print(lrs.getString(6));
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
