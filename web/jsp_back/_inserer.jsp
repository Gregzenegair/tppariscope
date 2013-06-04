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
        ResultSet lrs=null;
        if (request.getAttribute("id")!=null){
            CRUD crud = new CRUD("pariscope");
            ArrayList<String[]> condition= crud.genCondition("id",request.getAttribute("id").toString());
            String[] element={"*"};
            lrs = crud.selectWhere("concerts",element,condition);
            lrs.next();
        }
    %>
    <body>
        <h1>Insertion</h1>
        <form action="/tppariscope/ControleurBackOff" method="post">
            <input type="hidden" name="action" value="<%=request.getAttribute("id")!=null?"_modifierValidation":"_insererValidation"%>">
            
            <label for="categorie">categorie : </label>
            <input type="text" name="categorie" id="categorie" value="<%=lrs!=null?Integer.toString(lrs.getInt(2)):""%>" />
            
            <label for="titre">titre : </label>
            <input type="text" name="titre" id="categorie" value="<%=lrs!=null?lrs.getString(3):""%>">
            
            <label for="date">date : </label>
            <input type="text" name="date" id="date" value="<%=lrs!=null?lrs.getObject(4).toString():""%>">
            
            <label for="lieu">lieu : </label>
            <input type="text" name="lieu" id="lieu" value="<%=lrs!=null?lrs.getString(5):""%>">
            
            <label for="prix">prix : </label>
            <input type="text" name="prix" id="prix" value="<%=lrs!=null?Integer.toString(lrs.getInt(6)):""%>">
            
            <label for="description">description : </label>
            <input type="text" name="description" id="description" value="<%=lrs!=null?lrs.getString(7):""%>">
            
            <label for="lien">lien reservation : </label>
            <input type="text" name="lien" id="lien" value="<%=lrs!=null?lrs.getString(8):""%>">
            
            <input type="submit" >
        </form>
    </body>
</html>
