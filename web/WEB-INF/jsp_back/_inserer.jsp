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
        ResultSet lrsLieux = null;

        String[] asrs = new String[20];

        if (request.getAttribute("id") != null) {
            CRUD crud = new CRUD("pariscope");
            lrs = crud.selectAllJOIN(request.getAttribute("id").toString());
            // --- concerts 1 à 10
            // --- categories 11 et 12
            // --- lieux 13 à 15
            lrs.next();
            if (lrs != null) {

                asrs[2] = lrs.getString(2).toString();
                asrs[3] = lrs.getString(3).toString();
                asrs[3] = lrs.getString(3).toString();
                asrs[4] = lrs.getString(4).toString();
                asrs[5] = lrs.getString(5);
                asrs[6] = lrs.getString(6).toString();
                asrs[7] = lrs.getString(7).toString();
                asrs[8] = lrs.getString(8).toString();
                asrs[9] = lrs.getString(9).toString();
                asrs[13] = lrs.getString(13).toString();
            }
            String[] element = {"*"};

            lrsCategories = crud.selectFrom("categories", element);

        }

    %>
    <body>
        <h1>Insertion</h1>
        <div id="formulaire">
            <form action="/tppariscope/ControleurBackOff" method="post">
                <input type="hidden" name="action" value="<%=request.getAttribute("id") != null ? "_modifierValidation" : "_insererValidation"%>">
                <%if (request.getAttribute("id") != null) {
                %><input type="hidden" name="id" value="<%=request.getAttribute("id")%>" /><%}%>

                <label for="categorie">categorie : </label>
                <!--
                selecteur de categorie
                -->
                <select name="categorie" id="categorie">
                    <%
                if (request.getAttribute("id") != null) {
                        while (lrsCategories.next()) {
                            if (asrs[2].equals(lrsCategories.getString(1).toString()) && request.getAttribute("id") != null) {
                    %>
                    <option value="<%=lrsCategories.getString(1).toString()%>" selected="selected"><%=lrsCategories.getString(2).toString()%></option>
                    <%
                    } else {
                    %>
                    <option value="<%=lrsCategories.getString(1).toString()%>"><%=lrsCategories.getString(2).toString()%></option>
                    <%
                            } // --- Fin if else
                        } // --- Fin boucle while next
                }
                    %>
                </select>

                <label for="titre">titre : </label>
                <input type="text" name="titre" id="categorie" value="<%=asrs[3]%>">

                <label for="date">date : </label>
                <input type="date" name="date" id="date" value="<%=asrs[4]%>">

                <label for="heure">heure : </label>
                <input type="time" name="heure" id="heure" value="<%=asrs[5]%>">

                <!--
                selecteur de lieu
                -->
                <label for="lieu">lieu : </label>
                <select name="lieu" id="lieu">
                    <%
                        String[] element = {"*"};

                        if (request.getAttribute("id") != null) {
                            CRUD crud = new CRUD("pariscope");
                            lrsLieux = crud.selectFrom("lieux", element);
                            while (lrsLieux.next()) {
                                if (asrs[13].equals(lrsLieux.getString(1).toString()) && request.getAttribute("id") != null) {
                    %>
                    <option value="<%=lrsLieux.getString(1).toString()%>" selected="selected"><%=lrsLieux.getString(2).toString()%> - <%=lrsLieux.getString(3).toString()%></option>
                    <%
                    } else {
                    %>
                    <option value="<%=lrsLieux.getString(1).toString()%>"><%=lrsLieux.getString(2).toString()%> - <%=lrsLieux.getString(3).toString()%></option>
                    <%
                                } // --- Fin if else
                            } // --- Fin boucle while next
                        }
                    %>
                </select>


                <label for="prix">prix : </label>
                <input type="text" name="prix" id="prix" value="<%=asrs[7]%>">

                <label for="description">description : </label>
                <textarea name="description" id="description" placeholder="<%=asrs[8]%>"></textarea>

                <label for="lien">lien reservation : </label>
                <input type="text" name="lien" id="lien" value="<%=asrs[9]%>">
                <br>
                <input type="submit" >
            </form>
        </div>

    </body>
</html>
