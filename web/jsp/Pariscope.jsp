<%-- 
    Document   : Pariscope
    Created on : 6 juin 2013, 12:22:54
    Author     : stagiaire
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="/tppariscope/css/gangnam_style.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Quicksand|Raleway:400,100' rel='stylesheet' type='text/css'>
        <title>Pariscope</title>
    </head>
    <body>
        <%@include  file="_header.jsp" %>
        <%@include  file="_slider.jsp" %>
        <article>

            <%
                String lsPageIncluse = "";
                // Si des parametres sont a passer a la page incluse
                String lsParametre = "";

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

