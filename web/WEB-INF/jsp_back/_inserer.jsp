<%-- 
    Document   : _inserer
    Created on : 4 juin 2013, 14:29:55
    Author     : stagiaire
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="tp.dao.CRUD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        ResultSet lrs = null;
        ResultSet lrsCategories = null;
        String[] asCategories = new String[2];
        //asCategories[0] = "id_categorie";
        //asCategories[1] = "categorie";
        if (request.getAttribute("id") != null) {
            CRUD crud = new CRUD("pariscope");
            String[] element = {"*"};

            lrsCategories = crud.selectFrom("categories", element);
        }
    %>
    <body>
        <h1>Insertion</h1>
        <form action="/tppariscope/ControleurBackOff" method="post">
            <input type="hidden" name="action" value="<%=request.getAttribute("id") != null ? "_modifierValidation" : "_insererValidation"%>">
            <%if (request.getAttribute("id") != null) {
            %><input type="hidden" name="id" value="<%=request.getAttribute("id")%>" /><%}%>

            <label for="categorie">categorie : </label>
            <select name="categorie" id="categorie">
                <%
                    while (lrsCategories.next()) {
                        if (2==3) {
                %>
                <option value="<%=lrsCategories.getString(1).toString()%>" selected="selected"><%=lrsCategories.getString(2).toString()%></option>
                <%
                } else {
                %>
                <option value="<%=lrsCategories.getString(1).toString()%>"><%=lrsCategories.getString(2).toString()%></option>
                <%
                        } // --- Fin if else
                    } // --- Fin boucle while next

                    lrsCategories.close();
                    CRUD crud = new CRUD("pariscope");
                    lrs = crud.selectAllJOIN(request.getAttribute("id").toString());

                    lrs.next();
                %>
            </select>

            <label for="titre">titre : </label>
            <input type="text" name="titre" id="categorie" value="<%=lrs != null ? lrs.getString(3) : ""%>">

            <label for="date">date : </label>
            <input type="date" name="date" id="date" value="<%=lrs != null ? lrs.getString(4).toString() : ""%>">

            <label for="heure">heure : </label>
            <input type="time" name="heure" id="heure" value="<%=lrs != null ? lrs.getString(5) : ""%>">

            <label for="lieu">lieu : </label>
            <input type="text" name="lieu" id="lieu" value="<%=lrs != null ? lrs.getString(6).toString() : ""%>">

            <label for="prix">prix : </label>
            <input type="text" name="prix" id="prix" value="<%=lrs != null ? lrs.getString(7).toString() : ""%>">

            <label for="description">description : </label>
            <textarea name="description" id="description" placeholder="<%=lrs != null ? lrs.getString(8).toString() : ""%>"></textarea>

            <label for="lien">lien reservation : </label>
            <input type="text" name="lien" id="lien" value="<%=lrs != null ? lrs.getString(9).toString() : ""%>">
            <br>
            <input type="submit" >
        </form>
    </body>
</html>
