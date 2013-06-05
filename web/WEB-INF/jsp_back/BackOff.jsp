<%-- 
    Document   : BackOff
    Created on : 4 juin 2013, 13:25:33
    Author     : Cyrius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
            <link href="/tppariscope/css/backoff_style.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include  file="_header.jsp" %>
        <%@include  file="_menu.jsp" %>
        <article>

            <%
                String lsPageIncluse = "";
                // Si des parametres sont a passer a la page incluse
                String lsParametre = "";

                if (request.getSession().getAttribute("utilisateur").equals("admin")) {
            %>
            <jsp:include page="_admin.jsp" flush="true"/>
            <%                    }

                if (request.getAttribute("inclusion") != null) {
                    lsPageIncluse = request.getAttribute("inclusion").toString();
                } else {
                    lsPageIncluse = "_accueil.jsp";
                }

            %>

            <!-- Element action de JSP : inclusion dynamique -->
            <jsp:include page="<%= lsPageIncluse%>" flush="true">
                <jsp:param name="id" value="<%= lsParametre%>" />
            </jsp:include>

        </article>
        <%@include  file="_footer.jsp" %>
    </body>
</html>
