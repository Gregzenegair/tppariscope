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
            String lsURL = lsContexte + "/ControleurBackOff?action=_accueil";
            out.println("<meta http-equiv='refresh' content='1; url=" + lsURL + "' />");
            // <meta http-equiv='refresh' content='secondes; url=url' />
%>
    </head>
    <body>

    </body>
</html>
