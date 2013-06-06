<%-- 
    Document   : _inserer
    Created on : 4 juin 2013, 14:29:55
    Author     : stagiaire
--%>

<%@page import="java.util.Iterator"%>
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
        ResultSet lrsArtistes = null;

        String[] asrs = new String[20];

        if (request.getAttribute("message") != null) {
            out.print(request.getAttribute("message"));
        }

        if (request.getAttribute("id") != null) {
            CRUD crud = new CRUD("pariscope");
            lrs = crud.selectAllJOIN(request.getAttribute("id").toString());
            // --- concerts 1 à 10
            // --- categories 11 et 12
            // --- lieux 13 à 15
            lrs.next();
            if (lrs != null) {

                asrs[2] = lrs.getString(2);
                asrs[3] = lrs.getString(3);
                asrs[4] = lrs.getString(4).toString();
                asrs[5] = lrs.getString(5);
                asrs[6] = lrs.getString(6);
                asrs[7] = lrs.getString(7).toString();
                asrs[8] = lrs.getString(8);
                asrs[9] = lrs.getString(9);
                asrs[13] = lrs.getString(13);
            }


        }

        String[] element = {"*"};
        CRUD crudCategories = new CRUD("pariscope");
        lrsCategories = crudCategories.selectFrom("categories", element);

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
                    } else {
                        while (lrsCategories.next()) {
                    %>
                    <option value="<%=lrsCategories.getString(1).toString()%>"><%=lrsCategories.getString(2).toString()%></option>
                    <%
                            } // --- Fin while next
                        } // --- Fin else
                    %>
                </select>

                <label for="titre">titre : </label>
                <input type="text" name="titre" id="categorie" value="<%=asrs[3] != null ? asrs[3] : ""%>">

                <label for="date">date : </label>
                <input type="date" name="date" id="date" value="<%=asrs[4] != null ? asrs[4] : ""%>">

                <label for="heure">heure : </label>
                <input type="time" name="heure" id="heure" value="<%=asrs[5] != null ? asrs[5] : ""%>" required="required">

                <!--
                selecteur de lieu
                -->
                <label for="lieu">lieu : </label>
                <select name="lieu" id="lieu">
                    <%
                        CRUD crudLieux = new CRUD("pariscope");
                        lrsLieux = crudLieux.selectFrom("lieux", element);

                        if (request.getAttribute("id") != null) {
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
                    } else {
                        while (lrsLieux.next()) {
                    %>
                    <option value="<%=lrsLieux.getString(1).toString()%>"><%=lrsLieux.getString(2).toString()%> - <%=lrsLieux.getString(3).toString()%></option>
                    <%
                            } // --- Fin while next
                        } // --- Fin else
                    %>
                </select>


                <label for="prix">prix : </label>
                <input type="text" name="prix" id="prix" value="<%=asrs[7] != null ? asrs[7] : ""%>">

                <label for="description">description : </label>
                <textarea name="description" id="description" placeholder="Renseignez ici la description du concert"><%=asrs[8] != null ? asrs[8] : ""%></textarea>

                <label for="lien">lien reservation : </label>
                <input type="text" name="lien" id="lien" value="<%=asrs[9] != null ? asrs[9] : ""%>">
                <br>
                <input type="submit" >
            </form>
        </div>

    </body>
</html>
