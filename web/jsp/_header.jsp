<%-- 
    Document   : _header
    Created on : 4 juin 2013, 13:35:50
    Author     : Cyrius
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <img src="/tppariscope/img/pariscope_header.png" alt="PARISCOPE">
        <form action="/tppariscope/ControleurConcert" method="post">
        <input type="hidden" name="action" value="_rechercher">
        <input type="text" name="recherche" id="rechercher">
        <input type="submit" value="rechercher" >
    </form>
    
</header>
