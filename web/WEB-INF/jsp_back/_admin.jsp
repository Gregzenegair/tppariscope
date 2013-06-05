<%-- 
    Document   : _admin
    Created on : 5 juin 2013, 12:23:04
    Author     : Cyrius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<p>
    <%
        String lsContexte = request.getContextPath();// on récupère http://....
    %>
    <a href="<%=lsContexte%>/ControleurAdmin?page=_insereRedac">Ajouter un Rédacteur</a>&nbsp;|&nbsp;
    <a href="<%=lsContexte%>/ControleurAdmin?page=_modifRedac">Modifier un rédacteur</a>&nbsp;|&nbsp;
    <a href="<%=lsContexte%>/ControleurAdmin?page=_validerSupp">Valider suppressions articles</a>&nbsp;|&nbsp;
</p>
