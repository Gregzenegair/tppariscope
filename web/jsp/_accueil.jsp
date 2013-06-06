<%-- 
    Document   : _accueil
    Created on : 6 juin 2013, 12:29:19
    Author     : stagiaire
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id='centre'>
    
<article>
    <a href="/tppariscope/ControleurConcert?action='voirConcert'&id='1'">
        <h1>concerts clasique</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
    </a>
</article>
<article>
        <h1>concerts hors paris</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>
<article>
        <h1>musique du monde</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>
<article>
        <h1>danse</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>
<article>
        <h1>opéras</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>
<article>
        <h1>variétés</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>
<article>
        <h1>jazz</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>
<article>
        <h1>pop-rock</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>
<article>
        <h1>musique électronique</h1>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
        <%@include  file="_concert.jsp" %>
</article>

</div>