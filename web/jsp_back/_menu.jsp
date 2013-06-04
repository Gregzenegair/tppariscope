<%-- 
    Document   : _menu
    Created on : 4 juin 2013, 13:36:23
    Author     : Cyrius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav>
    <form action="/tppariscope/ControleurBackOff" method="post">
        <input type="hidden" name="action" value="inserer">
        <input type="submit" value="Inserer">
    </form>
    <form action="/tppariscope/ControleurBackOff" method="post">
        <input type="hidden" name="action" value="accueil">
        <input type="submit" value="accueil">
    </form>
</nav>
