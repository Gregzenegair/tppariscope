<%-- 
    Document   : _modifUnRedac
    Created on : 5 juin 2013, 20:48:13
    Author     : Cyrius
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet rsUtilisateurs = (ResultSet) request.getAttribute("un_utilisateur");
    rsUtilisateurs.next();
    int rang = rsUtilisateurs.getInt(4);
    String login = rsUtilisateurs.getString(2);
    String mdp = rsUtilisateurs.getString(3);
    int id = rsUtilisateurs.getInt(1);
%>

<h1>Modifier Rédacteur</h1>
<form action="/tppariscope/ControleurAdmin" method="post" >
    <input type="hidden" name="action" value="modifRedac"/>
    <input type="hidden" name="idmodif" value="<%=id%>"/>
    Login <input type="text" name="login" value="<%=login%>"/><br/>
    Mot de passe <input type="text" name="mdp" value="<%=mdp%>"/><br/>
    Admin <input type="checkbox" name="admin" value="admin" <%=rang == 1 ? "checked=\"\"" : ""%>/><br/>
    <input type="submit" value="Modifier"/>
</form>
<%
    if (request.getAttribute("updateOK") != null) {
        out.print(request.getAttribute("updateOK"));
    }
%>