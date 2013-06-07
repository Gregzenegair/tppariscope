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
        String[] id_categorie={"1","4"};
        ResultSet rsaccueil = accueil.selectConcertAcceuil(id_categorie);
        String categorie = "";
        int nbCategorie = 0;
        while (rsaccueil.next()) {
            if (!categorie.equals(rsaccueil.getString(2))) {
                if (nbCategorie != 0) {
                    out.print("</article>");
                }%>
    <article>
        <h1><%=rsaccueil.getString(2)%></h1>
        <%
                categorie = rsaccueil.getString(2);
                nbCategorie++;

            }%>
        <div class="concert"> 
            <a href="/tppariscope/ControleurConcert?action='voirConcert'&id='<%=rsaccueil.getInt(1)%>'">
                <h3><%=rsaccueil.getString(3) != null ? rsaccueil.getString(3) : ""%></h3>
                <% for (int i = 4; i < 10 ; i++) {%>
                <p><%=rsaccueil.getString(i) != null ? rsaccueil.getString(i) : ""%><p>
                    <%}%>
            </a>
        </div>

        <%}%>
    </article>

</div>