<%-- 
    Document   : _ajoutElements
    Created on : 6 juin 2013, 15:28:06
    Author     : Cyrius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<article>
    <nav>
        <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_lieux">
        <input type="submit" value="Lieux">
    </form>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_artistes">
        <input type="submit" value="Artistes">
    </form>
    <form action="/tppariscope/ControleurBackOffElements" method="post">
        <input type="hidden" name="fragment" value="_categories">
        <input type="submit" value="Categories">
    </form>
    </nav>
    <article>
        <%
                String lsFragmentIncluse = "";
                // Si des parametres sont a passer a la page incluse
                String lsParametre = "";

                if (request.getAttribute("fragment") != null) {
                    lsFragmentIncluse = "elements/"+request.getAttribute("fragment").toString()+".jsp";
                } else {
                    lsFragmentIncluse = "elements/_selection.jsp";
                }

            %>

            <!-- Element action de JSP : inclusion dynamique -->
            <jsp:include page="<%= lsFragmentIncluse%>" flush="true">
                <jsp:param name="id" value="<%= lsParametre%>" />
            </jsp:include>
    </article>
</article>
