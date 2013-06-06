<%@page import="tp.dao.CRUD"%>
<%@page import="java.sql.ResultSet"%>
<article>
    <h1>Artistes au choix pour le concert : </h1>
    <%

        ResultSet lrsAll = null;

        if (request.getAttribute("resultset") != null) {
            ResultSet lrs = (ResultSet) request.getAttribute("resultset");

            boolean bEstDansLeRS = false;
            CRUD crudAllLigArtistes = new CRUD("pariscope");
            lrsAll = crudAllLigArtistes.selectAllLigArtistes(request.getAttribute("id").toString());
    %>
    <form action='/tppariscope/ControleurBackOff?action=_nouveauLigartistes' method='post'>
        <input type="hidden" name="id" value="<%=request.getAttribute("id")%>" />
        <%
            while (lrs.next()) {

                bEstDansLeRS = false;
                while (lrsAll.next()) {
                    if (lrs.getInt(1) == (lrsAll.getInt(3))) {
                        bEstDansLeRS = true;
                        break;
                    }
                }
                lrsAll.first();
        %>

        <input name="checkartistes" type="checkbox" value="<%=lrs.getString(1).toString()%>" <%=bEstDansLeRS == true ? "checked" : ""%>>
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
