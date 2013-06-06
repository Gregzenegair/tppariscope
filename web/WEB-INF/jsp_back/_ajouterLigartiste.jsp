<%@page import="java.sql.ResultSet"%>
<article>
    <h1>Artistes au choix : </h1>
    <%
        if (request.getAttribute("resultset") != null) {
            ResultSet lrs = (ResultSet) request.getAttribute("resultset");

    %>
    <form action='/tppariscope/ControleurBackOff?action=_nouveauLigartites' method='post'>
        <input type="hidden" name="id" value="<%=request.getAttribute("id")%>" />
        <%
            while (lrs.next()) {
        %>
        
        <input name="checkartistes[<%=lrs.getString(1) %>]" type="checkbox" value="<%=lrs.getString(1).toString() %>">
        <%=lrs.getString(3).toString()%> <%=lrs.getString(2).toString()%>
        <br>
        
        <%
            }
        %>
        <input type='submit'>
    </form>
    <%
        }



    %>
</article>
