/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tp.dao.CRUD;

/**
 *
 * @author Cyrius
 */
public class ControleurBackOffElements extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CRUD crudElement = new CRUD("pariscope");
        // les actions à gérer
        if (request.getParameter("fragment") != null) {
            if (request.getParameter("action") != null) {
                String sAction = request.getParameter("action");
                switch (sAction) {
                    case "suppElement":
                        // on prépare un attribut qui affichera un nouveau bouton pour confirmer la suppression
                        String valideSuppression = "Etes vous sûr de vouloir supprimer l'élément <em>" + request.getParameter("id") + "</em> de la liste ? "
                                + "<form action=\"/tppariscope/ControleurBackOffElements\" method=\"post\">"
                                + "<input type=\"hidden\" name=\"action\" value=\"validSuppElement\" />"
                                 + "<input type=\"hidden\" name=\"id\" value=\"" + request.getParameter("id") + "\"/>"
                                + "<input type=\"hidden\" name=\"table\" value=\"" + request.getParameter("table") + "\"/>"
                                + "<input type=\"hidden\" name=\"fragment\" value=\""+request.getParameter("fragment")+"\"/>"
                                + "<input type=\"submit\" value=\"Valider Suppression\"/></form>"
                                //annuler
                                + "<form action=\"/tppariscope/ControleurAdmin\" method=\"post\">"
                                + "<input type=\"hidden\" name=\"page\" value=\"_modifRedac\" />"
                                + "<input type=\"submit\" value=\"Annuler\"/>"
                                + "</form>";
                        request.setAttribute("suppOK", valideSuppression);
                        break;
                    case "validSuppElement":
                        String id = request.getParameter("id");
                        String table = request.getParameter("table");
                        String colonne = table.substring(0, table.length() - 1);
                        crudElement.deleteWhere(table, CRUD.genCondition("id_" + colonne, id));
                        break;
                        
                    case "modifElement":
                        
                        break;
                }
            }
            // les fragments à afficher
            ResultSet selectElement = null;
            String lsFragment = request.getParameter("fragment");
            switch (lsFragment) {
                case "_lieux":
                    selectElement = crudElement.selectAll("lieux");
                    request.setAttribute("rsLieux", selectElement);
                    request.setAttribute("fragment", lsFragment);
                    break;
                case "_artistes":
                    selectElement = crudElement.selectAll("artistes");
                    request.setAttribute("rsArtiste", selectElement);
                    request.setAttribute("fragment", lsFragment);
                    break;
                case "_categories":
                    selectElement = crudElement.selectAll("categories");
                    request.setAttribute("rsCategorie", selectElement);
                    request.setAttribute("fragment", lsFragment);
                    break;
            }



        }

        getServletContext().getRequestDispatcher("/ControleurBackOff?action=_ajoutElements").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
