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
public class ControleurBackOff extends HttpServlet {

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
        String redirection = null;
        //connexion à la base pariscope
        CRUD database = new CRUD("pariscope");
        //le switch principal en cas d'actions
        String lsNomPageInclusion = new String();
        
        
        if (request.getParameter("autent").equals("checkUtilisateur")) {
            String login = request.getParameter("login");
            String mdp = request.getParameter("mdp");
            boolean check = database.checkUtilisateur("redacteurs", "login", "mdp", login,mdp );
            if (check) {
                request.setAttribute("checked", true);
                request.setAttribute("inclusion", "_accueil.jsp");
                redirection = "/jsp_back/BackOff.jsp";
            }else {
               redirection = "/index.jsp";
            }

        }

        if (request.getParameter("action") != null ) {

            lsNomPageInclusion = request.getParameter("action") + ".jsp";
            request.setAttribute("inclusion", lsNomPageInclusion);

            //récupération de tout les éléments de la table concerts
            ResultSet selectAll = database.selectAll("concerts");
            request.setAttribute("elements", selectAll);
        }

        getServletContext().getRequestDispatcher(redirection).forward(request, response);// là il renverra : http://WebAppJSP/jsp/_modeleBIS.jsp?contenu=Fragment(nom de l'action).jsp

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
