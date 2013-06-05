<%-- 
    Document   : index
    Created on : 4 juin 2013, 12:04:13
    Author     : Gregzenegair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Utilisation du controleur -->
        <%
            String lsContexte = request.getContextPath();
        %>
    </head>
    <body>
        <form action="/tppariscope/ControleurUtilisateur" method="post">
            Login:<input type="text" name="login" />
            Mot de passe:<input type="password" name="mdp"  />
            <input type="hidden" name="action" value="checkUtilisateur"/>
            <input type="submit"/>
        </form>
    </body>
</html>
