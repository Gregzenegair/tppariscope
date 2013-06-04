<%-- 
    Document   : _inserer
    Created on : 4 juin 2013, 14:29:55
    Author     : stagiaire
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insertion</h1>
        <form action="/tppariscope/ControleurBackOff" method="post">
            <input type="hidden" name="action" value="_insererValidation">
            
            <label for="categorie">categorie : </label>
            <input type="text" name="categorie" id="categorie">
            
            <label for="titre">titre : </label>
            <input type="text" name="titre" id="categorie">
            
            <label for="date">date : </label>
            <input type="text" name="date" id="date">
            
            <label for="lieu">lieu : </label>
            <input type="text" name="lieu" id="lieu">
            
            <label for="prix">prix : </label>
            <input type="text" name="prix" id="prix">
            
            <label for="description">description : </label>
            <input type="text" name="description" id="description">
            
            <label for="lien">lien reservation : </label>
            <input type="text" name="lien" id="lien">
            
            <input type="submit" value="Ajouter">
        </form>
    </body>
</html>
