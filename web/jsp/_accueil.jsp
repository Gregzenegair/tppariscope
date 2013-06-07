<%-- 
    Document   : _accueil
    Created on : 6 juin 2013, 12:29:19
    Author     : stagiaire
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="tp.dao.CRUD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id='centre'>
    <%
        CRUD accueil = new CRUD("pariscope");
        ResultSet rsaccueil = accueil.selectConcertAcceuil(accueil.selectId_categorie());
        String categorie = "";
        int nbCategorie = 0;
        while (rsaccueil.next()) {
            // Lis la première ligne de concert et en réccupère l'id
            String id_concert = rsaccueil.getString(1);
            //si nouvelle categorie
            if (!categorie.equals(rsaccueil.getString(2))) {
                //si elle n'est pas la 1ere
                if (nbCategorie != 0) {
                    out.print("</article>");
                }%>
    <article>
        <!--
            Réccupère le nom de la catégorie et l'affiche une fois en titre de l'article
        -->
        <h1><%=rsaccueil.getString(2)%></h1>
        <%
                //Affectation de la variable catégorie pour la comparer ensuite
                //et ainsi permètre de ne l'afficher qu'une fois
                categorie = rsaccueil.getString(2);
                nbCategorie++;

            }//dans tout les cas%>
        <div class="concert"> 
            <a href="/tppariscope/ControleurConcert?action='voirConcert'&id='<%=rsaccueil.getInt(1)%>'">
                <!--
                    Affiche le titre d'un concert
                -->
                <h3><%=rsaccueil.getString(3) != null ? rsaccueil.getString(3) : ""%></h3>
                <% for (int i = 4; i < 10; i++) {
                %>
                <!--
                    Affiche un concert en bouclant dans le resultset tous les éléments d'un concert
                -->
                <p><%=rsaccueil.getString(i) != null && rsaccueil.getString(i) != id_concert ? rsaccueil.getString(i) : ""%><p>
                    <%}%>
            </a>
        </div>

        <%}%>
    </article>

</div>