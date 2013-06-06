<%-- 
    Document   : _concert
    Created on : 6 juin 2013, 12:45:38
    Author     : stagiaire
--%>

<%@page import="tp.dao.CRUD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="concert">    
    <a href="/tppariscope/ControleurConcert?action='voirConcert'&id='1'">
        <h3>Académie de l'opera-comique</h3>
        <p>"Les milles et une nuit à l'opera",</p>
        <p>Concert commenté,</p>
        <p>14h30,</p>
        <p>Opera-Comique,</p>
        <p>5,rue Favart (2ème),</p>
        <p>M°Richelieu-Drouot,</p>
        <p>0.825.01.01.23,</p>
        <p>pl: 13€</p>
        <%
          //  CRUD concert = new CRUD("pariscope");
            //ResultSet lsConcertIncluse = concert.selectAllCC();
            //while (lsConcertIncluse.next()) {
              //  for (int i = 0; i < 5; i++) {
                //    out.print("<p>");
                  //  out.print(lsConcertIncluse.getString(i));
                    //out.print("</p>");
                //}
           // }
        %>

    </a>
</div>