<%-- 
    Document   : _insereRedac
    Created on : 5 juin 2013, 12:34:03
    Author     : Cyrius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Inserer Nouveau Rédacteur</h1>

<form action="/tppariscope/ControleurAdmin" method="post" >
    <input type="hidden" name="action" value="insereRedac"/>
    Login <input type="text" name="login" value="chris"/><br/>
    Mot de passe <input type="text" name="mdp" value="mdp"/><br/>
    Admin <input type="checkbox" name="admin" value="admin" /><br/>
    <input type="submit"/>

</form>


