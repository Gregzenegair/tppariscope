<%-- 
    Document   : _header
    Created on : 4 juin 2013, 13:35:50
    Author     : Cyrius
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <h1>HEADER BACK OFF</h1>
        <form action="/tppariscope/ControleurBackOff" method="post">
        <input type="hidden" name="action" value="_rechercher">
        <input type="text" name="recherche" id="rechercher">
        <input type="submit" value="rechercher" >
    </form>
    
</header>
