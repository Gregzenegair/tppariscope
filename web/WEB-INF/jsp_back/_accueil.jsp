<%-- 
    Document   : _accueil
    Created on : 4 juin 2013, 13:38:26
    Author     : Cyrius
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<article>
    BIENVENUE  sur le back off de pariscope
    <%
        if (request.getAttribute("elements") != null) {
            ResultSet selectAll = (ResultSet) request.getAttribute("elements");
            //on boucle le contenu
            while(selectAll.next()){
                out.println(selectAll.getString(3));
                out.println(selectAll.getString(5));
            }
        }else {
            out.print("Aucun élément à afficher");
        }
    %>
</article>
