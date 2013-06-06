<%-- 
    Document   : _menu
    Created on : 4 juin 2013, 13:36:23
    Author     : Cyrius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String lsContexte = request.getContextPath();// on récupère http://....
%>
<nav>
    <form action="/tppariscope/ControleurBackOff" method="post">
        <input type="hidden" name="action" value="_inserer">
        <input type="submit" value="Inserer">
    </form>
    <form action="/tppariscope/ControleurBackOff" method="post">
        <input type="hidden" name="action" value="_accueil">
        <input type="submit" value="accueil">
    </form>
    <form action="/tppariscope/ControleurBackOff" method="post">
        <input type="hidden" name="action" value="_ajoutElements">
        <input type="submit" value="Ajout Elements">
    </form>

    <%
        if (request.getSession().getAttribute("utilisateur").equals("admin")) {
    %>
    <form action="/tppariscope/ControleurAdmin" method="post">
        <input type="hidden" name="page" value="_insereRedac">
        <input type="submit" value="Inserer Utilisateur">
    </form>
    <form action="/tppariscope/ControleurAdmin" method="post">
        <input type="hidden" name="page" value="_modifRedac">
        <input type="submit" value="Modifier Utilisateur">
    </form>
    <form action="/tppariscope/ControleurAdmin" method="post">
        <input type="hidden" name="page" value="_validerSupp">
        <input type="submit" value="Valider Suppression">
    </form>
    <%        }
    %>
    <form action="/tppariscope/index.jsp" method="post">
        <input type="submit" value="Deconnexion">
    </form>
</nav>
